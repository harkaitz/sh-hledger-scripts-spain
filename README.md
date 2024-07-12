HLEDGER SCRIPTS - SPAIN
=======================

Resources for hledger(1) to do accounting the way the Spanish Accounting
Regulation (PGC) requires.

- Accounts : [share/hledger-pgc/pgc.hledger](./share/hledger-pgc/pgc.hledger)
- Reports :
  - Cuentas anuales [bin/hledger-ca](./bin/hledger-ca)
  - Modelo 200 [bin/hledger-200](./bin/hledger-200)

## Help

dsetup-dnie

    Usage: dsetup-dnie ...
    
    This script helps installing DNIe software in Debian.
    
    ... i-pkcs11    : Install pcsc, opensc and pkcs11.
    ... i-javaws    : Install javaws via icedtea.
    ... h-firefox   : Print help on how to enabe pkcs11 in firefox.
    ... i-autofirma : Install autofirma program. 
    ... t-valide    : Check DNI card works (autofirma).
    ... t-idazki    : Check DNI card works (idazki).

dsetup-fnmt-rcm

    Usage: dsetup-fnmt-rcm -d (Download) i (Install)
    
    Download ans install FNMT's (Fabrica Nacional de Moneda y Timbre)
    digital certificate generation app for Debian Linux.
    
    Once installed you will be able to ask for a certificate using
    Google Chrome of Firefox.

hledger-200

    Usage: hledger-200 ...
    
    ... pag1  : Caracteres de la declaracion. ... pag18: Deducciones.
    ... pag2  : Identificación.               ... pag19,20,21 : Limitación en la deducibilidad. 
    ... pag3  : Administradores.              ... pag22: Aplicación de resultados.
    ... pag4  : Participaciones.              ... pag23: Deterioro creditos.
    ... pag5  : Extranjero.                   ... pag24: Presentación de documentación
    ... pag6  : Titularidad real.             ... pag25: Inversiones cinematográficas.
    ... pag7  : Administradores.
    ... pag8  : Activo - Inmovilizado material.
    ... pag9  : Activo - Efectivo.
    ... pag10 : Patrimonio Neto.
    ... pag11 : Patrimonio Neto.
    ... pag12,13,14,15,16 : Liquidación.
    ... pag17 : Impuesto diferido.

hledger-ca

    Usage: hledger-ca ...
    
    ... ida1    : Datos Generales de Identificación - IDA1
    ... ida2    : Datos Generales de Identificación - IDA2
    ... itr     : Identificador del titular real.
    ... ds3     : Documento sobre servicios a terceros.
    ... bal     : Balance de Situación.
    ... cpg     : Cuenta de Pérdidas y Ganancias.
    ... dm      : Declaración Medioambiental.
    ... mem ... : Memoria.
    ... ma      : Modelo de Autocartera.
    ... ip      : Instancia de presentación (ayuda).
    ... chd     : Certificado huella digital (ayuda).
    
    Este programa ayuda en la confección de las cuentas anuales abreviadas
    de una S.L. cuando se ha utilizado hledger(1) para la confección de las
    cuentas.

hledger-ca-ba

    Usage: hledger-ca-ba
    
    Print "Cuentas Anuales - Balance de situación".
    
    Environment variables: DATE

hledger-ca-ida1

    Usage: hledger-ca-ida1
    
    Printa información de la empresa.

hledger-ca-ida2

    Usage: hledger-ca-ida2
    
    Aplicación de resultados y período medio de pago a proveedores.

hledger-ca-itr

    Usage: hledger-ca-itr
    
    Declaración de identificación del titular real.

hledger-ca-mem

    Usage: hledger-ca-mem ...
    
    ... 1  : Actividad de la empresa.
    ... 2  : Bases de presentación de las cuentas.
    ... 3  : Normas de registro y valoración.
    ... 4  : Inm. material, intangible e inversiones inmob.
    ... 5  : Activos financieros.
    ... 6  : Pasivos financieros.
    ... 7  : Fondos propios.
    ... 8  : Situación fiscal.
    ... 9  : Operaciones con partes vinculadas.
    ... 10 : Otra información.

