#!/bin/sh -e
##:
#h: Usage: ./build.sh PGC.txt > pgc.hledger
#h:
#h: Generate "pgc.hledger" from a long PGC description found in
#h: https://drive.google.com/file/d/0B0nB09r-PlKAYTc1ZGViNzMtNTc2MS00OTk5LTllYzYtYTA3YTdhYWE4ODRi/view?hl=es&pli=1&resourcekey=0-zzi02f7zX7qZgMjhauj4ng
#h:
#h: Good description in
#h: https://www.plangeneralcontable.com/?tit=listado-de-contenidos&name=GeTia&contentId=mod_list&contGroupId=ctg_31
##:
build_sh() {
    local short g_group subgroup subgroup_n g_type type group tags
    local account subgroup_candidate
    
    printf 'account %-60s     ; type: %s, desc: %s\n' "P:NoCorriente" "L" "pasivo no corriente"
    printf 'account %-60s     ; type: %s, desc: %s\n' "P:Corriente"   "L" "pasivo corriente"
    
    sed -n '
    /^Grupo/ s|^Grupo |@group |
             s|^\([0-9][0-9]\). |@subgroup \1 |
             s|^\([0-9][0-9][0-9][0-9]*\). |@account \1 |

    s|\.$||
    /^@/p
    ' "$@" \
        | iconv -t ASCII//TRANSLIT \
        | tr '[:upper:]' '[:lower:]' \
        | while read -r method number descr
    do
        ## Some good names.
        short="$(capitalize ${descr})"
        case "${number}" in
            13)  short="AjustesSubvenciones"           ;;
            15)  short="DeudasLargoEspeciales"         ;;
            16)  short="DeudasLargoPartesVinc"         ;;
            17)  short="DeudasLargoPlazo"              ;;
            18)  short="Fianzas"                       ;;
            217) short="Informatica"                   ;;
            24)  short="InversLargoPartesVinc"         ;;
            25)  short="InversLargoPlazo"              ;;
            26)  short="Fianzas"                       ;;
            28)  short="AmortizAcum"                   ;;
            29)  short="Deterioro"                     ;;
            39)  short="Deterioro"                     ;;
            41)  short="Acreedores"                    ;;
            49)  short="Deterioro"                     ;;
            50)  short="DeudasCortoPlazoEspeciales"    ;;
            51)  short="DeudasCortoPlazoPartesVinc"    ;;
            52)  short="DeudasCortoPlazo"              ;;
            53)  short="InvCortoPlazoPartesVinc"       ;;
            54)  short="InvCortoPlazoOtras"            ;;
            56)  short="FianzasRecibidas"              ;;
            572) short="BancosVista"                  ;;
            573) short="BancosVistaMonedaExtranjera"  ;;
            574) short="Bancos"                       ;;
            575) short="BancosMonedaExtranjera"       ;;
            59)  short="Deterioro"                     ;;
            67)  short="ActivosNoCorrientes"           ;;
            69)  short="Deterioro"                     ;;
            70)  short="Ventas"                        ;;
            77)  short="BeneficiosActivosNoCorrientes" ;;
            79)  short="Misc"                          ;;
        esac
        
        ## Group defaults.
        case "${method}-${number}" in
            @group-1) g_group='PN'            subgroup= subgroup_n= g_type='E' ;;
            @group-2) g_group='A:NoCorriente' subgroup= subgroup_n= g_type='A' ;;
            @group-3) g_group='A:Existencias' subgroup= subgroup_n= g_type='A' ;;
            @group-4) g_group='P:Proveedores' subgroup= subgroup_n= g_type='L' ;;
            @group-5) g_group='A:Corriente'   subgroup= subgroup_n= g_type='A' ;;
            @group-6) g_group='G'             subgroup= subgroup_n= g_type='X' ;;
            @group-7) g_group='I'             subgroup= subgroup_n= g_type='R' ;;
            @group-*) echo "FAIL -- ${descr}"; exit 1;;
            @subgroup-*) subgroup="${short}" subgroup_n="${number}";;
        esac
        
        ## Exception accounts.
        case "${number}" in
            14*|16*|17*|18*)         type='L'         group='P:NoCorriente';;
            15*|19*|50*|51*|52*|56*) type='L'         group='P:Corriente';;
            57*)                     type='C'         group='A:Corriente';;
            474*|44*)                type='A'         group='A:NoCorriente';;
            *)                       type="${g_type}" group="${g_group}";;
        esac
        
        ## PGC marks.
        case "${number}" in
            62*) tags="ca-pa-7: y, ca-pa-a: y";;
            70*) tags="ca-pa-1: y, ca-pa-a: y, INCN: y";;
            71*) tags="ca-pa-2: y, ca-pa-a: y";;
            73*) tags="ca-pa-3: y, ca-pa-a: y";;
            *)   tags="";;
        esac
        case "${number}" in
            
        esac
        
        
        ## Print lines.
        case "${method}" in
            @group)
                printf 'account %-60s     ; type: %s, %sdesc: %s\n' "${group}" "${type}" "${tags:+${tags}, }" "${descr}"
                ;;
            @subgroup)
                printf 'account %-60s     ; type: %s, %sdesc: %s\n' "${group}:${subgroup}:${subgroup_n}" "${type}" "${tags:+${tags}, }" "${descr}"
                ;;
            @account)
                ##
                account="${group}"
                ##
                subgroup_candidate="$(echo -n "${number}" | head -c 2)"
                if test @"${subgroup_candidate}" = @"${subgroup_n}"; then
                    account="${account}:${subgroup}"
                    short="${short#${subgroup}}"
                fi
                if test -n "${short}"; then
                    account="${account}:${number}-${short}"
                else
                    account="${account}:${number}"
                fi
                ##
                printf 'account %-60s     ; type: %s, %sdesc: %s\n' "${account}" "${type}" "${tags:+${tags}, }" "${descr}"
                ;;
            @*)
                continue
                ;;
        esac
    done
}
capitalize() {
    local w
    if test ! -n "$6"; then
        while test -n "$1"; do
            case "${1}" in
                de|por|aplicacion|a) true
                                       ;;
                o)
                    break
                    ;;
                *)  echo -n "$1" | head -c 1    | tr '[:lower:]' '[:upper:]'
                    echo -n "$1" | sed 's|^.||' | tr '[:upper:]' '[:lower:]'
                    ;;
            esac
            shift
        done 
        echo ""
    fi | sed '
        s|EjerciciosAnteriores|EA|
        s|SituacionesTransitorias|ST|
        s|Amortizacion|Amortiz|
        s|Acumulada|Acum|
        s|Inmobi[a-z]*|Inmob|
        s|Inmovi[a-z]*|Inm|
        s|Intang[a-z]*|Intang|
        s|Desemb[a-z]*|Desem|
        s|Resultad[a-z]*|Resul|
        s|Pendientes*|Pend|
        s|Reservas*|Resv|
        s|Aportaciones*|Aport|
        s|Provis[a-z]*|Provis|
        s|Responsabilidades|Resp|
        s|Asocia[a-z]*|Asoc|
        s|Administracion[a-z]*|Admin|
        s|Public[a-z]*|Publ|
        s|Periodifi[a-z]*|Periodif|
        s|ProcedentesDel||
        s|Materiales|Material|
        s|<<rappels>>|Rappels|
        s|<<factoring>>|Factoring|
        s|^Valor||
        s|(euros)|Euros|
        s|(monedaExtranjera)|MonedaExtranjera|
        s|^,||
        s|,.*||
        s|YSimilares$||
    '
}


if test @"${SCRNAME:-$(basename "$0")}" = @"build.sh"; then
    case "${1}" in
        -h|--help) sed -n 's/^ *#h: \{0,1\}//p' "$0";;
        *)         build_sh "$@"; exit 0;;
    esac
fi
