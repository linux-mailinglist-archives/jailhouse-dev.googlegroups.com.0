Return-Path: <jailhouse-dev+bncBD7KJ5F42UDRBIH5VPTAKGQEPGFGXFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF111B63
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 16:28:48 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id w13sf2115326wmc.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 07:28:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556807328; cv=pass;
        d=google.com; s=arc-20160816;
        b=nvB5iQaZu+Wdrl93vo48VSMgy7fu0yLhhTcAN7gqUlDltVDYNpnqIP6Jkn7ukG0MLd
         iU2xR7EKa30v3w4R4dRnlQQAmzSgeU8xMW+uQ72rn+PgTF7hgu4+LM0OaRHiT7ck74OQ
         mBIzvA5YeyIm9WqBZVbJkZKrsCM/yztnxirGH8hLdTNAvi5WugEfEpHvOAatpREtdvVN
         U2z+Z6exaY+ZRQmRV7aJWN8CdfV8NN3DmG6Ns0cdjtCnyfW1G5A+p5PMdRUEZ3S4bZij
         wC3xNmNRqWHKW982+/oAxGq5MEt3LgLeTtPFDzR9yJiOazQVlOQ3AEw22pjDO1y+KEhW
         sHSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=fbjm+6MaRdypVJZBjrPFw555yizcObl+zB43p68hLk8=;
        b=L8sRGHboztjZtv0eGuRJYCPMPMrLw84Iq3JBAc/8uf7IKXKPnXF8W3fkZqKA5791qb
         cTi3JyyhC1I331iKBnDS0Ye1mC6nJmaD8+6re2p7HiU6iAzzp6UdQOHgUI1FYkn2niMN
         qsH3bk2HUeuEi7521n/ZXqfvd5brtRKhs5iyoGrHM5J0IVB0FAbnNVbYOxST4zD9o8md
         zqQSWOyrTq3FNSILF2LHBjVH1/sYkUwykhkXJ/JBu+UdDQX5mmxdh8FqTt968UZcSiwu
         nx3/uz0x7ey6TJlgXSy05ErX3T3sBv9TIUe0HRyViaXg39erEruqIDbtsbdV6MjLGq+K
         rltA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=fmq2+6jW;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.3.108 as permitted sender) smtp.mailfrom=arvid@softube.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fbjm+6MaRdypVJZBjrPFw555yizcObl+zB43p68hLk8=;
        b=i7o4AqcidT7/29RudAVhvD44VpgXgHq1nebJ5du+hpUlP/zJrv+siFApdbZOXdtXmM
         iorCNIAcaYwPOIKwhfWI7YHk9RVceDE+vRkn0CAA3WmpQ2HybeXhl8kvSGRCu81SH5GS
         PufPihUQ7I643ocATEokgz1oLGmhwwT2xS9RF4cV1FHMToqMml74RS+ktX/XCwv1DFkO
         8pUew1K6vZQ6UbqNsTpR32yEcNP9NRJT3r6Q/4QbJvHd3uroc/SCbxNcELoRlrOVowCQ
         SsBRvml6e5lw3yYSWExYeTvj5kr/wDXxaNMmGkxvT7d8HsySjJgapwDtThw9mHJdkEIB
         wbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fbjm+6MaRdypVJZBjrPFw555yizcObl+zB43p68hLk8=;
        b=KDAkChsVfqw313APFpjx2415tCoC78+sTJqJulFeTign4eGQqfzbpR0gD2Uo/pfouy
         V/k5i6rGg+ZBkPF7svfjxqytcOwrE+Cnobm+SWJG9QIK+ygfzSbXXRnVnAJlyuGAJ/mn
         ROdz7rEL0ik1V66tSyojcJx8UbiGkWUEOHHD9Ummu5ryxBKpXrZ3v33t+IlRwpH/jS0v
         yy+Oo+dYTorgH1yWNzLp/1cvb0UgYVgC5CNt6JDZoWXTMiGDpzUpM1h045HdwQO+QvB7
         GttrVeOE01Hc916zDGi8OPM3d0rYlzgeMgIwt+9G7el4OTyKZtxxfyMJN41WCLWasL2T
         G+zA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW0jmdIlh4b1iAWR+eT5S7vlPQSYA5bZ3oj0J5E1Bf703uVecyD
	4sGDSYkWP+mzyItFR2F1FV8=
