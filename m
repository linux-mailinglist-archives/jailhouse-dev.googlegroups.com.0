Return-Path: <jailhouse-dev+bncBCK5J67X4EOBBC44Q3ZAKGQEVSL6PQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5F3158094
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Feb 2020 18:08:27 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id v11sf6684378edw.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Feb 2020 09:08:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581354507; cv=pass;
        d=google.com; s=arc-20160816;
        b=aklsakkM9ruxE5iI3IMQizisGAHHJsTnEfQyypHgHCRo4t6VAhzQ73Yxt3m3dQ25IB
         hWGHtrJUBrJwYK1SlCIGwLIJMR9biZSyEPemaH6YoBdijgtalqXyEAcUxEsydI85jTPW
         AchGaJxKb3JyMWsBB+imeJtJcbOwkbFHbFrgKvPFLNgCjwqWGcfxzk99EDc+sQj34j4i
         lj8/oJksN/rKX1TSK6dpH+EEIEuKV8zw0teA+LH0XgCQQqFFhgSBk0osh1Rs5oH+VwX0
         HLCPrGycpINQeMVVgPGpDk2pFOyVeLAqqH9zU/QHf0BJEcrYghPk/MBA5a0F3fk9Eup9
         iHLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:user-agent:date
         :message-id:organization:subject:from:to:sender:dkim-signature;
        bh=n9XQqih1vNhK/KRvnaJoGCEpW2FGNpihbWjJMEv7QlA=;
        b=luHoxmajjXDcmfog1quIFuUCiZf8AHsRZ7DQVM4+C2T5x/iAsbzN+XWdTRYz5aUKiT
         VGKFxP1AvFah+iWBCWNmH5UoEpelm1/JRh/vPzZ1qITs8i0B4GqrcwNEgumkqcslgjWI
         Jq6OgZHyp/3wiYZteh0nZinfS5475b5mVhKTA9rS5idiVaCw7IMvZ8JirNiw++oqvEhY
         jZQ9Jf09HvsVjS6O+5UkPFjo9zPr4ZbRNg62Yy2clopRwLsqrlc1eHDnVwNhmGvsY9W2
         uLhMszZAliwLvEfOoJzEVfyLX9bWNlIO7WP+l3o9ujSKD0rQ8gOcGsIwF5/D+mO5yx1a
         7EKw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=neutral (google.com: 134.106.51.109 is neither permitted nor denied by best guess record for domain of patrick.uven@offis.de) smtp.mailfrom=patrick.uven@offis.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:organization:message-id:date:user-agent
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=n9XQqih1vNhK/KRvnaJoGCEpW2FGNpihbWjJMEv7QlA=;
        b=ZD+C4EBPe5FCJUNkc+KrUUvR3IleAajlRSTabNwAKP60ITNA5SlSNITYcg0DdungUf
         CiPmxtc1x+pjBPHI9CslPucECMedh3XfJYKJsTdAyafGsM2o0USppFo61mvyOngu3c4c
         WAkAyujvzcCw6/5wYb73ZNVdYmVYVy6si+GGjCSKCF0OOYTwtQjWetu7HLNd7m6Id1CG
         /sRj8AlN5peRM+ekZcOGDRwKhpkClNraszdRiRCzOnQxcvwODQa9ZrvJ3d3xNZJlkGv0
         ND2DRTwax3XMek7HnJcCAAjisyNuwfYT2Ujr2jImMXf2SbP1OD1Dfr0n3fMzfRepSdc4
         mHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:organization:message-id
         :date:user-agent:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=n9XQqih1vNhK/KRvnaJoGCEpW2FGNpihbWjJMEv7QlA=;
        b=Bi6mBSYk2FZxQ/8tnc6rsQG+SOxXNvvaQ48L/icP68Ww+4R4aQXquZ9rskgdE9vYMf
         F4m72p3BegL2LW88b6BDxuA+Hv+XB2V5bL7cLchUNaHNRHfXadt2uHDq17/2dQxfB4vg
         XWIft+lBCtG0rPpBijtrcUmhdv4KbBfnwM7pGofWWJZvQBEn9+doXrPboVSadV0QjF+/
         nXHX4JNfZZjqtgrAoK9gVJKre5uKxfBjlhX3rH/MJkoRNhQymV6xqBvFNAOIzz4/ZsKS
         9DeoLxXmLWb1GZtjA3xBVznqA1x4Lacc6x6zXWid6vfKhHLFAAJJAQAzjirg419w9Rwm
         cTLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV0MC6xgbs+kr+do2MgiRt8qUNWYCt/878GWeXro0etZD2CSrJB
	oLN/emUGe2gSj7ZB7PfYFGY=
