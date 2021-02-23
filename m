Return-Path: <jailhouse-dev+bncBCA7ZIXV4AJBBG5B2SAQMGQE53XKVQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 84800322C33
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Feb 2021 15:26:35 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id f185sf720688wmf.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Feb 2021 06:26:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1614090395; cv=pass;
        d=google.com; s=arc-20160816;
        b=XghIva4Rx+RdxUhANFJG4erHinOmWjE/L6xLJghJOkoHH1cZazEn0aZeiEahykpANr
         HQVTR/efKCQ8/UkxnVXrnIe9cAxR7rJPwZtOCzYcEKbUkbB9tURZnVePx1VWJ74Mg+68
         RTZDakerQrTJHg6P2LMzblwK1jIm1uvFlriK/Ts8KVWDYK/fJj+up/SNYZ7f9EpHwsZ7
         aa9HfvSmh7QUIcmFiElEoPoASgLsyt3cVMgFd5pm16RtKRwa6G6fB5xr199x7TIkBF/l
         RZBwDFH/jqxgkcYbrCY0nVx3KQnE+Y0BlEvCbawR9dqHkpm0RH7Map5Sk4TTvoOExbOd
         CHYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:ironport-sdr:sender:dkim-signature;
        bh=JaXvoyB2dfQjt0bKmJeR64hmX5L6gFXa/jzGoXzNMf8=;
        b=X8tzjU/WUPHunHjfIhogyjqzd4BP2Wz6Orxp0/0VpXza7udszBFBRs/Bhcl2vBfN7e
         HKwg9OqtpX2GZudrw0RUbh6TESv4Ni+4ld7BANgMGyfXSAyEmLuKrfLE83zffAZ4fFaS
         5yXEVvC1wn1e7WiLXk5Lw46+QIq2rvvoqAQP7RaKnyVu5Qo5KfLbYymvlo4fXBlWxVcD
         umERXwEPbwUB0Isy2VrJebMQVz2PBInlwdvHfQtVWPj04IM5CLEHOISm783LvupHkTic
         PwYh4vyaM8JRIMTKlZ7bGdVHZa73qSiYqBJmemuFEVyLsZ9s7HiPGylmyv+CxqzbHUEx
         kZXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ulmapackaging.com header.s=secumail header.b=XxgMsy7D;
       spf=pass (google.com: domain of rsagarzazu@ulmapackaging.com designates 212.8.121.109 as permitted sender) smtp.mailfrom=rsagarzazu@ulmapackaging.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ulmapackaging.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:ironport-sdr:from:to:subject:thread-topic:thread-index:date
         :message-id:references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JaXvoyB2dfQjt0bKmJeR64hmX5L6gFXa/jzGoXzNMf8=;
        b=D2e9GWbXUGSkmdRIAjcUAjRlA/N43lfUEh8hp49eFMDVGG/ZM/wzf4PdcPiGGGcrqp
         6dhzjGt7m8OjWQDAOLy5NJIbgNx+N31KDeS9a1sZdd2TTXJMY9G3CE2S3Frr4myHFtO/
         K/HBCJEjHKDjeFgktwCppqZ1a7WNxUJnb4e/ECL/T193olldeIhQNz3qB3BL2D4/JC9R
         FZ4pN7ViQcoixB49DEDHNuGU+qrOjJCv6hh2jfd4ia6nJP6cHu/jTKykXJ7i/Pdaj1C7
         TpJSmmX5R5gdEsp9iEU6nJ4HDqApgT+szyvIp3Y9iXleFRYlDv3BLsMx3/FMCrUPTUGf
         DIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:ironport-sdr:from:to:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JaXvoyB2dfQjt0bKmJeR64hmX5L6gFXa/jzGoXzNMf8=;
        b=qKSZm+Ri4UC9Y67vIoc1N/8yi5AVExicsAxubP5kpKSyuI7GypVrML6TTiAy+iZKql
         e1rwEpgRp5R6zr18VMfQauQT1T0ESOkYwOe09yHhwBLUWkPNRG+wDznPnXlndP/jAWao
         rKd0r9RMBNff+wFolvjSZC4/tIFpQjayTF20neZOJ/VPlGslH/aaoDSCv5v+AGEvpLIW
         3J+ilKW88D8r7+o/uKA7uNHNd8zAw/BQwkRhJIFArgAoPYBjkgYyLlxPdCPAzDotQLn4
         nZhO7iTyyHU7z7mnDKc5fyYuX21m64aXhkWfowZimyKXMsFVOoRmn6haYKO77XgURRoX
         6uVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5312C4uwjGoE6wIFdIXJTZlDB4fkxDoNGJL/Seou+q2Y59N3A/1V
	vDGY9HJ5PH9ze8VBz+KYbp4=
