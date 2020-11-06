Return-Path: <jailhouse-dev+bncBDE3XXPWEAIJZW4T7UCRUBGV6V3QU@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AC32A8F76
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Nov 2020 07:30:53 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id x22sf26300ljh.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Nov 2020 22:30:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604644252; cv=pass;
        d=google.com; s=arc-20160816;
        b=RHl5tY/wC3HO2CnQ8PeO+qC9B8H56gamME+mgXVEmc8F4CQPX4Wf1t8dK/vLkUKaJw
         bRoURrtFJ38XmvqzsmZPjEvr3Bed6KNdHXAVb/J1EI1OrKizPobJtzDG9fwLcDOGjTTj
         HB5UkZ2pz1NcAoxOoHa3H1955eiBPslV8AC9lwy8ViapeJdlCsFOF0xV2hxN6WPsC6Ql
         VJ7mg46oiEKUjPUEhe3+qCEfkwF6qzBezLivAA8efMkqQFZe87qFNch2U16iFH+5Ce30
         93RdralSqtKBXjTn4HHEjCzS01q7jXi0QizqA4WwApaKpoxeVpe0ffu5PnAwPbxMXVbh
         uj0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=n8yDhOeZX1O5bWgKPZo3ZvUTbHD5XkzYtMFC/YZ+VGw=;
        b=qVn+govyXAVDxPNCD+TzJJJwc8sz/Zg9XOUQsjCSFm0zu8v4TLZya9WoZz22owGSyP
         bNouhZ0b+fjDwuIB/+W/vNHv/B7hlwjAVNaV/BlQBABh3w7aCuOJLxrTs2jz+mWFLv0/
         nyHYVLU7J88AFaJ6Fuqx12Bd57BJ38mvTXjBbnHrnGY+EttGPzX9Rdt/5sdQcs78wMKq
         af130/9BUmY7r1yKyU/masudaw686363gWDj9Pbeo4pbtQbiLjwVFKrwX5NXVfGu+RA6
         vZnr718GgDyfRibf9oG7nkflrKqz280KFWu+SII2JPSRAu/OdFjC0EukLTKH+jxKhAe7
         Wnlw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jingyan.liang@marelli.com designates 212.123.238.164 as permitted sender) smtp.mailfrom=jingyan.liang@marelli.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=n8yDhOeZX1O5bWgKPZo3ZvUTbHD5XkzYtMFC/YZ+VGw=;
        b=m7UsYMlTK5qX8Nl3DJfBbxr1y84um9c+tPT3KferioLNrw/S0ZgrmeEgtChVlICfRL
         kkhpoROTAWJHwWH375c5SE3ECYB0DM3vXZ0P3u8CF1mZSHZQAFwOggyA8AvDYZi8VHpd
         pvylc5fbynUtm94llKkVLc6fagTjg9TBxw19TRrhfurCboqC1AbWqIGV+LQYqbZzQ4mX
         1O8A8oPGFxYhAUsCSr2uI80ir64/DoEeh9bRhWgx1TkQsDeaYDeaVceA9DNuhKs00a6b
         Wjkv/OAhQGkHtBbhTiSVI3qmoN5bUSpeaOX7xkUIPU/1NjomsughvH0rMFwE+3uBsF+5
         B5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=n8yDhOeZX1O5bWgKPZo3ZvUTbHD5XkzYtMFC/YZ+VGw=;
        b=j8ENWS4qHNAT3tkXbMRk/n0QIN8730PeTXITE9BCfd4U5xivAyAlbaSZ5jPGoXYQ6P
         kOnmBq+5yzcj9JBZMKasPoVHH2YSflbE+M/PoR7E4t5sl4L4wIzJyW5prePkq6NfeD39
         qBeRClIEeQkDczyhj3G1ZBb5WAWUfV6BL1GrUqOWN9d0zER3h1j8XOjB+T/S5Np9VkPx
         gpKmxYUReme8KLFzI5/VQfRwpamkbL2EQc/SPZ2IBu9ZOGPd2sn7rv0Ajz2QM4RcGuMt
         fp8v/qMwukRQq7htFWnLeshtHBnzBlHiJCQT1C3LyRR/EDAbt7VARsklNtksb/l2pdLb
         54hQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531f9QCnd4iHLblLrhmcmjAbH+qVCoD76ibvFrOSfj2T3fj7FFRy
	u6pDTSbX83SLIVlAmOMkyzs=
