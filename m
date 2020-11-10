Return-Path: <jailhouse-dev+bncBDE3XXPWEAIP33FH7UCRUBGAOJEXM@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C802ACAE9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 03:10:06 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id h12sf2276266ljc.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Nov 2020 18:10:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604974206; cv=pass;
        d=google.com; s=arc-20160816;
        b=BkXHc9nyQQdP5Zp00VSz6xRCpUH4dpr8qx5LPpTtISNEOYLKRs367FRpX2B9PlmyG7
         5cBVjtksowzaTQZJpzWWg9ALhqo543DUtU+PfCJswCtNFU08qQ77fBR9EapijXM4mKZG
         47EEITxKTds2HGkra2cYondRALsKd8MC91fPXJMBw8YbLr2GA+ggH5N3hkHNmLlF/k7I
         IF8W2jTRPPOdImAGozkVMmVmqbQ5GLXNphZPWMkp+NXqDEB2W3IIIMOAtknTF41/Ul9S
         wlGlr+f/MW534ZmLYNn2AP9pN9CZOF4L3UYfooRNYPN9fIz9aG752vY5B69EFtSGzVYK
         OvHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :references:message-id:date:thread-index:thread-topic:subject:cc:to
         :from:sender:dkim-signature;
        bh=sZwCo0Z+bzJxKQ84YJVlnkmcaV92pddfH0W9Cbazxec=;
        b=g4bOZVWzHv9Ya2G6RyNAxNvxP8W87Tr9yqlcO91SYCLLNKsXBx3UM6nKcGszxcRJCw
         PMTRMymNLFd5EghzYgvXRuEUH+4j42eCSfCCGsuujKwp4RNMZflBTMkBFVQ1sTPX+zVT
         s59X8W9mG6epVYZ8JqamD73zLTJ6xg2IRI1xgDSKyOsQZNuAqjOWXT4w12EYzbi7nv8g
         NlZcr0shOmL6n/UIn9S9T1gtovP0Unc/ngqzhLn4m22u1h5W9vDSA53OoLQTH+GJfIZX
         mvUArpN026NTFKori/DDSQsysDBX2b4RL+66KnWR6UDKGoplLMvTlJJJXqGqaW5WqvAm
         WZ3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jingyan.liang@marelli.com designates 212.123.238.166 as permitted sender) smtp.mailfrom=jingyan.liang@marelli.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sZwCo0Z+bzJxKQ84YJVlnkmcaV92pddfH0W9Cbazxec=;
        b=LnXZEaiYQHRVBvkUhz6QQwxtZengjJqaHrrzRmjtHiAWDe7GOmOSjzBk9sNnHm24gs
         /qfUUPZLtID0lzEoWtHzT8cyY5YaF93SkpWDK0KUjwkbxfWvt0pngPr7ulNJQq8dnOVi
         HjqBzGB6L9T7O2OabfXjrLirz/Tc7cpNvMHSewN2EtQYw6WY5MRxlld6jf1Q/F30L2s4
         X+Bfx6pXieHgTLP0xYGmflwCKEt36zE+CdcNO04JD+XJ+613GK2aMqHU3wVz0sNUw0fh
         5DTXwYe3f9kqeWupm4jAQQAoL9dtjDVc7AwXitCnK6s1/uLhJ+k36JisE8VxtGFpY7+K
         8SDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=sZwCo0Z+bzJxKQ84YJVlnkmcaV92pddfH0W9Cbazxec=;
        b=X/tecMfe8BYmB2j9OjeEHxb0FXVHIEawo27ARwHAy5PTXdTJqtjIOFhlhpt9Q4KH38
         mVUtGJDWtpOIBz9cgzn1F4MNJy2nOV8erilO/xtznFK5Cot/CojA8KjB9fUzW4ND410W
         YyWiFBCnVELMgodNPU03QKlqayBPPC62Ywu2vJOz/KAVfOrOnj9rN525Jwd9yhg0bgzz
         ElaAyIypppLCr/elwAxOmnAdDUu0Mjg7crFDmw9urj8uoKyzJuf1VIE+iuHJC/SbjeeV
         Km6sKIQDTHRLSIzSdItFW5roqglQwQJeHQ5QUHEbnWKfwJaNl3ssWTNkBtCwkDrPUCUC
         9M7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5303npk2SXVPhTnDZaooU+nHsyG01He7bcvgR6sXUsslUkHsxFJJ
	D/uyDY19cdw9Z9/0LVBLvus=