X-Google-Smtp-Source: APXvYqzhNi2sEA5HY6T91Mo6Zww0eEPsur+lbDAl+J66UEv1NV0mRnilYJf77QeapXnGrXPfK6bKLA==
X-Received: by 2002:a5d:6a0e:: with SMTP id m14mr3212313wru.27.1556807328469;
        Thu, 02 May 2019 07:28:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b406:: with SMTP id d6ls759906wmf.2.canary-gmail; Thu,
 02 May 2019 07:28:47 -0700 (PDT)
X-Received: by 2002:a1c:7a12:: with SMTP id v18mr2664724wmc.69.1556807327745;
        Thu, 02 May 2019 07:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556807327; cv=none;
        d=google.com; s=arc-20160816;
        b=UJ+3RKUHwdtMqpDEX7vLtRpvidP4Tjv9xxBMCCtEEcwDD5llySdKX7btRWR+R2ar80
         5lKVdBuz/kNe4ygGhw7i5BllwqA+p2dxer35w7xwuKPM61xcAI03B4+JIAKHKkCorBKJ
         FCCpQdy5P+q6nMP4HgeBXIfhNksjqENxPFC+hbF/KLwKNjrwKv9U7TCWD+Fhv0FoOl2S
         ntZaJnNsVGjJHmtjxQ2v5jvo6BOnY/xVNfqcb+TJskhWdYjF+x9U4Zak9zcUEj2NG7Z2
         AO4BzJFGvyZf83XDRD2mdcUb/uDJRQL8J0m4tXU4kGNzaI27+LHRuTQTKVULbQLKTwYq
         r4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from:dkim-signature;
        bh=rWYV5dDXIrk1kuFPBO/F6cPem7nvSJtPCLXsA6DAauQ=;
        b=shjwXIML3dVtL/OfZ5WNltSkOMQ61l1gjVOQZSXxBa9drNavFIJ2xJtyS1bacRTypf
         wiwclIRD2nECUmVKeamnhxmzlg9oKgizBmeQMZvVrVmhTUy0Y8h2djvfgPckrRoA6cmz
         /QKqyxnIVaqWA/baQpw7crfTI+NE/CyBRIpqy/W0BxhLyP+nc75Ogfhcu30a+yzbdElb
         ybaUVtT2SMhL0kbZTKbQR74ta2HlyZ/rNhOWi/A/ODbXAjxPTUJwqknAn6gD55gZ5j+x
         Al28C1EeD456KTID5uzPKiQBWnQayer91BcneRlzjcPzwU3thEcwdQo5iTlxnxQK7/uN
         Ni/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=fmq2+6jW;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.3.108 as permitted sender) smtp.mailfrom=arvid@softube.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30108.outbound.protection.outlook.com. [40.107.3.108])
        by gmr-mx.google.com with ESMTPS id u2si435801wri.2.2019.05.02.07.28.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 02 May 2019 07:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of arvid@softube.com designates 40.107.3.108 as permitted sender) client-ip=40.107.3.108;
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com (10.168.150.22) by
 HE1PR0201MB2394.eurprd02.prod.outlook.com (10.168.145.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Thu, 2 May 2019 14:28:44 +0000
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96]) by HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96%8]) with mapi id 15.20.1835.018; Thu, 2 May 2019
 14:28:44 +0000
From: =?utf-8?B?QXJ2aWQgUm9zw6lu?= <arvid@softube.com>
To: Jan Kiszka <jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: Building on Orange Pi
Thread-Topic: Building on Orange Pi
Thread-Index: AQHU/33X36/w3ziF40Wwhk63RnMw+6ZVFyAAgAAo64CAAV4CgIAA+z0AgAABtoCAAEuREA==
Date: Thu, 2 May 2019 14:28:44 +0000
Message-ID: <HE1PR0201MB23325FA2853B5CF1B9DB9963A1340@HE1PR0201MB2332.eurprd02.prod.outlook.com>
References: <F1D21E89-5762-4890-A51F-5BFC0F0B4E0A@softube.com>
 <75218ca9-fd8f-6afd-8972-0852c8121060@siemens.com>
 <225DD87D-67CA-4969-A334-B1B27FB05B9E@softube.com>
 <36943512-5495-d84b-888f-e3752adb4a4e@web.de>
 <6CB50872-A7FF-4688-BB7D-123AF52DD87B@softube.com>,<454361b4-b5fd-de0b-5d5f-d4c51f4b786b@web.de>