X-Google-Smtp-Source: ABdhPJzqhhv8cZhVyGEjuGcEQbEXrmqAcb2/GO4cAIUSPk7PKFq5teOigGkLse9I/Prt2dJV+kmaMA==
X-Received: by 2002:adf:dcd2:: with SMTP id x18mr2606187wrm.361.1614090395248;
        Tue, 23 Feb 2021 06:26:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f207:: with SMTP id p7ls5813774wro.0.gmail; Tue, 23 Feb
 2021 06:26:34 -0800 (PST)
X-Received: by 2002:a5d:6951:: with SMTP id r17mr25898160wrw.279.1614090394409;
        Tue, 23 Feb 2021 06:26:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614090394; cv=none;
        d=google.com; s=arc-20160816;
        b=BCqUyufaYTXQNZWgX2sB1Q4LYYMEi3OJoBEgJ5IK7hObk4e3Z//zACF/IADhZlMDkC
         SvkJbpz6soEhhPigoTD4lOrT/LDRqUGhrFUJuQkUi5bt2npUXS2/4OD65KYAS8HoRjNq
         Z9MeKkyukGjsiLhFc65fd3/O8yAM7cPlUnYw8kgF0jRlpapKseRnCjg1mUkqq1mFiDni
         BFuqf/AuxtQLTii7llTIx6FS81VanKzkXm7ofA7ihWz1KouEBJLfHfaiIvZ/w4XjuXla
         VYrbT3fl4m37VBzgNDvgcf31CfO0ahibNNH7KV3v0SHc+cQa7qE5HDpFhnLetvsqqbVw
         Na+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from:ironport-sdr:dkim-signature;
        bh=K0DGKS5NKDS8/f7/GyiJHfWIqyHknaSb4aZq32fYi+E=;
        b=k+f+yB7yBsmvfhM0m9tbYfMOVZEe/suh8SrrkNdrmXgIt73etcVvbcu2MwVNhbWBFo
         utQrYtza9VTdZW7xtcTs8EtYIzpWijBtZZ9hBo67g1VHZ/Yk9WW3QrexcdW+g+dA/L1U
         G1q5bdpCSimx3OdWzSQFoI2Bpd1DGzMRluIQvhC1BMMlH0FytbV0t+BXMOdpcDbHVZWo
         dNJENhGBDoSNds/lEXm0tHJm3OknKvQ38iAgeeebZrPW+GuW7Zsf2CMrKJYHZRKXj/3L
         1MU1bKujqa2DZFNOPn0aPV8yD0by3faFKYDSr5Gnm9C0JnFV+5QKZsHM7X54jcgm96Zs
         YkJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ulmapackaging.com header.s=secumail header.b=XxgMsy7D;
       spf=pass (google.com: domain of rsagarzazu@ulmapackaging.com designates 212.8.121.109 as permitted sender) smtp.mailfrom=rsagarzazu@ulmapackaging.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ulmapackaging.com
Received: from mx2.ulmapackaging.com (mx2.ulmapackaging.com. [212.8.121.109])
        by gmr-mx.google.com with ESMTPS id m3si206083wme.0.2021.02.23.06.26.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 06:26:34 -0800 (PST)