X-Google-Smtp-Source: ABdhPJzd1i6vls22Qy+dBDuvh7lAIgGB/z0H7njPWnpt8fic+3/EJZTjy7HZLr3/mFJOVYgHC8UV0Q==
X-Received: by 2002:a2e:9710:: with SMTP id r16mr208648lji.164.1604644252717;
        Thu, 05 Nov 2020 22:30:52 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:480e:: with SMTP id v14ls203242lfa.2.gmail; Thu, 05 Nov
 2020 22:30:51 -0800 (PST)
X-Received: by 2002:ac2:5de5:: with SMTP id z5mr254370lfq.232.1604644251126;
        Thu, 05 Nov 2020 22:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604644251; cv=none;
        d=google.com; s=arc-20160816;
        b=UsmNBPjy83vqIyRf7iw0NF3tkMTQ22rFyF/Lne7Zb3dysjjbxVu1tNWDOFWvQCZCvY
         g0lZctfNUJVXeL6tIrJoBqp3FXBlQJ/3mh7j7i7sgjy39ZEKNY+tZqg10Q5rn0MZtaSY
         saH9vX+IBFvGpd18EyPDlGQOP8Ahs9EmnQAdUQLQRwAXN7P3Mp4i3RD8tgcrqIG1OpW7
         wlio1RwsGCv7oSrddxi06ld1N5oAsrS5Pl/1j0GRG4gkStb65R5rvuEnMUHAhMOcv3lb
         MPmhtp/e4VVMOQXslUjG1Ss+3RGnEXUPh34Vcmu9Y1LITcmEMHNV+FLI0he1ZB4w/oum
         cZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:cc:to:from;
        bh=rftzXfkswEzfr69tlq4bbRW+0+uCqCYtHK0AS9GRytU=;
        b=j2k/Od5uLA1c2rKJOlgDqyn870DDMMqprqJ5uwBjJlWPmzqBRbp5+r07qRJTnfcFY4
         FzoZj0azfiaw84S0DVW/PAXyzzW+f7AQTFX/0H47lvW4ZT3KamTfr9VBfUf8t1N56/FV
         4g21mcDIhp7eBTfErgQe+dcJ5SDXh8H0gBS9qrz103yiSbGTKmyFwiXqdKveuM+6IBHd
         wSKteDJZsZ4SasFrTAca/SQpkESDkRKB/snc2sqcvGQXaWwRSjGbZdnuY1/uTS5Di3Ca
         rlMb+sQ1L25wYpcDG3rWxgM/BA8sekkQG9aDWnt3w0TFsuTHDpkezzdd+63LCWG8pT9U
         DJYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jingyan.liang@marelli.com designates 212.123.238.164 as permitted sender) smtp.mailfrom=jingyan.liang@marelli.com
Received: from fsasmgp07.fiatgroup.com (mx2fcms.fiatgroup.com. [212.123.238.164])
        by gmr-mx.google.com with ESMTPS id j2si9495lfe.9.2020.11.05.22.30.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 22:30:51 -0800 (PST)
Received-SPF: pass (google.com: domain of jingyan.liang@marelli.com designates 212.123.238.164 as permitted sender) client-ip=212.123.238.164;
X-AuditID: d47beea4-31dff70000002776-72-5fa4ed9a4d01
Received: from MXPO2FGAW.fgremc.it ( [151.92.70.127])
	by fsasmgp07.fiatgroup.com (ESMTP IBM SMTP Gateway) with SMTP id B2.26.10102.A9DE4AF5; Fri,  6 Nov 2020 07:30:50 +0100 (CET)
Received: from MXPO1FGAW.fgremc.it (151.92.70.126) by MXPO2FGAW.fgremc.it
 (151.92.70.127) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 6 Nov
 2020 07:30:49 +0100
Received: from MXPO1FGAW.fgremc.it ([fe80::b4b3:c124:c673:3e00]) by
 MXPO1FGAW.fgremc.it ([fe80::b4b3:c124:c673:3e00%20]) with mapi id
 15.00.1497.006; Fri, 6 Nov 2020 07:30:49 +0100
From: "Liang Jingyan (M)" <jingyan.liang@marelli.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
CC: "Xiao Jianhao (M)" <jianhao.xiao@marelli.com>, "GAO Zhao (M)"
	<Zhao.Gao@marelli.com>, "THOMAS Deuilhe (M)" <deuilhe.thomas@marelli.com>
