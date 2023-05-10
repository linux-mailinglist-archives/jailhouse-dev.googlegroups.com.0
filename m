Return-Path: <jailhouse-dev+bncBDG4VJ65XMMRB56Q52RAMGQEDEZPHUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6EE6FDFF1
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 May 2023 16:21:45 +0200 (CEST)
Received: by mail-qt1-x83d.google.com with SMTP id d75a77b69052e-3f38b6a2682sf23617641cf.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 May 2023 07:21:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1683728504; cv=pass;
        d=google.com; s=arc-20160816;
        b=sqR7qJNdxM+Hzcq9+te8Bk9g0wckmoX4W2osRVAwS5xW2zjhtEQd/TDrhrC/jwea4l
         yylNia/2z0Gr6RMvFye5PQz3L9/1Tsia6Cu2WO8HLxQLhw6dq3M0zaEfGbmFLeyTtIQT
         uoGYguqLc/hZ2jrdLaNyc/DGf/DveOQomHhsjdKrWot+tChZOyY5xk1fkQDcuqsp0bzX
         ETfA/wHtKm9jl7NdilYh8r1CvV7qXSWO97FuRiDCvvOVNoIKhdYAnuhAWlxLRhieK/i+
         hm/y3DuyGBNr48j9zYHHpeO9hHpxkllrjwQIOIZUEgiqFdJHTctfHB261SBjpjiow1e3
         8PXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:to:subject:message-id:date
         :from:mime-version:dkim-signature;
        bh=XMhg+6Eh175E9ro6BUwhdMUK/0sD35XiyevbbTyh8OM=;
        b=nh/+KItY9YDeqBpBTQ9RFmQhIZCCcztQTQKX2qXQsYmiHiE3h/QEZHmJ2rrWGqg+MG
         W6NPdMlPCT/wR6yE2RkJegsoEWh15BWIL4O1LSUJhDYqgZb3Wc5ZbpLaanwAGXQRRfgQ
         oC01bKo21avuqSeW7SOimm8E3kP6TX9OPhjhr3DZi1PCdDwJX15I2QwOQ4w3mWQesWfV
         JFhjYd71eqmjTZXx6DUeNYjdo1r3Bv1ETqOVbmaDVz807T5rqdYf5L3NTfHapOHtphWN
         sLiaNBEWJ3d++JrnRMKF9aHv3o3FNiKipfUc4iPfMq/RS5L63IIllecW6RMkLj9yB/aF
         JFZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@broadcom.com header.s=google header.b=YBQLMuaU;
       spf=pass (google.com: domain of vladimir.neyelov@broadcom.com designates 2607:f8b0:4864:20::92f as permitted sender) smtp.mailfrom=vladimir.neyelov@broadcom.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=broadcom.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1683728504; x=1686320504;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMhg+6Eh175E9ro6BUwhdMUK/0sD35XiyevbbTyh8OM=;
        b=Y3GOz0B2/7ns06B1eAXiumm8LS5fQv99PvQ5aAhpMvx/yxq67+SBKAbvGLQGnOoGH6
         HttSCCPdWrvRGY1NKPEDTjwoaTn6KDUk0SN0aIze8zJCK0ti8bT4+xV5RK1OtJW7tGSO
         AiRmeK+9ekXkMc4OYpxQZOAUeKZbM84+iOSBER2WJRR5Tp1t/LuLshgIb/PoO7Lz+p2i
         sxMwpMCmc+0Pc5l2MvAsQ6V5VfVELekr8tDA5VsDIsUfmPyTmmg0owFQWXTxPZOBFt7R
         Qm4V3BUZO5KKQrU8OLkDQ49bg/eg+4Vqszrd5bmxq+pg1t6cbbVaMGS1/4AHgdcgC09J
         DYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683728504; x=1686320504;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-beenthere:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XMhg+6Eh175E9ro6BUwhdMUK/0sD35XiyevbbTyh8OM=;
        b=MB0QyZOz6yxa67Znd8nmrjmAxUslk62phoawAY65Uhbgi4my3PrKo2rhcGEcFW4fRk
         aLNe61iolBrghNs2jAt9Pj5as1iXjYcUrjDCzt5x6X5he5a0+l8SZHsWJrS8OsakEORg
         6M4OpOpIpOPnMlq6yNtYXYnAyICIikAnQLsQoj5j3qrXY4DlHBGZsf9smdKOMm404BFU
         NcUpJ0/Eeo3531LQ15FdS1OkyqNKmFEjI7Uhm/+JzDLKqYnTsKFLKtKZZzzWBgYrcwXY
         mSTy3jijUpdAbIkJFLQ8zbsshRWQQrmWKMt8sbUtfeFXhkYFdetaTeTn88+5PVcHGy06
         AGAg==