X-Google-Smtp-Source: ABdhPJxwhe0atWYmViL49k/Y/SzQtMjaaFErJpHGxaLXW53qfP6SZ44krJ4Y/SodqDH9KYpt+1GTow==
X-Received: by 2002:ac2:5638:: with SMTP id b24mr4453053lff.332.1604974206097;
        Mon, 09 Nov 2020 18:10:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:888a:: with SMTP id k10ls1801325lji.10.gmail; Mon, 09
 Nov 2020 18:10:05 -0800 (PST)
X-Received: by 2002:a2e:99d7:: with SMTP id l23mr306283ljj.303.1604974204930;
        Mon, 09 Nov 2020 18:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604974204; cv=none;
        d=google.com; s=arc-20160816;
        b=Pyx87Ez16jYNwffl7cOgxLh3D5fpLbk+olmNAqm9JU3nlUx8g4Amy12mW0rlg8KS1V
         eF4QGRSg3all/T8gRFO9iyjDWwS5gvnttWkJJm0HraEpkk3n2KlfyZI3b3GjSBQMJjOd
         hy3CAaEAbUDLTCAcTmEayxDEp8TvkgaE3w4XJ232CSNTIZubIUdh1kecK3GjL2Jb375d
         HfqUAUoHL1l6OT/+lojX7I5GfaORANJX6taNtCI4j2B6eCWbjjPCd+C/rQJEFMLMbjNt
         PzWk2Kf0y8Ky/2yfuLOoS3cKrqk24mAdsgw/ycIk1SZDd7zXwingKlxu57gf65a91BlE
         NiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=9WvM63F89XBoqZCNltH/Wzq4SVILVkMeL/n+9XSc/As=;
        b=ozSdZJQpUCMnwcix5S/yulpi4NMVaCTt2Kza31wZeFhWRyD0RSkX1rOG+AZhZ/gGFE
         cUs2yHOBhdMX9fMSxQFqRErAtG3Sg1HaN2bJJJEziTHrdBPg8JGniUyfMZjZ7UMm6dju
         AhHPR6vf7dAh0ebIN61iMB+7B5QERUS0OmSecojtRRkGI0n3zMAcHnakReFD+KRYGnFT
         iKbYdRxvBdotPuPrqd2oTuBJ5d3xWapsUrR4HV0iEYYQqRF4Dzb+tBlKWkMKenjUGewv
         tgy+fby6ZxBNAqqXJwP2dy00248mpiVf7kMnBFFIpJNXIXcweZ888b0XDGJJeyXDhSgu
         Bi/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jingyan.liang@marelli.com designates 212.123.238.166 as permitted sender) smtp.mailfrom=jingyan.liang@marelli.com
Received: from fsasmgp09.fiatgroup.com (mx2fcms.fiatgroup.com. [212.123.238.166])
        by gmr-mx.google.com with ESMTPS id y12si239831lfb.1.2020.11.09.18.10.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2020 18:10:04 -0800 (PST)
Received-SPF: pass (google.com: domain of jingyan.liang@marelli.com designates 212.123.238.166 as permitted sender) client-ip=212.123.238.166;
X-AuditID: d47beea6-749ff70000005c11-36-5fa9f67cdd14
Received: from MXPP1FGAW.fgremc.it ( [151.92.70.128])
	by fsasmgp09.fiatgroup.com (ESMTP IBM SMTP Gateway) with SMTP id 7C.EE.23569.C76F9AF5; Tue, 10 Nov 2020 03:10:04 +0100 (CET)
Received: from MXPO1FGAW.fgremc.it (151.92.70.126) by MXPP1FGAW.fgremc.it
 (151.92.70.128) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 10 Nov
 2020 03:10:03 +0100