Subject: [J7] jailhouse hypervisor in TI J7
Thread-Topic: [J7] jailhouse hypervisor in TI J7
Thread-Index: Ada0BUq2fZ+ea6OYTKyzqIhrUlxtBQ==
Date: Fri, 6 Nov 2020 06:30:49 +0000
Message-ID: <e2ab7c14fd244457a1faeb99ff0fe5be@MXPO1FGAW.fgremc.it>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [151.92.70.225]
Content-Type: multipart/related;
	boundary="_004_e2ab7c14fd244457a1faeb99ff0fe5beMXPO1FGAWfgremcit_";
	type="multipart/alternative"
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsUyPcatXnfW2yXxBvfecFu8XmDiwOixZ+JJ
	tgDGKC6blNSczLLUIn27BK6MecuOMBV8/s9YseJ9I0sD4/U3jF2MnBwSAiYSM1u/AdlcHEIC
	WxglJrfsYQVJCAmsZZR4MqEaIrGDUeLVrKUsIAk2AVOJTVM7wbpFBFwlVu96yARiMwv0Mkp0
	TkwHsYUFtCXeLu5kgagxkNj0aDkbhK0nsaBrHlicRUBFYs/Ff2BxXgEniX9HroItZhQQk/h+
	ag3UTHGJW0/mM0FcKiLx8OJpNghbVOLl43+sELaBxNal+1ggbEWJl78nsYEczSzQCnT09xns
	EAsEJU7OfMIygVFkFpK5s5DVzUJSB1GUKXF1wj0oW0tiXsNvJghbUWJK90N2CFtT4srkQ1C2
	tsSyha+ZIWxdiekTjsDVz17+ihFi2VJGiQP9r1khEjoSK/uWsyIbuoCRdxWjeFpxYnFueoGB
	uV5aZmJJelF+aYFecn7uJkZghF+pfrdkB+OJC06HGAU4GJV4eDmYl8QLsSaWFVfmHmJUAZr0
	aMPqC4xSLHn5ealKIrwX/BbFC/GmJFZWpRblxxeV5qQWH2KU5mBREueNrFsYLySQnliSmp2a
	WpBaBJNl4uCUamDUf71x84nGmvuFE1MdFUyFsp4kz9z+zon3whJtpoUq0btjXjzYVbHx9I48
	/l3nFTlkLlvX6HzrWWgjduLDslLv2xNfb/3O1JjOfXW25GoZ1/NTJx6etddKtXyro9lMYesH
	n2y9X6WtdlhWHDN5+feXW8wF1+458P+dZ/G8JfXvm5VfHe2PruuyVGIpzkg01GIuKk4EAHWf
	vVH4AgAA
X-Original-Sender: jingyan.liang@marelli.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jingyan.liang@marelli.com designates 212.123.238.164
 as permitted sender) smtp.mailfrom=jingyan.liang@marelli.com
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

--_004_e2ab7c14fd244457a1faeb99ff0fe5beMXPO1FGAWfgremcit_
Content-Type: multipart/alternative;
	boundary="_000_e2ab7c14fd244457a1faeb99ff0fe5beMXPO1FGAWfgremcit_"

--_000_e2ab7c14fd244457a1faeb99ff0fe5beMXPO1FGAWfgremcit_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jailhouse develop Team,

We are Marelli(Guangzhou) Team, We are now developing TI J7 board, as we kn=
ow, TI use the jailhouse hypervisor with their Cockpit Demo. Now Marelli te=
am want to know more detail about the jailhouse hypervisor, we have some qu=
estions, Could you pls help to confirm? Thanks.

Question:

1.       Can the hypervisor allocation HW resource dynamically when hypervi=
sor running?

such as below resource, could be dynamically changed?

a.       CPU core (Adaptive cpu resource share)

b.       DDR size (Adaptive memory resource share)

c.       GPU core (Virtual GPU module share)

d.       GPIO/I2C/SPI/I2S etc.



2.       if the hypervisor could not allocation HW resource dynamically, ho=
w the design logic of  hypervisor allocate resource?

pls share some introduce documents if have.



3.       Does the hypervisor have some KPI data?

such as below info

a.       How Fast boot time when OS mount filesystem;

b.       How Fast boot time to show first image?

c.       How Fast boot time to play audio?

d.       How Fast boot time to show RVC?