hledger-ca-pg

    Usage: hledger-ca-pg
    
    Print "Cuentas Anuales - Perdidas y ganancias".
    
    Environment variables: DATE

hledger-es

    Usage: hledger-es LEDGER-ARGS
    
    Translate hledger output to the spanish language.

hledger-info

    Usage: hledger-info ...
    
    ... show : Show variable values.
    ... help : Show variable documentation.
    
    Source this script to access company information.

hlnk-aeat-sl

    Usage: hlnk-aeat-sl ...
    
    Enlaces y ayuda a la AEAT (Agencia Tributaria).
    
    ... ayuda ...     : Blogs de ayuda y información.
    ... terminos ...  : Ayuda sobre los terminos.
    ... area-personal : Para consulta de notif. y datos censales.
    ... 036           : Alta/baja de actividad, NIF definitivo.
    ... 036-ayuda1    : Instrucciones de como rellenar 036.
    ... 036-ayuda2    : Instrucciones de como rellenar 036.
    ... 303           : Declaración del IVA.
    ... 303-retraso   : Declaración del IVA con retraso.
    ... 303-ayuda-2   : Instrucciones para rellenarlo.
    ... 200           : Rellenar modelo 200.
    ... 200-ayuda-f   : Información sobre las casillas.
    ... 200-manual    : Abre el manual.

hlnk-fnmt-newcert

    Usage: hlnk-fnmt-newcert ...
    
    Enlaces a FNMT (Fabrica Nacional de Moneda y Timbre).
    
    ... nuevo-ayuda : Ayuda para la creación de nuevos certificados.
    ... nuevo       : Empieza a crear un nuevo certificado.
    ... descarga    : Descargar un nuevo certificado.

hlnk-registradores

    Usage: hlnk-registradores ...
    
    Enlaces y referencias a "sede.registradores.org".
    
    ... carpeta : [Registradores.org]->[Mi carpeta]
    ... doc     : Pagina de documentación.
    ... ptc     : Manual de ayuda de Presentación telemática de cuentas.

hlnk-regmer

    Usage: hlnk-regmer ...
    
    Enlaces al Registro Mercantil.
    
    ... madrid-1 : [R.M. de Madrid]->[Impresos]->[Cuentas]
    ... ca ...   : Enlaces para la confección de las cuentas anuales.

htodo-aeat-200

    Usage: htodo-aeat-200
    
    Dates for AEAT 200 model presentation.
    
    Environment variables: HTODO_START_YEAR, HTODO_END_YEAR

htodo-aeat-303

    Usage: htodo-aeat-303
    
    TODO list for AEAT paperwork.
    
    Environment variables: HTODO_START_YEAR, HTODO_END_YEAR

htodo-regm-ca

    Usage: htodo-regm-ca
    
    Dates for "Cuentas Anuales" presentation.
    
    Environment variables: HTODO_START_YEAR, HTODO_END_YEAR

lsetup-registradores-d2

    Usage: lsetup-registradores-d2 ...
    
    ... show   : Show configuration.
    ... i-deps : Install wine dependencies.
    ... i-2023 : Install D2 in your system.
    ... u-2023 : Update D2 in your system.

txtc-200

    Usage: txtc-200 FILE
    
    Match with "Hacienda 200" presentations in spanish.

txtc-303

    Usage: txtc-303 FILE
    
    Match with "Hacienda 303" presentations in spanish.

## Collaborating

For making bug reports, feature requests and donations visit
one of the following links:

1. [gemini://harkadev.com/oss/](gemini://harkadev.com/oss/)
2. [https://harkadev.com/oss/](https://harkadev.com/oss/)