In-Reply-To: <454361b4-b5fd-de0b-5d5f-d4c51f4b786b@web.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [40.67.248.122]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1f70395-fc4a-4ac6-6f50-08d6cf0a7b65
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:HE1PR0201MB2394;
x-ms-traffictypediagnostic: HE1PR0201MB2394:
x-microsoft-antispam-prvs: <HE1PR0201MB23943B576418B037D2142F84A1340@HE1PR0201MB2394.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(136003)(376002)(346002)(39850400004)(199004)(189003)(66556008)(446003)(76116006)(2906002)(66476007)(966005)(508600001)(66946007)(66446008)(3480700005)(73956011)(316002)(99286004)(7696005)(85182001)(102836004)(76176011)(68736007)(81156014)(54896002)(66574012)(66066001)(476003)(9686003)(11346002)(81166006)(64756008)(6246003)(8676002)(8936002)(6116002)(3846002)(53936002)(71200400001)(486006)(6436002)(7736002)(71190400001)(5660300002)(91956017)(55016002)(229853002)(52536014)(86362001)(256004)(30864003)(14454004)(74316002)(85202003)(26005)(53546011)(186003)(25786009)(33656002)(6306002)(2501003)(110136005)(6506007);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0201MB2394;H:HE1PR0201MB2332.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: softube.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Pi217vXIAaVStzKZRyczN0LJdoqD8tfZ/cXo35R1MFL59LUoqZRBUlJJPqoR+WzUAHYIFi1aJt9YiKpO2Fnu3PW3G4YTXq9vJt5uIAtyS0wx2j8Mt2MwRf5esFlzNJxjO4K9AOW513h+tNkdLFCBTz1QCXLK5o1as+liDXI6DXNqU296Lt5ZeOhCHEI15kCCaj6/6bFXR2LAvNAyb7JA59YKe08IEzJ1aZPIgFVAAnSw9HJIlQBzesQNHlFtFYLzTNd36rmuHoSmJIK4vT83+3dRd48UXdutfkYOUpFCRPgNYFOLjgiJMOyq6YtFaVVuR7Ap8EAvTO4SjlRjPBkXYuoO7rIuGCAxHrlw/LRmd/PxuPK/zb4nAWw1Yg+vNNQiAcnYMwR8r4mjB9Xb3CPRjGsTUsMz3zart/qFFo+ZsOg=
Content-Type: multipart/alternative;
	boundary="_000_HE1PR0201MB23325FA2853B5CF1B9DB9963A1340HE1PR0201MB2332_"
MIME-Version: 1.0
X-OriginatorOrg: softube.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f70395-fc4a-4ac6-6f50-08d6cf0a7b65
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 14:28:44.4209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8974e373-3f62-4142-9b7f-1b77262c89ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2394
X-Original-Sender: arvid@softube.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com
 header.b=fmq2+6jW;       spf=pass (google.com: domain of arvid@softube.com
 designates 40.107.3.108 as permitted sender) smtp.mailfrom=arvid@softube.com
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

--_000_HE1PR0201MB23325FA2853B5CF1B9DB9963A1340HE1PR0201MB2332_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi again,

Thanks. I=E2=80=99ll try the same thing with the stock kernel source to see=
 if it=E2=80=99s a toolchain or source problem. This kernel came with the o=
range pi Debian image. I guess it=E2=80=99s patched for that Allwinner chip=
 or something.

Does the jailhouse build derive compiler flags etc. from the kernel headers=
 somehow? That could explain the problem too maybe. I=E2=80=99ll report bac=
k.

Cheers,
Arvid


________________________________
Fr=C3=A5n: jailhouse-dev@googlegroups.com p=C3=A5 uppdrag av Jan Kiszka <ja=
n.kiszka@web.de>
Skickat: torsdag, maj 2, 2019 11:54 fm
Till: Arvid Ros=C3=A9n; jailhouse-dev@googlegroups.com
=C3=84mne: Re: Building on Orange Pi