Received-SPF: pass (google.com: domain of rsagarzazu@ulmapackaging.com designates 212.8.121.109 as permitted sender) client-ip=212.8.121.109;
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: rPL8hfNiz3u0XMe1s2mTVAfud53NRjccDNmI/3UxQveDjoki9f0IVxTsy6sVWjI1GbziW5Ivzg
 eV54ry7vNnAg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO spc015.packaging.ulma.es) ([172.16.1.15])
  by mx2.ulmapackaging.com with ESMTP/TLS/ECDHE-RSA-AES128-SHA256; 23 Feb 2021 15:26:33 +0100
Received: from spc015.packaging.ulma.es (172.16.1.11) by
 spc015.packaging.ulma.es (172.16.1.11) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 23 Feb 2021 15:26:33 +0100
Received: from spc015.packaging.ulma.es ([::1]) by spc015.packaging.ulma.es
 ([::1]) with mapi id 15.00.1395.000; Tue, 23 Feb 2021 15:26:33 +0100
From: Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: Invalid PCI config write, port cfc, size 1, address port:
 8000f940
Thread-Topic: Invalid PCI config write, port cfc, size 1, address port:
 8000f940
Thread-Index: AdcI8aG+TEF5nlT4SISzW15xAgZbOQA7LcuAAARTbBA=
Date: Tue, 23 Feb 2021 14:26:32 +0000
Message-ID: <4f378475d9cb4393a902160f0da81f7f@spc015.packaging.ulma.es>
References: <4b6f864a20164d4884425ea87059a92f@spc015.packaging.ulma.es>
 <0d6ec3fd-adf2-d54e-57c9-99244f280538@siemens.com>
In-Reply-To: <0d6ec3fd-adf2-d54e-57c9-99244f280538@siemens.com>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.87.89]
Content-Type: multipart/alternative;
	boundary="_000_4f378475d9cb4393a902160f0da81f7fspc015packagingulmaes_"
MIME-Version: 1.0
X-Original-Sender: rsagarzazu@ulmapackaging.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ulmapackaging.com header.s=secumail header.b=XxgMsy7D;
       spf=pass (google.com: domain of rsagarzazu@ulmapackaging.com designates
 212.8.121.109 as permitted sender) smtp.mailfrom=rsagarzazu@ulmapackaging.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ulmapackaging.com
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

--_000_4f378475d9cb4393a902160f0da81f7fspc015packagingulmaes_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I was trying it and it seems that it works.

Thankyou,

Rai.

De: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com> En nomb=
re de Jan Kiszka
Enviado el: martes, 23 de febrero de 2021 14:21
Para: Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>; jailhouse-dev@goog=
legroups.com
Asunto: Re: Invalid PCI config write, port cfc, size 1, address port: 8000f=
940

On 22.02.21 09:27, Raimundo Sagarzazu wrote:
Hi all,

I'm trying to give SMbus access to an inmate cell but the system hangs on t=
his error: =E2=80=9CInvalid PCI config write, port cfc, size 1, address por=
t: 8000f940=E2=80=9D when I try to load the cell.

It=E2=80=99s a x86 host and we already have jailhouse running with two inma=
te cells giving access to net devices, sharing memory, etc.

From "lspci", I have:

              00:1f.1 SMBus: Intel Corporation Celeron N3350/Pentium N4200/=
Atom E3900 Series SMBus Controller (rev 0b)
                            DeviceName: Onboard - Other
                            Subsystem: Intel Corporation Device 7270
                            Flags: medium devsel, IRQ 20
                            Memory at 91616000 (64-bit, non-prefetchable) [=
size=3D256]
                            I/O ports at f040 [size=3D32]
                            Kernel driver in use: i801_smbus

From "jailhouse config create ...":

              /* MemRegion: 91516000-915160ff : 0000:00:1f.1 */
              {
                            .phys_start =3D 0x91516000,
                            .virt_start =3D 0x91516000,
                            .size =3D 0x1000,
                            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_W=
RITE,
              },
...
              /* Port I/O: f040-f05f : 0000:00:1f.1 */
              PIO_RANGE(0xf040, 0x20),