Received: from MXPO1FGAW.fgremc.it ([fe80::b4b3:c124:c673:3e00]) by
 MXPO1FGAW.fgremc.it ([fe80::b4b3:c124:c673:3e00%20]) with mapi id
 15.00.1497.006; Tue, 10 Nov 2020 03:10:03 +0100
From: "Liang Jingyan (M)" <jingyan.liang@marelli.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, "Xiao Jianhao (M)"
	<jianhao.xiao@marelli.com>, "GAO Zhao (M)" <Zhao.Gao@marelli.com>, "THOMAS
 Deuilhe (M)" <deuilhe.thomas@marelli.com>, "Jiang Depeng (M)"
	<depeng.jiang@marelli.com>
Subject: RE: [J7] jailhouse hypervisor in TI J7
Thread-Topic: [J7] jailhouse hypervisor in TI J7
Thread-Index: Ada0BUq2fZ+ea6OYTKyzqIhrUlxtBQAGff+AAAK6kYAAtkXtcAAAxvOg
Date: Tue, 10 Nov 2020 02:10:03 +0000
Message-ID: <568cc1cefdfe496b8988719f793e1fc2@MXPO1FGAW.fgremc.it>
References: <e2ab7c14fd244457a1faeb99ff0fe5be@MXPO1FGAW.fgremc.it>
 <20201106102901.i4qk35q4g6eqglhu@NiksLab>
 <484b82e2-8f05-485e-49e0-4e0ddbab989b@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [151.92.70.225]
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsUyPcatQbfm28p4gxsTOCxeLzCxuHfzJrPF
	3LMJDsweeyaeZPPYfnISk8fxG9uZApijuGxSUnMyy1KL9O0SuDJaL7czF5zTrVj75RFrA+MO
	nS5GTg4JAROJlm+7GbsYuTiEBLYwSnRsXckOkhASWMcocbHNFyKxk1Hiz41DjCAJNgFTiU1T
	O8FsEQENiblXb4J1MwusYpL4dGkfWLewgL7Euld9TBBFBhKbHi1ng7DdJOZeuglmswioSiw4
	tpYVxOYVcJLYdOo3K8TmJYwSExfYg9iMAmIS30+tAZvDLCAucevJfCaIswUkluw5zwxhi0q8
	fPyPFcI2kNi6dB8LhK0o8fL3JKBdHEC9mhLrd+lDjFGUmNL9kB1iraDEyZlPWCYwis1CsmEW
	QscsJB2zkHQsYGRZxSieVpxYnJteYGCpl5aZWJJelF9aoJecn7uJERhTV6rfLdvBeO6C0yFG
	AQ5GJR7eA69WxguxJpYVV+YeYpTgYFYS4XX6tyJeiDclsbIqtSg/vqg0J7X4EKM0B4uSOO8X
	JaBqgfTEktTs1NSC1CKYLBMHp1QD4xK7ubLTjNkVtwXZb3zYNm2GGWf18VWbXlq21NyadIsn
	P3bCcbeJO1oUEv6L8anyTl610tH7bvV6HfvOXR+CAiRWH1ZbVdxWr/Wyab3Cl6jdKTN31wev
	djz4y/1vs3eD4FU9SR6b9jPbFbfs3fs/kvHj+QUrGrfOTLr426NbbharlhFPjXu0nxJLcUai
	oRZzUXEiAFe+qcGlAgAA
X-Original-Sender: jingyan.liang@marelli.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jingyan.liang@marelli.com designates 212.123.238.166
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

Sorry, the format have some problem. I Fix It in with this mail.

BR,
Jingyan


-----Original Message-----
From: Liang Jingyan (M)=20
Sent: 2020=E5=B9=B411=E6=9C=8810=E6=97=A5 10:07
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Cc: 'Jan Kiszka' <jan.kiszka@siemens.com>; jailhouse-dev@googlegroups.com; =
Xiao Jianhao (M) <jianhao.xiao@marelli.com>; GAO Zhao (M) <Zhao.Gao@marelli=
.com>; THOMAS Deuilhe (M) <deuilhe.thomas@marelli.com>; Jiang Depeng (M) <d=
epeng.jiang@marelli.com>
Subject: RE: [J7] jailhouse hypervisor in TI J7