X-Google-Smtp-Source: APXvYqxY7j4VppOfbd55svKf3l+ibVjGeWHkR8IXbGXMgaXYUMO3J7U+GXSfB/z3jh4tcGqE1lDlkQ==
X-Received: by 2002:a17:906:648c:: with SMTP id e12mr2220526ejm.56.1581354507548;
        Mon, 10 Feb 2020 09:08:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d9ce:: with SMTP id v14ls4160148eds.5.gmail; Mon, 10 Feb
 2020 09:08:26 -0800 (PST)
X-Received: by 2002:aa7:d8ca:: with SMTP id k10mr2053028eds.203.1581354506673;
        Mon, 10 Feb 2020 09:08:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581354506; cv=none;
        d=google.com; s=arc-20160816;
        b=OMYX5FSOQBmS4i0Yms9dRyD5prums3CGmiR+5SYWW1Z/GAHR/wVk15YdrzFt9hZ70D
         jtEGw9Z5ElMvFLcZMSh6+1ZlSn5htCA2Chog8gpel+9zQF7GJgbnLlrwK4rrd7weWAka
         r19X/XQ6LzPpQ0kAfocLh3l0pUQa4iMtLmJV3tClEk4rEVcebE41LIzCgD/iV6EGRXKD
         6Ovhs5JthzcNSQRg4FbEPEvgeBnTJe/2AmZnnBN97Rd6UmgoPB1wkuhBjzQE4nZ590+N
         7TonJtCVKpd49DbmlROppYhsdU+6F2doWq0d6UN+nWN1NiEgsmDiQf7kQ305Ba3OjVKa
         pADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:date:message-id:organization:subject:from
         :to;
        bh=Cnm9wvxrLxDMTcuVh4X12eqGVwucH+13fhi9IxxNfKY=;
        b=kLYoHDfv0L6kePrhe6Na0k317wZjJTPju0yy+Q6CHlQVhl/SVlPBIK7X5cFWJ1bo2p
         +aZJvQaeEKJB7dZcCTZ6f8w+2P6TFe+QuSSNGdInJ7QalDcqJjY/ieB8jj8ilECbZT15
         6zKdKZHpmOsu4QfnqtbrCaKu6uVNRERUwqgkyqwxrzqoF+UFI4zSqCl3pvPu+uOW3AlG
         H2jWxbra2gGmCeT+2Ebm2/UbTuqheqUhab+z0YSFyMjwrHH7Dzf5pzZMgSifRBzmwWCT
         qgleXNSCsxTXjywRl+T0rhmNkBS6Tqa/BJwS55lA1sIEpUT201sy0xgzkYQbUf5CsUdK
         5Jeg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=neutral (google.com: 134.106.51.109 is neither permitted nor denied by best guess record for domain of patrick.uven@offis.de) smtp.mailfrom=patrick.uven@offis.de
Received: from offis4.offis.uni-oldenburg.de (offis4.offis.uni-oldenburg.de. [134.106.51.109])
        by gmr-mx.google.com with ESMTPS id d29si41651edj.0.2020.02.10.09.08.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 09:08:26 -0800 (PST)