...
              /* PCIDevice: 00:1f.1 */
              {
                            .type =3D JAILHOUSE_PCI_TYPE_DEVICE,
                            .iommu =3D 1,
                            .domain =3D 0x0,
                            .bdf =3D 0xf9,
                            .bar_mask =3D {
                                          0xffffff00, 0xffffffff, 0x0000000=
0,
                                          0x00000000, 0xffffffe0, 0x0000000=
0,
                            },
                            .caps_start =3D 0,
                            .num_caps =3D 0,
                            .num_msi_vectors =3D 0,
                            .msi_64bits =3D 0,
                            .msi_maskable =3D 0,
                            .num_msix_vectors =3D 0,
                            .msix_region_size =3D 0x0,
                            .msix_address =3D 0x0,
              },

First thing I can see is that lspci shows that device's memory region is:
              Memory at 91616000 (64-bit, non-prefetchable) [size=3D256]

While "jailhouse config create ..." shows:
              MemRegion: 91516000-915160ff : 0000:00:1f.1

Is that correct?

Anyway, digging in the code I can see that the error comes on "hypervisor/p=
ci.c, pci_cfg_write_moderate() ...", when trying to access address 0x40 but=
 device has no capabilities.

Giving access to this device is not a big issue for us because we can share=
 "/dev/i2c-0" status over IVshmem but I'd like to known if there's somethin=
g else I can do or it just can't be done.


This config space register might be a side-band register. You could permit =
access by modelling it like a capability, ie. create one at 0x04 of the nee=
ded size (at least 1 byte) and with write permissions. Cap ID can be 0 or a=
nything else invalid.

Jan


--

Siemens AG, T RDA IOT

Corporate Competence Center Embedded Linux
--
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com<mailto:jailhouse-dev+uns=
ubscribe@googlegroups.com>.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0d6ec3fd-adf2-d54e-57c9-99244f280538%40siemens.com<https://gr=
oups.google.com/d/msgid/jailhouse-dev/0d6ec3fd-adf2-d54e-57c9-99244f280538%=
40siemens.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4f378475d9cb4393a902160f0da81f7f%40spc015.packaging.ulma.es.

--_000_4f378475d9cb4393a902160f0da81f7fspc015packagingulmaes_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML con formato previo Car";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EstiloCorreo18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLconformatoprevioCar
	{mso-style-name:"HTML con formato previo Car";
	mso-style-priority:99;
	mso-style-link:"HTML con formato previo";
	font-family:"Consolas",serif;
	mso-fareast-language:EN-US;}
span.EstiloCorreo22
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ES" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Yes, I =
was trying it and it seems that it works.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Thankyo=
u,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Rai.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"mso-fareast-language:ES">De:</span=
></b><span style=3D"mso-fareast-language:ES"> jailhouse-dev@googlegroups.co=
m &lt;jailhouse-dev@googlegroups.com&gt;
<b>En nombre de </b>Jan Kiszka<br>
<b>Enviado el:</b> martes, 23 de febrero de 2021 14:21<br>
<b>Para:</b> Raimundo Sagarzazu &lt;rsagarzazu@ulmapackaging.com&gt;; jailh=
ouse-dev@googlegroups.com<br>
<b>Asunto:</b> Re: Invalid PCI config write, port cfc, size 1, address port=
: 8000f940<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On 22.02.21 09:27, Raimundo Sagarzazu wrote:<span st=
yle=3D"font-size:12.0pt;mso-fareast-language:ES"><o:p></o:p></span></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I'm trying to give SMbus access=
 to an inmate cell but the system hangs on this error: =E2=80=9CInvalid PCI=
 config write, port cfc, size 1, address port: 8000f940=E2=80=9D when I try=
 to load the cell.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">It=E2=80=99s a x86 host and we =