Hi Devshatwar, Kiszka
Thanks for your reply, it's helpful for us.

Also there are some additional questions we want to know.

> MM Question:
> 3.       Does the hypervisor have some KPI data?
>=20
> such as below info
>=20
> a.       How Fast boot time when OS mount filesystem;
>=20
> b.       How Fast boot time to show first image?
>=20
> c.       How Fast boot time to play audio?
>=20
> d.       How Fast boot time to show RVC?
>=20
> e.       How Fast boot time to run second OS filesystem and touch?
>=20
Devshatwar >> This varies across different platforms. There is no benchmark=
ing data for the TI platform.

Jingyan >> If there didn't have the detail data on the J7 platfrom, is OK. =
However, what we want to know is that does jailhouse has some fastboot solu=
tion? Because now the jailhouse start is depend on the first Linux(Of cours=
e, the Linux optimize should done by SoC Vender or Ourselfs). If we want to=
 Show image/audio/RVC(Astern imaging system), but this function is in the n=
on-root cell OS, how can jailhouse support it.


> MM Question
> 17.   How many resource usage when the hypervisor running? (such as Resou=
rce usage: CPU, RAM, ROM)
>=20
Devshatwar >> Currenly, for TI platform, 6MB RAM is reserved for hypervisor=
 There is some CPU usage when enabling hypervisor and using VM management h=
ypercalls. At runtime, Jailhouse is involved only while handling the interr=
upt injection part and IVshmem.

Jingyan >> In this case, we want to know some detail data about hypervisor =
resource usage. With upon answer, we know the RAM is 6MB, how about CPU and=
 ROM? We know the CPU use should be very less(Like < 2% or < 1%), Is there =
a detail theoretical or practical tests results?


BR,
Jingyan

-----Original Message-----
From: Jan Kiszka <jan.kiszka@siemens.com>
Sent: 2020=E5=B9=B411=E6=9C=886=E6=97=A5 19:47
To: Nikhil Devshatwar <nikhil.nd@ti.com>; Liang Jingyan (M) <jingyan.liang@=
marelli.com>
Cc: jailhouse-dev@googlegroups.com; Xiao Jianhao (M) <jianhao.xiao@marelli.=
com>; GAO Zhao (M) <Zhao.Gao@marelli.com>; THOMAS Deuilhe (M) <deuilhe.thom=
as@marelli.com>
Subject: Re: [J7] jailhouse hypervisor in TI J7

On 06.11.20 11:29, 'Nikhil Devshatwar' via Jailhouse wrote:
> On 06:30-20201106, Liang Jingyan (M) wrote:
>>
>> 14.   What the hypervisor have got Safety certification level?
>>
>> if no safety certification, pls share some introduce how does it make sa=
fety?
>>
>>
>=20
> I think the smaller code base, deterministic resource allocation and=20
> other decisions are taken considering the usage of this hypervisor in=20
> safety critical systems. This shoud ease in certification.
>=20
> However, there is no certification done for Jailhouse
>=20

...and that is because of the lack of a suitable hardware platform - up to =
now - which provides the necessary safety properties in order to use the hy=
pervisor as a safety element.

Certifying the Jailhouse code base itself would be doable with reasonable e=
ffort (we actually discussed that with a certification authority, T=C3=9CV,=
 already). However, that alone would not help you if you cannot map it on s=
ome real hardware. Check, e.g, if you can get a safety manual that covers t=
he A-core MMU so that Jailhouse can rely on it (and/or check it during runt=
ime) for establishing spatial partitioning.
You can also watch [1] on that, namely the discussion at the end of my talk=
. It's old but - to my best knowledge - still valid in this regard, unfortu=
nately.

A good share of these issues we are currently trying to address via hardwar=
e/software co-design in a research project [2].

Jan

[1] https://connect.linaro.org/resources/hkg18/hkg18-115/
[2] https://www.selene-project.eu/

--
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/568cc1cefdfe496b8988719f793e1fc2%40MXPO1FGAW.fgremc.it.