Received-SPF: neutral (google.com: 134.106.51.109 is neither permitted nor denied by best guess record for domain of patrick.uven@offis.de) client-ip=134.106.51.109;
Received: from localhost (localhost [127.0.0.1])
	by offis4.offis.uni-oldenburg.de (Postfix) with ESMTP id 6AFDD381352
	for <jailhouse-dev@googlegroups.com>; Mon, 10 Feb 2020 18:08:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at offis4.offis.uni-oldenburg.de
X-Spam-Flag: NO
X-Spam-Score: -9.999
X-Spam-Level: 
X-Spam-Status: No, score=-9.999 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-10, SHORTCIRCUIT=-0.0001, URIBL_BLOCKED=0.001]
	autolearn=disabled
Received: from offis4.offis.uni-oldenburg.de ([127.0.0.1])
	by localhost (offis4.offis.uni-oldenburg.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4k71N1vMnH8 for <jailhouse-dev@googlegroups.com>;
	Mon, 10 Feb 2020 18:08:26 +0100 (CET)
Received: from [10.3.1.60] (ritchie.Informatik.Uni-Oldenburg.DE [134.106.3.254])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by offis4.offis.uni-oldenburg.de (Postfix) with ESMTPS id 2B577381340
	for <jailhouse-dev@googlegroups.com>; Mon, 10 Feb 2020 18:08:26 +0100 (CET)
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Patrick Uven <patrick.uven@offis.de>
Subject: State and maintenance of supported hardware
Organization: =?UTF-8?Q?OFFIS_e=2eV=2e_-_Institut_f=c3=bcr_Informatik?=
Message-ID: <5671a634-b728-b0d2-5702-1cbdcb41b7a5@offis.de>
Date: Mon, 10 Feb 2020 18:08:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms010407000308090808000301"
X-Original-Sender: patrick.uven@offis.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=neutral
 (google.com: 134.106.51.109 is neither permitted nor denied by best guess
 record for domain of patrick.uven@offis.de) smtp.mailfrom=patrick.uven@offis.de
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

This is a cryptographically signed message in MIME format.

--------------ms010407000308090808000301
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm currently evaluating the usage of Jailhouse in a project using the
Nvidia Jetson TX1/2 as well as the Xilinx ZCU102. Seeing both in the
list of supported ARM64 boards, I had high hopes to get them running
quite easy.

Using the guide in the Documentation folder I was able to set up the
ZCU102 with Petalinux 2019.2 and Jailhouse 0.12 (and two patches, [0]
and [1]), but can't get any output from the inmates via UART. There was
another person with this problem on the list, but his workaround isn't
working for me.

With the Nvidia I'm unable to build the latest versions of Jailhouse and
Linux for Tegra with the problem Saroj Sapkota mentioned a few days ago
on this list. I have a running system with the
"evidence/linux-jailhouse-jetson" fork and kernel 4.4.159, but only on
the TX2 (the TX1 kernel is crashing when enabling jailhouse).

Is there more documentation for possible solutions to these problems? Is
anyone maintaining those targets? I think I can get both setups running
(and possibly provide some updated setup guides), but it would be
interesting if there is still anyone "officially" working on them.

Regards, Patrick

[0]http://git.kiszka.org/?p=3Dlinux.git;a=3Dcommitdiff;h=3D70b17485a56b6ff2=
7f44c531ea382c11194327e2;hp=3D4be84b9b39b16493e1577544387e0fccc43cc344
[1]http://git.kiszka.org/?p=3Dlinux.git;a=3Dcommitdiff;h=3D70b17485a56b6ff2=
7f44c531ea382c11194327e2;hp=3D4be84b9b39b16493e1577544387e0fccc43cc344
--=20
Patrick Uven
Researcher

OFFIS e.V. - Institut f=C3=BCr Informatik
FuE Bereich Verkehr | R&D Division Transportation
Escherweg 2, 26121 Oldenburg - Germany
Phone/Fax.: +49 441 9722 425/-278
E-Mail: patrick.uven@offis.de
URL: http://www.offis.de/

Registergericht: Amtsgericht Oldenburg VR 1956
Vorstand: Prof. Dr.-Ing. Wolfgang H. Nebel (Vorsitzender), Prof. Dr.
techn. Susanne Boll-Westermann, Prof. Dr.-Ing. Axel Hahn, Prof. Dr.-Ing.
Andreas Hein, Prof. Dr. Sebastian Lehnhoff

Unsere Hinweise zum Datenschutz sind abrufbar unter:
https://www.offis.de/datentransparenz.html

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5671a634-b728-b0d2-5702-1cbdcb41b7a5%40offis.de.

--------------ms010407000308090808000301
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
EJQwggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYT
AkRFMSswKQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYD
VQQLDBZULVN5c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFs
Um9vdCBDbGFzcyAyMB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNV
BAYTAkRFMUUwQwYDVQQKEzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVu
IEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERG
Ti1WZXJlaW4gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMtg1/9moUHN0vqHl4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZs
FVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8FXRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0p
eQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+BaL2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0
WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qLNupOkSk9s1FcragMvp0049ENF4N1
xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz9AkH4wKGMUZrAcUQDBHHWekC
AwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUk+PYMiba1fFKpZFK4OpL
4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYDVR0TAQH/BAgwBgEB
/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGCLB4wCAYGZ4EM
AQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUvcmwvVGVs
ZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYBBQUH
MAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5j
ZXIwDQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4
eTizDnS6dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/
MOaZ/SLick0+hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3S
PXez7vTXTf/D6OWST1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc2
2CzeIs2LgtjZeOJVEqM7h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bP
ZYoaorVyGTkwggWsMIIElKADAgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYD
VQQGEwJERTFFMEMGA1UEChM8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hl
biBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRE
Rk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcN
MzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9l
cmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UE
CwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp1xCeOdfZojDbchwFfylf
S2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6WLkDh0YNMZj0cZGnl
m6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mITQ5HjUhfZZkQ
0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUkP7agCwf9
TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22MZD08
WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAd
BgNVHQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK
4OpL4qIMz+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIu
cGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYB
BQUHAQEEgdAwgc0wMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1T
ZXJ2ZXIvT0NTUDBKBggrBgEFBQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwt
cm9vdC1nMi1jYS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9j
ZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0
MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21
rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCNT1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7L
n8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+lgQCXISoKTlslPwQkgZ7nu7YRrQb
tQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v9NsH1VuEGMGpuEvObJAaguS5
Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7EUkp2KgtdRXYShjqFu9V
NCIaE40GMIIFyjCCBLKgAwIBAgIMITmI1c3vIHv7iIYYMA0GCSqGSIb3DQEBCwUAMIGNMQsw
CQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRz
Y2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTE5MDcwMTEzMzE1M1oXDTIyMDYz
MDEzMzE1M1owZjELMAkGA1UEBhMCREUxFjAUBgNVBAgMDU5pZWRlcnNhY2hzZW4xEjAQBgNV
BAcMCU9sZGVuYnVyZzEUMBIGA1UECgwLT0ZGSVMgZS4gVi4xFTATBgNVBAMMDFBhdHJpY2sg
VXZlbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOOrzCKCtEYgHnEKMFt6nmo7
gXu/gQbFwHR9qDxQ62rYoGJmlfsujiuUCxxuD4Ci6PwcjnxHVwKI2/jFHS0k/jPwRnK1Gian
FcMylNbAuzuZTC2PzSbsOIxVobHD26iCXJvyqh3fUmtn9nbNXIC0ZVOqG7/BIH3UrfNNV2Uf
qukPDm3uACy4/DdZ4FYao2Lvs9c49EnMmIIFS5qR6OdH+4GxcOwXIhgsZvg3G1eXgTEUZNdC
y6htGs/Dd6igaRo2madcXEGvqMcupL+qtHkfGrvn0Ur1JFRn+fWNpdqXJMy+0u59LGIUYblp
v0EYsGL7vRwzMTfrsfwQdXgsABd2/HMCAwEAAaOCAk4wggJKMD4GA1UdIAQ3MDUwDwYNKwYB
BAGBrSGCLAEBBDAQBg4rBgEEAYGtIYIsAQEEBDAQBg4rBgEEAYGtIYIsAgEEBDAJBgNVHRME
AjAAMA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwHQYD
VR0OBBYEFAtM0NtGxewHqTGqjiflEi4fOibgMB8GA1UdIwQYMBaAFGs6mIv58lOJ2uCtsjIe
CR/oqjt0MCAGA1UdEQQZMBeBFXBhdHJpY2sudXZlbkBvZmZpcy5kZTCBjQYDVR0fBIGFMIGC
MD+gPaA7hjlodHRwOi8vY2RwMS5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2Ny
bC9jYWNybC5jcmwwP6A9oDuGOWh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2Jh
bC1nMi9wdWIvY3JsL2NhY3JsLmNybDCB2wYIKwYBBQUHAQEEgc4wgcswMwYIKwYBBQUHMAGG
J2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1TZXJ2ZXIvT0NTUDBJBggrBgEFBQcwAoY9
aHR0cDovL2NkcDEucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2Fj
ZXJ0LmNydDBJBggrBgEFBQcwAoY9aHR0cDovL2NkcDIucGNhLmRmbi5kZS9kZm4tY2EtZ2xv
YmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDANBgkqhkiG9w0BAQsFAAOCAQEAJmUbLLdA
XZfqK0uqpJ5DcfH66UPFre6qg/72qSc57vGcEdvlIoK95GB1kLheXbF9Q47C/pV9QBnbhJaE
XUeYbnsv4Ph0cCeJGIOxnR2AwPUTePqLK6s/7FGfuItGECaz0RrdQWO8E3OE9pMgIvmjuP9Y
jziFmoDW27Pp3NqnS4vNi8OhfbgYTOGrCnU0/iqIKZncVCZkDyB9mFKWP5d+2qFUU1KaGUX7
+QOEnzUbf6IYpU4yi1e5Mjqo8xcabxnQvKcIdgBaOOanApcmG+k9dz2F4x4PaXI+ZTq/uI0f
iJmHrFVfJfSkuM1ibPzbsfP35f16hK1XdbRx1gdEPB1i3DGCBAswggQHAgEBMIGeMIGNMQsw
CQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRz
Y2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBAgwhOYjVze8ge/uIhhgwDQYJYIZIAWUD
BAIBBQCgggI9MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIw
MDIxMDE3MDgyNlowLwYJKoZIhvcNAQkEMSIEIKlDT1st+edZDUk+AlDt+166C9slhm/DFttu
VPb/MGSgMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggq
hkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZI
hvcNAwICASgwga8GCSsGAQQBgjcQBDGBoTCBnjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoM
PFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHpl
cyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwg
SXNzdWluZyBDQQIMITmI1c3vIHv7iIYYMIGxBgsqhkiG9w0BCRACCzGBoaCBnjCBjTELMAkG
A1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2No
ZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwc
REZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQQIMITmI1c3vIHv7iIYYMA0GCSqGSIb3DQEB
AQUABIIBAEv08xMJ8vpGT7x4v53plqb6FcmvMrb1qFNwSK5JahgEIWgdzXG419AAt8/jQGKq
ndATzyi3Ax6Z+3lTHiuXfcPzfbqj16+qm59utj5K4a9N+VYWTvM9yWq2zu/+OcnMnmTubGqJ
FhyoKdNtEhXHleQJ31sM3/KZIFmeXh4l42bBJNV8vXzhLe/jlNlxDnaqfdsNYM5P6m4WVJXC
82KPU/n81uVkSGFHY1o9alKwIOJbL0vVsByLt0pW0DSoCxtAuvUE1G2YvOaMIhtd/mbRsDHh
LG2vcIvdh0k/YXwL8Rh6FFKC38Lg2Djjhwf3Pg9LUJOw3OnmY/Z1S7G094BsJ5wAAAAAAAA=
--------------ms010407000308090808000301--