X-Gm-Message-State: AC+VfDyhUCNbhmCM/0tCCRVMdp3L4nhGhanMlNC5vvRAgR3d1PQ2BJNR
	He5zKpxCxG/uxVOl8/IYOdc=
X-Google-Smtp-Source: ACHHUZ6tS+Xeppyyr4KN4BHAORK2cNyeDkiD9LIBk4Xf9Q+V/6eofRso7vthq1ZSHwgTLQlXTxPZiQ==
X-Received: by 2002:a05:622a:1a89:b0:3f2:2ac7:cda9 with SMTP id s9-20020a05622a1a8900b003f22ac7cda9mr6906643qtc.11.1683728503788;
        Wed, 10 May 2023 07:21:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:5786:b0:5a2:29c1:b542 with SMTP id
 lv6-20020a056214578600b005a229c1b542ls20866222qvb.10.-pod-prod-gmail; Wed, 10
 May 2023 07:21:43 -0700 (PDT)
X-Received: by 2002:a05:6214:d04:b0:61b:5816:a265 with SMTP id 4-20020a0562140d0400b0061b5816a265mr26478874qvh.16.1683728502958;
        Wed, 10 May 2023 07:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683728502; cv=none;
        d=google.com; s=arc-20160816;
        b=bP6iCEr6Xtio3YxcReDJNI4xJyC5SklocBglcswSDTFSyETW4E31+SpXxZyDoyxTDT
         wxue6nAG2pihjNFsWlHFZhGlEw3Oq9yRIq8VSwvgfSs5uQXWLyKN1uIRZCQmHr9TCnnL
         zuR1CF07zIFgvO1hZh6Rl1aHERhDi9To1Lx52oEHdI50QlwwWmTxVrRJxSS79ztVvIRr
         nF6NA4mkt7t/ULsgOzpHM+b11UTLfj1fPq9mKn2Z2l5QnVVdQxQdWWJnXo+HCD/Wd6TY
         rPze8sq73PR+sNAOEWB4rkhGmFYbhbQ7wKGcaeGfmquyOW2iEjqHglxIhWNL6/zP7+9Y
         NQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=C8sk4yhBbRoiuKrEJbWeMuzjGXS3WUGKJqk4mkDpRwY=;
        b=AtB0n/PllnLd0IYZse7QNQjCnECLftlhbCjX0R1PxhX0cMa1clfWNpEoGiNhebUZSx
         7rHzWHR3yHGx6eE69Y2Z0bMffXfQ6tVcI3vnDy7ZaKrv2t8v1ooHFZqlbbupb5v0PJqN
         a29Xyzbwg19+w+X65H/AzyDW06pA/0+7LqZxhp7iIlNB51fMS7qU9/LZHX3r45NbMB1+
         ce2hPNiXeu0fdwvTWkuqTSR8CXX8WampoW01hlSD/6Yra8ExroZHAQhP3q+etRuyMuOq
         avqVMD6UiA8SIi13rA9wVQC0CqgGUxt70G5hmS9vvRR/b5A8BqvVXY47MK2RDERhZLwH
         RAcQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@broadcom.com header.s=google header.b=YBQLMuaU;
       spf=pass (google.com: domain of vladimir.neyelov@broadcom.com designates 2607:f8b0:4864:20::92f as permitted sender) smtp.mailfrom=vladimir.neyelov@broadcom.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=broadcom.com
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com. [2607:f8b0:4864:20::92f])
        by gmr-mx.google.com with ESMTPS id og9-20020a056214428900b005fc5135c65csi280141qvb.4.2023.05.10.07.21.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:21:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of vladimir.neyelov@broadcom.com designates 2607:f8b0:4864:20::92f as permitted sender) client-ip=2607:f8b0:4864:20::92f;
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-77d218b74cdso2203095241.0
        for <jailhouse-dev@googlegroups.com>; Wed, 10 May 2023 07:21:42 -0700 (PDT)