e.       How Fast boot time to run second OS filesystem and touch?



4.       What=E2=80=99s the communication solutions between different OS?

Does it support sharemem, socket, or another fast/ large-capacity data comm=
unicate method?


5.       Does the hypervisor Support posix interface or not? have some meth=
od that easy for porting Application from our former OS?

if do not support posix, have another method to port easy?



6.       Pls list the hypervisor Support how much connectivity features;

such as BT/ BT LTE, Wi-Fi, ethernet stack pass TC8 test, USB Ethernet(NCM, =
RNDIS),  ZigBee etc.


7.       pls list how many Host OS does hypervisor support So far? (such as=
 Linux, Linux AGL, QNX for Cluster etc)



8.       Pls list how many Guest OS does hypervisor support So far? (such a=
s Linux, Android, Linux AGL, QNX for IVI etc)


9.       Does the hypervisor had Supported 3rd party SW lib(such as DOIP, S=
OMEIP, Adaptive Autosar, OTA solution) ?


10.   what kind of program language(such as C, C++, Python, Java, etc.) can=
 support?


11.   Is the hypervisor open source ?


12.   What kind of development tool chain(such as Compile, Debug and analyz=
e tools) can support to develop bsp and application?

such as use the IDE could debug step by step?

such as use which Compile to compile application?  GCC or itself compile?

have tool to analyze hypervisor system performance(CPU load, GPU load, DDR =
bandwidth)?



13.   What is the fault handing mechanism on the hypervisor(such as Ramdump=
, VM crash, coredump)?

How does the hypervisor analyze the system crash?



14.   What the hypervisor have got Safety certification level?

if no safety certification, pls share some introduce how does it make safet=
y?



15.   what is the hypervisor Maturity?

such as In J7 platform, how many bsp driver have release? how many project =
on going and SOP?



16.   What=E2=80=99s the security support of this hypervisor?

Does it support security boot, sandbox, MAC, security filesystem, SCM, DMM,=
 firewall, Security unpack, SRTC, TLS etc?

if the hypervisor have security feature list, pls share.


17.   How many resource usage when the hypervisor running? (such as Resourc=
e usage: CPU, RAM, ROM)



18.   Does the hypervisor had  team support in China? or which side support=
 when Chinese GuangZhou have the hypervisor project?



19.   What kinds of HMI engine can this hypervisor support(such as QT, Kanz=
i, Altia, CGI Studio, crank, html5 etc)?



20.   Does the hypervisor have some technical document(user guide) are publ=
ic?

if have website or link.

if no, how could we get these technical document?



21.   Does the hypervisor had use in OEMs?

pls share some info.



22.   How do we get the hypervisor license?  Is it free(no NRE, royalty) to=
 get license?


23.   Is is free(no NRE, royalty) to use the hypervisor and its hypervisor =
modules, Customize Support Package, Tool Chain, Special function lib?

Best Regards,
_________________________
Liang Jingyan =E6=A2=81=E6=95=AC=E5=BD=A6
Cluster SW Engineer

Magneti Marelli Automotive Electronics (Guangzhou) Co,. Ltd
No.2 Yongli Road, Xinya Street, Huadu District, Guangzhou, Guangdong, P.R.C=
hina
www.marelli.com<http://www.marelli.com/>
 [cid:image001.jpg@01D577BF.28F4D310]
 Please note our web domain and email
account have changed to marelli.com

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e2ab7c14fd244457a1faeb99ff0fe5be%40MXPO1FGAW.fgremc.it.

--_000_e2ab7c14fd244457a1faeb99ff0fe5beMXPO1FGAWfgremcit_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Arial Unicode MS";
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=E7=AD=89=E7=BA=BF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:533348547;
	mso-list-type:hybrid;
	mso-list-template-ids:-983531692 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Dear Jailhouse develop Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are Marelli(Guangzhou) Team, We are now developin=
g TI J7 board, as we know, TI use the jailhouse hypervisor with their Cockp=
it Demo. Now Marelli team want to know more detail about the jailhouse hype=
rvisor, we have some questions, Could
 you pls help to confirm? Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Question:<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">1.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Can the hypervisor allocation HW resource dynamical=