On 02.05.19 09:48, Arvid Ros=C3=A9n wrote:
> Hi again,
>
> See my commands and output below.
>
> =EF=BB=BFOn 2019-05-01, 20:48, "jailhouse-dev@googlegroups.com on behalf =
of Jan Kiszka" <jailhouse-dev@googlegroups.com on behalf of jan.kiszka@web.=
de> wrote:
>
> > On 30.04.19 21:56, Arvid Ros=C3=A9n wrote:
> >> Hi Jan,
> >>
> >> Thanks! Sorry for top posting and also being unclear. I can pull the s=
ources from the repo, and download kernel sources for the running kernel. H=
owever, when I try to build it, just by typing "make", I get a build error =
related to the syntax used in .S files and also something that I think is r=
elated to tumb2 instructions. I presumed that I either needed some special =
toolchain, or some custom configuration in the jailhouse tree or maybe some=
 patch or something. Or is this supposed to work out of the box?
>
> > Please describe in more details what all you installed in the target. A=
lso
> > provide a console dump from what you called and what errors you got.
>
> I have installed kernel headers of the running kernel, gcc, build-essenti=
al and the packages listed in the control file.
> Then, I try to compile jailhouse and explicitly pointing to the installed=
 kernel headers. Is this correct btw? Or do I need to get the full kernel s=
ource and compile on my target machine?
>
> arvid@orangepizero:~/jailhouse$ make KDIR=3D/usr/src/linux-headers-4.19.2=
5-sunxi

Where did you get that kernel from?

> UPD /home/arvid/jailhouse/hypervisor/include/generated/config.mk
> CC /home/arvid/jailhouse/configs/arm/bananapi-gic-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-gic-demo.cell
> CC /home/arvid/jailhouse/configs/arm/bananapi-linux-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-linux-demo.cell
> CC /home/arvid/jailhouse/configs/arm/bananapi-uart-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-uart-demo.cell
> CC /home/arvid/jailhouse/configs/arm/bananapi.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi.cell
> CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-linux-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-linux-demo.cell
> CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-uart-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-uart-demo.cell
> CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1e.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e.cell
> CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-linux-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-linux-demo.cell
> CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-uart-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-uart-demo.cell
> CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1h.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h.cell
> CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-linux-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-linux-demo.cell
> CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-uart-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-uart-demo.cell
> CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1m.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m.cell
> CC /home/arvid/jailhouse/configs/arm/jetson-tk1-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1-demo.cell
> CC /home/arvid/jailhouse/configs/arm/jetson-tk1-linux-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1-linux-demo.cell
> CC /home/arvid/jailhouse/configs/arm/jetson-tk1.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1.cell
> CC /home/arvid/jailhouse/configs/arm/orangepi0-gic-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0-gic-demo.cell
> CC /home/arvid/jailhouse/configs/arm/orangepi0-linux-demo.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0-linux-demo.cell
> CC /home/arvid/jailhouse/configs/arm/orangepi0.o
> OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0.cell
> DTC /home/arvid/jailhouse/configs/arm/dts/inmate-bananapi.dtb
> DTC /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb
> DTC /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb
> DTC /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb
> DTC /home/arvid/jailhouse/configs/arm/dts/inmate-jetson-tk1.dtb
> DTC /home/arvid/jailhouse/configs/arm/dts/inmate-orangepi0.dtb
> UPD /home/arvid/jailhouse/hypervisor/include/generated/version.h
> CC [M] /home/arvid/jailhouse/driver/cell.o
> CC [M] /home/arvid/jailhouse/driver/main.o
> CC [M] /home/arvid/jailhouse/driver/sysfs.o
> DTC /home/arvid/jailhouse/driver/vpci_template.dtb
> DTB /home/arvid/jailhouse/driver/vpci_template.dtb.S
> AS [M] /home/arvid/jailhouse/driver/vpci_template.dtb.o
> LD [M] /home/arvid/jailhouse/driver/jailhouse.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/asm-defines.s
> GEN /home/arvid/jailhouse/hypervisor/arch/arm/include/generated/asm/asm-d=
efines.h
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/control.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/dbg-write.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/gic-v2.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/gic-v3.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/irqchip.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/ivshmem.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/lib.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/mmu_cell.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/paging.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/pci.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/psci.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/setup.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/smccc.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-hscif.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-imx.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-mvebu.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-pl011.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-scifa.o
> CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-xuartps.o
> AS /home/arvid/jailhouse/hypervisor/arch/arm/caches.o
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S: Assembler messages:
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:22: Error: invalid reg=
ister list to push/pop instruction -- `push {r0-r10}'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:26: Error: instruction=
 not supported in Thumb16 mode -- `ands r3,r0,#0x07000000'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:30: Error: only lo reg=