X-Received: by 2002:a67:ad04:0:b0:434:4809:5520 with SMTP id
 t4-20020a67ad04000000b0043448095520mr6133457vsl.25.1683728502298; Wed, 10 May
 2023 07:21:42 -0700 (PDT)
MIME-Version: 1.0
From: "'Vladimir Neyelov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Date: Wed, 10 May 2023 17:21:31 +0300
Message-ID: <CAKM86uE4n7wWu2UZYr+hGOBrZ4d5eHsJhOND7pmd4apNZzhLBA@mail.gmail.com>
Subject: Jailhouse and optee interaction
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000004c66f605fb57979d"
X-Original-Sender: vladimir.neyelov@broadcom.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@broadcom.com header.s=google header.b=YBQLMuaU;       spf=pass
 (google.com: domain of vladimir.neyelov@broadcom.com designates
 2607:f8b0:4864:20::92f as permitted sender) smtp.mailfrom=vladimir.neyelov@broadcom.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=broadcom.com
X-Original-From: Vladimir Neyelov <vladimir.neyelov@broadcom.com>
Reply-To: Vladimir Neyelov <vladimir.neyelov@broadcom.com>
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

--0000000000004c66f605fb57979d
Content-Type: multipart/alternative; boundary="0000000000004743eb05fb57976c"

--0000000000004743eb05fb57976c
Content-Type: text/plain; charset="UTF-8"

HI all,
We use jailhouse hypervisor on our platforms. Standard configuration is
root cell - linux, secondary cell - ThreadX. But now we want to add optee
os support. How jailhouse can interact with optee os. What is the common
way to run optee os in jailhouse.
Thanks,
Vladimir

-- 
This electronic communication and the information and any files transmitted 
with it, or attached to it, are confidential and are intended solely for 
the use of the individual or entity to whom it is addressed and may contain 
information that is confidential, legally privileged, protected by privacy 
laws, or otherwise restricted from disclosure to anyone else. If you are 
not the intended recipient or the person responsible for delivering the 
e-mail to the intended recipient, you are hereby notified that any use, 
copying, distributing, dissemination, forwarding, printing, or copying of 
this e-mail is strictly prohibited. If you received this e-mail in error, 
please return the e-mail to the sender, delete it from your computer, and 
destroy any printed copy of it.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAKM86uE4n7wWu2UZYr%2BhGOBrZ4d5eHsJhOND7pmd4apNZzhLBA%40mail.gmail.com.

--0000000000004743eb05fb57976c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">HI all,<div>We use jailhouse=C2=A0hypervisor on our platfo=
rms. Standard configuration is=C2=A0 root cell - linux, secondary=C2=A0cell=
 - ThreadX. But now we want to add optee os support. How jailhouse can inte=
ract with optee os. What is the common way to run optee os in jailhouse.=C2=
=A0 =C2=A0</div><div>Thanks,</div><div>Vladimir=C2=A0</div></div>

<br>
<span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">This ele=
ctronic communication and the information and any files transmitted with it=
, or attached to it, are confidential and are intended solely for the use o=
f the individual or entity to whom it is addressed and may contain informat=
ion that is confidential, legally privileged, protected by privacy laws, or=
 otherwise restricted from disclosure to anyone else. If you are not the in=
tended recipient or the person responsible for delivering the e-mail to the=
 intended recipient, you are hereby notified that any use, copying, distrib=