ly when hypervisor running?<o:p></o:p></p>
<p class=3D"MsoListParagraph">such as below resource<span style=3D"color:#1=
F497D">, </span>
could be dynamically changed?<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">a.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>CPU core (Adaptive cpu resource share)<o:p></o:p></=
p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">b.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>DDR size (Adaptive memory resource share)<o:p></o:p=
></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">c.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>GPU core (Virtual GPU module share)<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">d.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>GPIO/I2C/SPI/I2S etc.<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt"><o:p>&nbsp;</o:p=
></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>if the hypervisor could not allocation HW resource =
dynamically, how the design logic of&nbsp; hypervisor allocate resource?<o:=
p></o:p></p>
<p class=3D"MsoListParagraph">pls share some introduce documents if have. <=
o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">3.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Does the hypervisor have some KPI data?<o:p></o:p><=
/p>
<p class=3D"MsoListParagraph">such as below info<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">a.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>How Fast boot time when OS mount filesystem;<o:p></=
o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">b.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>How Fast boot time to show first image?<o:p></o:p><=
/p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">c.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>How Fast boot time to play audio?<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">d.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>How Fast boot time to show RVC?<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l0 level2 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">e.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>How Fast boot time to run second OS filesystem and =
touch?<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt"><o:p>&nbsp;</o:p=
></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"=
mso-list:Ignore">4.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]>What=E2=80=99s the communication solutions b=
etween different OS?<span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoListParagraph">Does it support sharemem, socket, or another =
fast/ large-capacity data communicate method?<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"=
mso-list:Ignore">5.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]>Does the hypervisor Support posix interface =
or not? have some method that easy for porting Application from our former =
OS?<span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoListParagraph">if do not support posix, have another method =
to port easy?<span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:0cm"><span style=3D"colo=
r:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">6.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Pls list the hypervisor Support how much connectivi=
ty features<span style=3D"color:#1F497D">;</span><o:p></o:p></p>
<p class=3D"MsoListParagraph">such as BT/ BT LTE, Wi-Fi, ethernet stack pas=
s TC8 test, USB Ethernet(NCM, RNDIS), &nbsp;ZigBee etc.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">7.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>pls list how many Host OS does hypervisor support S=
o far? (such as Linux, Linux AGL, QNX for Cluster etc)<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">8.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Pls list how many Guest OS does hypervisor support =
So far? (such as Linux, Android, Linux AGL, QNX for IVI etc)
<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">9.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Does the hypervisor had Supported 3rd party SW lib(=
such as DOIP, SOMEIP, Adaptive Autosar, OTA solution) ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">10.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>what kind of program language(such as C,<span style=
=3D"color:#1F497D">
</span>C&#43;&#43;,<span style=3D"color:#1F497D"> </span>Python, Java, etc.=
) can support?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">11.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>Is the hypervisor open<span style=3D"color:#1F497D"=
> </span>
source ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"=
mso-list:Ignore">12.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">=
&nbsp;&nbsp;
</span></span></span><![endif]>What kind of development tool chain(such as =
Compile, Debug and analyze tools) can support to develop bsp and applicatio=
n?<span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoListParagraph">such as use the IDE could debug step by step?=
 <o:p></o:p></p>
<p class=3D"MsoListParagraph">such as use which Compile to compile applicat=
ion?&nbsp; GCC or itself compile?<o:p></o:p></p>
<p class=3D"MsoListParagraph">have tool to analyze hypervisor system perfor=
mance(CPU load, GPU load, DDR bandwidth)?<span style=3D"color:#1F497D"><o:p=
></o:p></span></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">13.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>What is the fault handing mechanism on the hypervis=
or(such as Ramdump, VM crash, coredump)?<o:p></o:p></p>
<p class=3D"MsoListParagraph">How does the hypervisor analyze the system cr=
ash?<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">14.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>What the hypervisor have got Safety certification l=
evel?<o:p></o:p></p>
<p class=3D"MsoListParagraph">if no safety certification, pls share some in=
troduce how does it make safety?<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">15.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>what is the hypervisor Maturity?<o:p></o:p></p>
<p class=3D"MsoListParagraph">such as In J7 platform, how many bsp driver h=
ave release? how many project on going and SOP?<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">16.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>What=E2=80=99s the security support of this hypervi=
sor<span style=3D"color:#1F497D">?</span><o:p></o:p></p>
<p class=3D"MsoListParagraph">Does it support security boot, sandbox, MAC, =
security filesystem, SCM, DMM, firewall, Security unpack, SRTC,
<span style=3D"font-size:8.0pt;font-family:&quot;Verdana&quot;,sans-serif;c=
olor:#333333;background:white">
TLS </span>etc?<o:p></o:p></p>
<p class=3D"MsoListParagraph">if the hypervisor have security feature list,=
 pls share.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">17.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>How many resource usage when the hypervisor running=