already have jailhouse running with two inmate cells giving access to net d=
evices, sharing memory, etc.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">From &quot;lspci&quot;, I have:=
</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00:1f.1 SMBus: Intel Corpor=
ation Celeron N3350/Pentium N4200/Atom E3900 Series SMBus Controller (rev 0=
b)</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DeviceName: Onboar=
d - Other</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Subsystem: Intel C=
orporation Device 7270</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Flags: medium devs=
el, IRQ 20</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Memory at 91616000=
 (64-bit, non-prefetchable) [size=3D256]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I/O ports at f040 =
[size=3D32]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kernel driver in u=
se: i801_smbus</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">From &quot;jailhouse config cre=
ate ...&quot;:</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* MemRegion: 91516000-9151=
60ff : 0000:00:1f.1 */</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .phys_start =3D 0x=
91516000,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .virt_start =3D 0x=
91516000,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size =3D 0x1000,<=
/span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flags =3D JAILHOU=
SE_MEM_READ | JAILHOUSE_MEM_WRITE,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Port I/O: f040-f05f : 00=
00:00:1f.1 */</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PIO_RANGE(0xf040, 0x20),</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* PCIDevice: 00:1f.1 */</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type =3D JAILHOUS=
E_PCI_TYPE_DEVICE,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .iommu =3D 1,</spa=
n><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .domain =3D 0x0,</=
span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .bdf =3D 0xf9,</sp=
an><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .bar_mask =3D {</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xffffff0=
0, 0xffffffff, 0x00000000,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000000=
0, 0xffffffe0, 0x00000000,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },</span><o:p></o:=
p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .caps_start =3D 0,=
</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_caps =3D 0,</=
span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_msi_vectors =
=3D 0,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .msi_64bits =3D 0,=
</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .msi_maskable =3D =
0,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_msix_vectors =
=3D 0,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .msix_region_size =
=3D 0x0,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .msix_address =3D =
0x0,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">First thing I can see is that l=
spci shows that device's memory region is:</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Memory at 91616000 (64-bit,=
 non-prefetchable) [size=3D256]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">While &quot;jailhouse config cr=
eate ...&quot; shows:</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MemRegion: 91516000-915160f=
f : 0000:00:1f.1</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is that correct?</span><o:p></o=
:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Anyway, digging in the code I c=
an see that the error comes on &quot;hypervisor/pci.c, pci_cfg_write_modera=
te() ...&quot;, when trying to access address 0x40 but device has no capabi=
lities.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Giving access to this device is=
 not a big issue for us because we can share &quot;/dev/i2c-0&quot; status =
over IVshmem but I'd like to known if there's something else I can do or it=
 just can't be done.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;</span><o:p></o:p></p>
</blockquote>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif;mso-fareast-language:ES"><br>
This config space register might be a side-band register. You could permit =
access by modelling it like a capability, ie. create one at 0x04 of the nee=
ded size (at least 1 byte) and with write permissions. Cap ID can be 0 or a=
nything else invalid.<br>
<br>
Jan<br>
<br>
<o:p></o:p></span></p>
<pre>-- <o:p></o:p></pre>
<pre>Siemens AG, T RDA IOT<o:p></o:p></pre>
<pre>Corporate Competence Center Embedded Linux<o:p></o:p></pre>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif;mso-fareast-language:ES">--
<br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to
<a href=3D"mailto:jailhouse-dev&#43;unsubscribe@googlegroups.com">jailhouse=
-dev&#43;unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0d6ec3fd-adf2-d54e-57c9-99244f280538%40siemens.com=
?utm_medium=3Demail&amp;utm_source=3Dfooter">
https://groups.google.com/d/msgid/jailhouse-dev/0d6ec3fd-adf2-d54e-57c9-992=
44f280538%40siemens.com</a>.<o:p></o:p></span></p>
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4f378475d9cb4393a902160f0da81f7f%40spc015.packagin=
g.ulma.es?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com=
/d/msgid/jailhouse-dev/4f378475d9cb4393a902160f0da81f7f%40spc015.packaging.=
ulma.es</a>.<br />

--_000_4f378475d9cb4393a902160f0da81f7fspc015packagingulmaes_--