uting, dissemination, forwarding, printing, or copying of this e-mail is st=
rictly prohibited. If you received this e-mail in error, please return the =
e-mail to the sender, delete it from your computer, and destroy any printed=
 copy of it.</font></span>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAKM86uE4n7wWu2UZYr%2BhGOBrZ4d5eHsJhOND7pmd4apNZzh=
LBA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAKM86uE4n7wWu2UZYr%2BhGOBrZ4d5eHsJhOND7p=
md4apNZzhLBA%40mail.gmail.com</a>.<br />

--0000000000004743eb05fb57976c--

--0000000000004c66f605fb57979d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVgwggRAoAMCAQICDBAQjJ5VWewfoURFeDANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMTU1NThaFw0yNTA5MTAxMTU1NThaMIGW
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xGTAXBgNVBAMTEFZsYWRpbWlyIE5leWVsb3YxLDAqBgkqhkiG
9w0BCQEWHXZsYWRpbWlyLm5leWVsb3ZAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEA2UmD64uay47ye4BUixpaEJXOajSvBs8MKoV660NYXfypf1GJBrbcus2mE9Nc
Ff2PId5sYqeVDm0G40JWI0iZzB3RN3G8rr4oTMxvEK6XjK/nqbyzKkzs+gh5jLbNxpsitN0zwCfe
SYD/jmr6dye6hrxlIJur7UHIDp7scnFX//ei4wTxvcUc9hqluodJpFreeXFQVOp9vXvUD6qOcECD
hWUfxuOAnj2mXD2WrFrnELPiUyd6K6BhJDUJgyvqHt8/gl3nFWFbTBk8Hzgbd3KMiwL8ysA/LVch
ru0Sz2hyrZ+TookjEG9UkHfGKmmq6kEKc/gons237gYsHcJLBAf7BwIDAQABo4IB3jCCAdowDgYD
VR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEG
CCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWdu
MmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93
d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6
hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNy
bDAoBgNVHREEITAfgR12bGFkaW1pci5uZXllbG92QGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggr
BgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUrM8T/rwp
iCO4SnN/Vzs58dW0OnwwDQYJKoZIhvcNAQELBQADggEBAIXmTmmHFBWFK/c2yBG45Cl/DUFAjK5x
GxEOD1X9S6hDWS40IZYp9P0TeYZc2SJ1QDW0mvDX+on6FBS9s4B2Cixd07T3Frsa11H5bF/bGR58
gMkkcvdlpZrsBDPK9UgPnVnCwcBRn8hotYeZxVoyXYit2SaaoXefJvvuAxApwGntHUvC+DNpZZw7
qPL635YKmnDgDwS0B8amjZi0TpS5OodrPEqRgqjcGOOFrKoQMzHeQ0txQTmuLg979i9cBHPf5/64
i1CSk6N29bpwjeO3VVGJMF6bX36kM052FrZVu3HgMMa26vzBnAK9l461luR8a8UYsjp845ho1S79
1BE3Yt8xggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwQ
EIyeVVnsH6FERXgwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEINAkLcxYRfhqFNEI
RXlMwvwcZg2Q4MGSd7VLfBhqTuMgMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTIzMDUxMDE0MjE0MlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZI
AWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEH
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBF23lCWrHgL6m4HcR1woc2HP6KPTSPW3yc
ic3NUuFWOfSmXdBzcHq0WhCxSppSN9AgUH3x99RwaFy5h+r+Roy8acTliHt2XzNiR003D9S35Ueo
t3JB5TAGK8DBNci9m6gKWbeRdvUVhOiGaeKVNxj/XkKkuQAL4xa4d1mle/10xnnF1ywCLBpoBWHy
vzmMr9gJdcE8eHu0P7UVVRJv0mRgeISgndV9HCGd9C9SL8hPWKHR+GWWKGVy4mUK8n86NpJeXuEK
/hKUbEPspMlzOf00FPPRhsOGvlc+/1etCnhyTDR9A+8/TBAfO7FY5fa2CWKrAplaSC0ikCWu3Q18
w+Ss
--0000000000004c66f605fb57979d--