? (such as Resource usage: CPU, RAM, ROM)
<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">18.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>Does the hypervisor had&nbsp; team support in China=
? or which side support when Chinese GuangZhou have the hypervisor project?=
<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">19.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>What kinds of HMI engine can this hypervisor suppor=
t(such as QT, Kanzi, Altia, CGI Studio, crank, html5 etc)?<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">20.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>Does the hypervisor have some technical document(us=
er guide) are public?
<o:p></o:p></p>
<p class=3D"MsoListParagraph">if have website or link.<o:p></o:p></p>
<p class=3D"MsoListParagraph">if no, how could we get these technical docum=
ent?<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">21.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>Does the hypervisor had use in OEMs? <o:p></o:p></p=
>
<p class=3D"MsoListParagraph">pls share some info.<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">22.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>How do we get the hypervisor license? &nbsp;Is it f=
ree(no NRE, royalty) to get license?<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:18.0pt"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">23.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span><![endif]>Is is free(no NRE, royalty) to use the hypervisor a=
nd its hypervisor modules, Customize Support Package, Tool Chain, Special f=
unction lib?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span style=3D"font-size:10.5pt;color:#1F497D;mso-fareast-language:JA=
">Best Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-GB" style=3D"font-size:10.5pt;font-family:&quot;Aria=
l&quot;,sans-serif;color:black;mso-fareast-language:JA">___________________=
______<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph;line-height:10.0pt;mso-line-height-rule:exactly">
<b><span style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;=
color:black;mso-fareast-language:JA">Liang Jingyan
</span></b><b><span lang=3D"ZH-CN" style=3D"font-size:8.0pt;font-family:=E5=
=AE=8B=E4=BD=93;color:black">=E6=A2=81=E6=95=AC=E5=BD=A6</span></b><b><span=
 style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:bl=
ack;mso-fareast-language:JA"><o:p></o:p></span></b></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph;line-height:10.0pt;mso-line-height-rule:exactly">
<span style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:black;mso-fareast-language:JA">Cluster SW Engineer<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph;line-height:10.0pt;mso-line-height-rule:exactly">
<span style=3D"mso-fareast-language:JA"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial Unicode MS&quot;,serif;color:#1F4E79;mso-fareast-language:IT">Magneti=
 Marelli Automotive Electronics (Guangzhou) Co,. Ltd
<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Ari=
al Unicode MS&quot;,serif;color:#1F4E79;mso-fareast-language:IT">No.2 Yongl=
i Road, Xinya Street, Huadu District, Guangzhou, Guangdong, P.R.China<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><u><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial Unicode MS&quot;,serif;color:#1F4E79;mso-fareast-language:JA"><a href=
=3D"http://www.marelli.com/"><span style=3D"color:#1F4E79;mso-fareast-langu=
age:IT">www.marelli.com</span></a></span></u><u><span style=3D"font-size:9.=
0pt;font-family:&quot;Arial Unicode MS&quot;,serif;color:#1F4E79;mso-fareas=
t-language:IT">
</span></u><u><span lang=3D"IT" style=3D"font-size:9.0pt;font-family:&quot;=
Arial Unicode MS&quot;,serif;color:#1F4E79;mso-fareast-language:IT"><o:p></=
o:p></span></u></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial Unicode MS&qu=
ot;,serif;color:#1F4E79;mso-fareast-language:IT">&nbsp;</span><span style=
=3D"font-family:&quot;Arial Unicode MS&quot;,serif;color:#1F4E79"><img bord=
er=3D"0" width=3D"54" height=3D"45" style=3D"width:.5625in;height:.4687in" =
id=3D"Picture_x0020_2" src=3D"cid:image001.jpg@01D6B447.915569E0" alt=3D"ci=
d:image001.jpg@01D577BF.28F4D310"></span><span style=3D"font-size:10.5pt;fo=
nt-family:&quot;Arial Unicode MS&quot;,serif;color:#1F4E79;mso-fareast-lang=
uage:IT"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial Unicode MS&qu=
ot;,serif;color:#00B0F0;mso-fareast-language:IT">&nbsp;</span><b><span styl=
e=3D"font-size:7.5pt;font-family:&quot;Arial Unicode MS&quot;,serif;color:#=
00B0F0;mso-fareast-language:IT">Please note our web domain and
 email<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:7.5pt;font-family:&quot;=