s allowed with immediate -- `mov r9,#0'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:33: Error: unshifted r=
egister required -- `add r2,r9,r9,lsr#1'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:34: Error: source1 and=
 dest must be same register -- `lsr r1,r0,r2'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:35: Error: unshifted r=
egister required -- `and r1,r1,#7'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:43: Error: unshifted r=
egister required -- `and r2,r1,#7'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:46: Error: instruction=
 not supported in Thumb16 mode -- `ands r4,r4,r1,lsr#3'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:52: Error: instruction=
 not supported in Thumb16 mode -- `ands r7,r7,r1,lsr#13'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:54: Error: unshifted r=
egister required -- `orr r10,r9,r8,lsl r5'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:55: Error: unshifted r=
egister required -- `orr r10,r10,r7,lsl r2'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:59: Error: instruction=
 not supported in Thumb16 mode -- `subs r7,r7,#1'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:61: Error: instruction=
 not supported in Thumb16 mode -- `subs r8,r8,#1'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:65: Error: lo register=
 required -- `add r9,r9,#2'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:71: Error: invalid reg=
ister list to push/pop instruction -- `pop {r0-r10}'
> scripts/Makefile.build:403: recipe for target '/home/arvid/jailhouse/hype=
rvisor/arch/arm/caches.o' failed
> make[4]: *** [/home/arvid/jailhouse/hypervisor/arch/arm/caches.o] Error 1
> scripts/Makefile.build:544: recipe for target '/home/arvid/jailhouse/hype=
rvisor/arch/arm' failed
> make[3]: *** [/home/arvid/jailhouse/hypervisor/arch/arm] Error 2
> scripts/Makefile.build:544: recipe for target '/home/arvid/jailhouse/hype=
rvisor' failed
> make[2]: *** [/home/arvid/jailhouse/hypervisor] Error 2
> Makefile:1520: recipe for target '_module_/home/arvid/jailhouse' failed
> make[1]: *** [_module_/home/arvid/jailhouse] Error 2
> Makefile:40: recipe for target 'modules' failed
> make: *** [modules] Error 2
>
>
> This seems to be caused by AS using the wrong syntax or something. After =
some searching, I can fix it by adding the line:
> .syntax unified
> to the top of the file.
>
> However, I then run into the following problem:
> UPD /home/arvid/jailhouse/hypervisor/include/generated/version.h
> CC [M] /home/arvid/jailhouse/driver/main.o
> LD [M] /home/arvid/jailhouse/driver/jailhouse.o
> AS /home/arvid/jailhouse/hypervisor/arch/arm/caches.o
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S: Assembler messages:
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:55: Error: shift must =
be constant -- `orr r10,r9,r8,lsl r5'
> /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:56: Error: shift must =
be constant -- `orr r10,r10,r7,lsl r2'
>
> My guess is that this is caused by the fact that AS is trying to assemble=
 the file for arch=3Dthumb, but the source is written for arch=3Darm.
> I'm not good at this, so that might be totally wrong of course.
>

It is probably related to the kernel headers package used here, because the
whole thing works fine with our kernel. May still be a bug in the Jailhouse
build system in the end.

Jan

--
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

--_000_HE1PR0201MB23325FA2853B5CF1B9DB9963A1340HE1PR0201MB2332_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
</head>
<body>
<div><style id=3D"ms-outlook-ios-style" type=3D"text/css">html {
background-color: transparent;
}

body {
color: #333;
line-height: 150%;
font-family: "-apple-system", "HelveticaNeue";
margin: 0;
}

.ms-outlook-ios-reference-expand {
display: block;
color: #999;
padding: 20px 0px;
text-decoration: none;
}

.ms-outlook-ios-availability-container {
max-width: 500px;
margin: auto;
padding: 12px 15px 15px 15px;
border: 1px solid #C7E0F4;
border-radius: 4px;
}

.ms-outlook-ios-availability-container > .ms-outlook-ios-availability-delet=
e-button {
width: 25px;
height: 25px;
right: -12px;
top: -12px;
background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEsAAA=
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
BzRAPSFNM7HEAAAAASUVORK5CYII=3D");
background-size: 25px 25px;
background-position: center;
}

#ms-outlook-ios-main-container {
margin: 0 0 0 0;
margin-top: 120;
padding: 8;
}

#ms-outlook-ios-content-container {
padding: 0;
padding-top: 12;
padding-bottom: 20;
}

.ms-outlook-ios-mention {
color: #333;
background-color: #f1f1f1;
border-radius: 4px;
padding: 0 2px 0 2px;
pointer-events: none;
text-decoration: none;
}

.ms-outlook-ios-mention-external {
color: #ba8f0d;
background-color: #fdf7e7;
}

.ms-outlook-ios-mention-external-clear-design {
color: #ba8f0d;
background-color: #f1f1f1;
}</style>
<meta name=3D"viewport" content=3D"width=3Ddevice-width, user-scalable=3Dno=
, initial-scale=3D1.0, minimum-scale=3D1.0, maximum-scale=3D1.0">
<div style=3D"direction: ltr;">
<div style=3D"direction: ltr;">Hi again,</div>
<div><br>
</div>
<div style=3D"direction: ltr;">Thanks. I=E2=80=99ll try the same thing with=
 the stock kernel source to see if it=E2=80=99s a toolchain or source probl=
em. This kernel came with the orange pi Debian image. I guess it=E2=80=99s =
patched for that Allwinner chip or something.</div>
<div><br>
</div>
<div style=3D"direction: ltr;">Does the jailhouse build derive compiler fla=
gs etc. from the kernel headers somehow? That could explain the problem too=
 maybe. I=E2=80=99ll report back.</div>
<div><br>
</div>
<div style=3D"direction: ltr;">Cheers,</div>
<div style=3D"direction: ltr;">Arvid</div>
<div class=3D"ms-outlook-ios-signature">
<div style=3D"direction: ltr;"><br>
</div>
</div>
</div>
<div>&nbsp;</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"dir=3D&quot;ltr&quot;"><font face=3D"Calib=
ri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>Fr=C3=A5n:</b=
> jailhouse-dev@googlegroups.com p=C3=A5 uppdrag av Jan Kiszka &lt;jan.kisz=
ka@web.de&gt;<br>
<b>Skickat:</b> torsdag, maj 2, 2019 11:54 fm<br>
<b>Till:</b> Arvid Ros=C3=A9n; jailhouse-dev@googlegroups.com<br>
<b>=C3=84mne:</b> Re: Building on Orange Pi
<div>&nbsp;</div>
</font></div>
On 02.05.19 09:48, Arvid Ros=C3=A9n wrote: <br>
&gt; Hi again, <br>
&gt; <br>
&gt; See my commands and output below. <br>
&gt; <br>
&gt; =EF=BB=BFOn 2019-05-01, 20:48, &quot;jailhouse-dev@googlegroups.com on=
 behalf of Jan Kiszka&quot; &lt;jailhouse-dev@googlegroups.com on behalf of=
 jan.kiszka@web.de&gt; wrote:
<br>
&gt; <br>
&gt; &gt; On 30.04.19 21:56, Arvid Ros=C3=A9n wrote: <br>
&gt; &gt;&gt; Hi Jan, <br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; Thanks! Sorry for top posting and also being unclear. I can p=
ull the sources from the repo, and download kernel sources for the running =
kernel. However, when I try to build it, just by typing &quot;make&quot;, I=
 get a build error related to the syntax used in .S
 files and also something that I think is related to tumb2 instructions. I =
presumed that I either needed some special toolchain, or some custom config=
uration in the jailhouse tree or maybe some patch or something. Or is this =
supposed to work out of the box?
<br>
&gt; <br>
&gt; &gt; Please describe in more details what all you installed in the tar=
get. Also <br>
&gt; &gt; provide a console dump from what you called and what errors you g=
ot. <br>
&gt; <br>
&gt; I have installed kernel headers of the running kernel, gcc, build-esse=
ntial and the packages listed in the control file.
<br>
&gt; Then, I try to compile jailhouse and explicitly pointing to the instal=
led kernel headers. Is this correct btw? Or do I need to get the full kerne=
l source and compile on my target machine?
<br>
&gt; <br>
&gt; arvid@orangepizero:~/jailhouse$ make KDIR=3D/usr/src/linux-headers-4.1=
9.25-sunxi <br>
<br>
Where did you get that kernel from? <br>
<br>
&gt; UPD /home/arvid/jailhouse/hypervisor/include/generated/config.mk <br>
&gt; CC /home/arvid/jailhouse/configs/arm/bananapi-gic-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-gic-demo.cell <br>
&gt; CC /home/arvid/jailhouse/configs/arm/bananapi-linux-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-linux-demo.cell <br=
>
&gt; CC /home/arvid/jailhouse/configs/arm/bananapi-uart-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-uart-demo.cell <br>
&gt; CC /home/arvid/jailhouse/configs/arm/bananapi.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi.cell <br>
&gt; CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-linux-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-linux-demo.cel=
l <br>
&gt; CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-uart-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-uart-demo.cell=
 <br>
&gt; CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1e.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e.cell <br>
&gt; CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-linux-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-linux-demo.cel=
l <br>
&gt; CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-uart-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-uart-demo.cell=
 <br>
&gt; CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1h.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h.cell <br>
&gt; CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-linux-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-linux-demo.cel=
l <br>
&gt; CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-uart-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-uart-demo.cell=
 <br>
&gt; CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1m.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m.cell <br>
&gt; CC /home/arvid/jailhouse/configs/arm/jetson-tk1-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1-demo.cell <br>
&gt; CC /home/arvid/jailhouse/configs/arm/jetson-tk1-linux-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1-linux-demo.cell <=
br>
&gt; CC /home/arvid/jailhouse/configs/arm/jetson-tk1.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1.cell <br>
&gt; CC /home/arvid/jailhouse/configs/arm/orangepi0-gic-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0-gic-demo.cell <br>
&gt; CC /home/arvid/jailhouse/configs/arm/orangepi0-linux-demo.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0-linux-demo.cell <b=
r>
&gt; CC /home/arvid/jailhouse/configs/arm/orangepi0.o <br>
&gt; OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0.cell <br>
&gt; DTC /home/arvid/jailhouse/configs/arm/dts/inmate-bananapi.dtb <br>
&gt; DTC /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1e.dt=
b <br>
&gt; DTC /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1h.dt=
b <br>
&gt; DTC /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1m.dt=
b <br>
&gt; DTC /home/arvid/jailhouse/configs/arm/dts/inmate-jetson-tk1.dtb <br>
&gt; DTC /home/arvid/jailhouse/configs/arm/dts/inmate-orangepi0.dtb <br>
&gt; UPD /home/arvid/jailhouse/hypervisor/include/generated/version.h <br>
&gt; CC [M] /home/arvid/jailhouse/driver/cell.o <br>
&gt; CC [M] /home/arvid/jailhouse/driver/main.o <br>
&gt; CC [M] /home/arvid/jailhouse/driver/sysfs.o <br>
&gt; DTC /home/arvid/jailhouse/driver/vpci_template.dtb <br>
&gt; DTB /home/arvid/jailhouse/driver/vpci_template.dtb.S <br>
&gt; AS [M] /home/arvid/jailhouse/driver/vpci_template.dtb.o <br>
&gt; LD [M] /home/arvid/jailhouse/driver/jailhouse.o <br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/asm-defines.s <br>
&gt; GEN /home/arvid/jailhouse/hypervisor/arch/arm/include/generated/asm/as=
m-defines.h
<br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/control.o <=
br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/dbg-write.o=
 <br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/gic-v2.o <b=
r>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/gic-v3.o <b=
r>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/irqchip.o <=
br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/ivshmem.o <=
br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/lib.o <br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/mmu_cell.o =
<br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/paging.o <b=
r>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/pci.o <br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/psci.o <br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/setup.o <br=
>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/smccc.o <br=
>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-hscif.=
o <br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-imx.o =
<br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-mvebu.=
o <br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-pl011.=
o <br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-scifa.=
o <br>
&gt; CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-xuartp=
s.o <br>
&gt; AS /home/arvid/jailhouse/hypervisor/arch/arm/caches.o <br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S: Assembler messages=
: <br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:22: Error: invalid =
register list to push/pop instruction -- `push {r0-r10}'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:26: Error: instruct=
ion not supported in Thumb16 mode -- `ands r3,r0,#0x07000000'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:30: Error: only lo =
regs allowed with immediate -- `mov r9,#0'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:33: Error: unshifte=
d register required -- `add r2,r9,r9,lsr#1'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:34: Error: source1 =
and dest must be same register -- `lsr r1,r0,r2'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:35: Error: unshifte=
d register required -- `and r1,r1,#7'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:43: Error: unshifte=
d register required -- `and r2,r1,#7'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:46: Error: instruct=
ion not supported in Thumb16 mode -- `ands r4,r4,r1,lsr#3'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:52: Error: instruct=
ion not supported in Thumb16 mode -- `ands r7,r7,r1,lsr#13'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:54: Error: unshifte=
d register required -- `orr r10,r9,r8,lsl r5'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:55: Error: unshifte=
d register required -- `orr r10,r10,r7,lsl r2'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:59: Error: instruct=
ion not supported in Thumb16 mode -- `subs r7,r7,#1'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:61: Error: instruct=
ion not supported in Thumb16 mode -- `subs r8,r8,#1'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:65: Error: lo regis=
ter required -- `add r9,r9,#2'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:71: Error: invalid =
register list to push/pop instruction -- `pop {r0-r10}'
<br>
&gt; scripts/Makefile.build:403: recipe for target '/home/arvid/jailhouse/h=
ypervisor/arch/arm/caches.o' failed
<br>
&gt; make[4]: *** [/home/arvid/jailhouse/hypervisor/arch/arm/caches.o] Erro=
r 1 <br>
&gt; scripts/Makefile.build:544: recipe for target '/home/arvid/jailhouse/h=
ypervisor/arch/arm' failed
<br>
&gt; make[3]: *** [/home/arvid/jailhouse/hypervisor/arch/arm] Error 2 <br>
&gt; scripts/Makefile.build:544: recipe for target '/home/arvid/jailhouse/h=
ypervisor' failed
<br>
&gt; make[2]: *** [/home/arvid/jailhouse/hypervisor] Error 2 <br>
&gt; Makefile:1520: recipe for target '_module_/home/arvid/jailhouse' faile=
d <br>
&gt; make[1]: *** [_module_/home/arvid/jailhouse] Error 2 <br>
&gt; Makefile:40: recipe for target 'modules' failed <br>
&gt; make: *** [modules] Error 2 <br>
&gt; <br>
&gt; <br>
&gt; This seems to be caused by AS using the wrong syntax or something. Aft=
er some searching, I can fix it by adding the line:
<br>
&gt; .syntax unified <br>
&gt; to the top of the file. <br>
&gt; <br>
&gt; However, I then run into the following problem: <br>
&gt; UPD /home/arvid/jailhouse/hypervisor/include/generated/version.h <br>
&gt; CC [M] /home/arvid/jailhouse/driver/main.o <br>
&gt; LD [M] /home/arvid/jailhouse/driver/jailhouse.o <br>
&gt; AS /home/arvid/jailhouse/hypervisor/arch/arm/caches.o <br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S: Assembler messages=
: <br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:55: Error: shift mu=
st be constant -- `orr r10,r9,r8,lsl r5'
<br>
&gt; /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:56: Error: shift mu=
st be constant -- `orr r10,r10,r7,lsl r2'
<br>
&gt; <br>
&gt; My guess is that this is caused by the fact that AS is trying to assem=
ble the file for arch=3Dthumb, but the source is written for arch=3Darm.
<br>
&gt; I'm not good at this, so that might be totally wrong of course. <br>
&gt; <br>
<br>
It is probably related to the kernel headers package used here, because the=
 <br>
whole thing works fine with our kernel. May still be a bug in the Jailhouse=
 <br>
build system in the end. <br>
<br>
Jan <br>
<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.
<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev&#43;unsubscribe@googlegroups.com.
<br>
For more options, visit https://groups.google.com/d/optout. <br>
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
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--_000_HE1PR0201MB23325FA2853B5CF1B9DB9963A1340HE1PR0201MB2332_--