Arial Unicode MS&quot;,serif;color:#009DDC;mso-fareast-language:IT">account=
 have changed to marelli.com</span></b><span style=3D"font-size:9.0pt;font-=
family:&quot;Arial Unicode MS&quot;,serif;color:#1F4E79;mso-fareast-languag=
e:EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
om/d/msgid/jailhouse-dev/e2ab7c14fd244457a1faeb99ff0fe5be%40MXPO1FGAW.fgrem=
c.it?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/ms=
gid/jailhouse-dev/e2ab7c14fd244457a1faeb99ff0fe5be%40MXPO1FGAW.fgremc.it</a=
>.<br />

--_000_e2ab7c14fd244457a1faeb99ff0fe5beMXPO1FGAWfgremcit_--

--_004_e2ab7c14fd244457a1faeb99ff0fe5beMXPO1FGAWfgremcit_
Content-Type: image/jpeg; name="image001.jpg"
Content-Description: image001.jpg
Content-Disposition: inline; filename="image001.jpg"; size=1479;
	creation-date="Fri, 06 Nov 2020 06:30:48 GMT";
	modification-date="Fri, 06 Nov 2020 06:30:48 GMT"
Content-ID: <image001.jpg@01D6B447.915569E0>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMg
IyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCAAtADYDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDa0Xxn
e6btius3VuOzH51+h7/jXeaXrVlq8W+0mDED5kPDL9RXkFSRTS2syyQu8Uq8hlOCK92vgYVNY6M+
WwuZ1aPuy1R7VRXDaL49K7YdWXI6CdB/Mf4V0914h020slupLqMxuPk2HJb6CvJqYapTlytHv0cZ
Rqx5oyNKsTWvFdjo+5C3nXA/5ZIen1PauR1rxreajuis82tueCQfnYe57fhXNcnJ5Pqa7aGXN61f
uPNxWbpe7R+81tU8S6jqs26SdoYwfljiYqB/U0Vk0V6caNOKsoo8WWIqyd3JiHofpXp8nhyx1nR7
Qzx7JvITEycMPlH51yei+DL3U9stzm1tz3YfOw9h/jXpFvCtvBHCmSsahRn0AxXm47ELmj7N6o9n
K8I+WTqx0fc4/T/h8kdyzahcebCp+VIxjcPf/wCtXRXXh7TbuyW1e1jWNB8mwYKfQ1pUVwTxFWbu
2epTwlGnFxjHc4hPh2BfHzLzNoOQAMOfb0/GpvF+m2umeF0is4VjXzlzjq3Xqe9djis7XNITW9ON
rJI0fzBlYdiK1jipynF1HojGeBpxpTVKOrPIqK1dU8NajpU22SBpYyflkiBYH/CivdjWpyV0z5eV
CrF2cWbcXxa01/DE2ptaul3HIIxZeZlnzyCDjpgE5x2rW13xtBoek6beNaSTvfKsnkxtzHHtDM54
5Cgiub0/wvYN8NxfPGpv49PmgWfb0Uk9vXtViy8NDxLqcn2q/uoY7GwgtI1tyFyrJl8nnOfSvnnG
Fz7LmkdFrfimbT77TLTTNN/tKXUUeSLbOIxtUA5yR3BrOl+IRTS1nXSn+2C++wS20lwqCOTGfv4x
j3rAstCj1W40HTtQmklhsWu7ZWUlGZVICnIPBAxVLULBbHwgljthlXTdWPzPFxOACfnGeT2J9qFC
OwOT3O2PjC6gsYLi90lIjPex2aLFeJKPn/iyoxx6Vp61rg0e70uAwGX7fdC3DBsbMjOenNebvfPc
+DTLb21lZmz1SGdEt4SqFgCeRn2FS6n4i1HV9HsdTna3W4sNRDxhYjtPydxupezuHOdd448cr4Lj
tGewa7+0lh8soTbjHsfWivP/ABfc3fi3w/p11eyRRyx3Eqfu4zgjC9s0VrCjG2pEqjT0P//Z

--_004_e2ab7c14fd244457a1faeb99ff0fe5beMXPO1FGAWfgremcit_--
