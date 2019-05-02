Return-Path: <jailhouse-dev+bncBD7KJ5F42UDRBOOBVLTAKGQE237OC7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7951147F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 09:48:10 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id j3sf639722edb.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 00:48:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556783289; cv=pass;
        d=google.com; s=arc-20160816;
        b=V2UWd6LOcmMtlK82QTRPK9OFMAI6HVSBNiAyFNh7V3kifO3ncI/M90liTMxbdg+Nl8
         9jIyMxvmoC5f5McgZ8lvECqP1vFdM3WNs85OjUeUUS62+DTFyPm5jXDYUAMaqRmLoJSa
         4CW5rlrTrEr4SoDVmB/q7VpfOGHi0QMncT2fBqDZh86dF5/AaLeIStPbClkzBS+dFtL3
         ZqQu9aWSWzOORjIa4EBvbRROD2cXNsEortD+d6roJuDelGvjdunuVaKHwqiMeo/PUt0G
         Gp+1YlmU0TnmNd8Qd2AVa/oV01+YENU6mVlYpJW8vkjDo+c0sPoXFT6f2Gnm7BDo43el
         jA7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=Qv0YDGYrVRkpflM5iOrKYfErCzcM6sk5YIucKttdeMc=;
        b=F5oy98CDTOuhHb9SzQenJ4xjxYQ7pvwXxSQWiqvJG2TQtCNymiTAHHOxuAIWia3r6H
         DPTo/CcvMt31xnIHYJsjtl1r7Ti70fmY3COD3eYR41L9KNIn7yn1Qner0CX+RYv1/WBs
         8jGcP1NSUjraAY5kBqFN2qaKnef/ihNwqA24Iqr2R4dXd3Hpgbwqns+NN1DG69SlRjxr
         GtRkPkvTkTJq7ceULfZbLq3Z/5zS2VhWSkoVvgoXTdc7jHmhRAJCxiBnqYNk+B7ODXUC
         I7UQwFzx+jGJqt5mOfAQJEiT8ZaU17YvtcQZVWjQRvH/9AD6YOdKQLXj06tv+86KmZ4v
         5Yzg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=Su5gW732;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.1.115 as permitted sender) smtp.mailfrom=arvid@softube.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:content-id
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Qv0YDGYrVRkpflM5iOrKYfErCzcM6sk5YIucKttdeMc=;
        b=Q+RHB4fyr9zgPXDEPGaLSd3s5bPoFFqvZJYFT23C3otxDSt2W33HG66xNpT/RAq7jr
         hujvp0g/Fg2msGBPq2q+7VVGWRuAS7dKBDA659tLg80yKapo45V4L7zdXaRXQ8UNIimQ
         QwJAJNgAtj1gBV+OwQQXfZ0FVauvvlJ9YoxKyQECahhi0zGI1etkGWxLIvhAomZX9m42
         IOH7mIdyl/pOUr17MEQjlS1cqLcZ8YFb8I3W+b9yfbWA6cl3pgFyYqKLA0VxxXwC1R9r
         rDSlUZnyuVOpSjwHJwA4U9TCIPdkmJc/hWfVdNQ/oLN/pWIt3xeVo6uEVpD+3EQ0jTTx
         4g7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-id:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Qv0YDGYrVRkpflM5iOrKYfErCzcM6sk5YIucKttdeMc=;
        b=tPGdzIFlI+y9dOrYMCK3yThlauZ7/skm4qRl/yIqWVQJkje25jZvKLRQ+XdMDggece
         /0ef7VEpc9ozpecdAhrZu0szbr6FBq5/2dHZN/Md8R2J4umf7UMTYdBgSpIV0g54IgVA
         9xEGCNnhSbbY/e451l6TI90LNEV6OkbY3Cc6XCsNQafAThHG95uW6MomSho0eHm6lOWy
         UT5YaKTi6WnTkqzvQQbBE5xXLnEDUKxtDGIxI2+HTcimbQQoVXbViSrMd/Fjdi+rnxVO
         o82E27E9PmeMxyveFx7p1/C9sHJePg6yhP/BE/jKxXHqI5q0pMqqoizzUdeR8ihAW+2A
         MYcw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUGbzm1t8ZRfLc+Q5zz+NKsfDJ7XEyXCZc1Wk75IPZ+JfTLOlgQ
	Fqm8XNIQPzaDuZBO7abHTWI=
X-Google-Smtp-Source: APXvYqz5dce1zcRBDM9+dXU8STgoixdElNFpzriqWNCv4cDKuaFjsPsGoT9n/OpMt8o1ELZlYxZaog==
X-Received: by 2002:a50:ba8c:: with SMTP id x12mr1473507ede.49.1556783289813;
        Thu, 02 May 2019 00:48:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7016:: with SMTP id n22ls177910ejj.10.gmail; Thu, 02
 May 2019 00:48:09 -0700 (PDT)
X-Received: by 2002:a17:906:6149:: with SMTP id p9mr1062918ejl.55.1556783289168;
        Thu, 02 May 2019 00:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556783289; cv=none;
        d=google.com; s=arc-20160816;
        b=nJuglgv3xvtESlRQTsoOpdZ3PkgB69NSbtq/0tIXgyEsz6aC7cFZ4Ndk2FnJnhTGN5
         5AcQ2jwgZvY4d3WT1DFs2jftP7drBGCu+WF8Qx7pVnBqghZoldxbsO3bElsOEx+0SgSu
         37OrwOG0E5EBuDcU+SCvpDufXqCZKjjsFA7MF++83QBMdbtGWNQd7JczwfIodgciVs4F
         J+eBOoz7xlo/f1bZbx1QWHkEIXGvqoCgLwFnuWmbacvjAky7bc5JnsdyHZlxXjC54R+i
         GeQMbrAi0olXa5x4aCMGzRJjbggoTjfFhQu3fxZ9gOcJaKiM/oYGqEAvpJq9gMh+TyXb
         i0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=mviJpjOM2GvZrVE3td/NAPl5B02HuPKH+lxrnCG4/s8=;
        b=wVmrHW78s52pGcf5rg+AieIc6JJy7t/o3Q9DeqpKjwQqIqgDNUahw7w/ExG4/sBJyO
         yKNP8An0wpP2KhHv/V0UfDrONY259WA6v+zE+4MO1or1Pm195tzULUYVDghN1s5msr8k
         UeHk9/hIBqckIlOSG3aB1xqev07kcMTocNkgkZpX90DvNfaH8dxCm5BL+Pshi9+MxwpK
         UAasrgquDHCpl50QE38AjlOU45B3bR2dcyU+hmmHygtnRtbp1yeQxIfFI2X63JZbtU8b
         NNSKdN6vTZWVtSbayKJ5OkG8N+oJWe3BBRfoypaIHZwDAUx5uJ7zNIy2fpMa3jaXJm3p
         Pkvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=Su5gW732;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.1.115 as permitted sender) smtp.mailfrom=arvid@softube.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10115.outbound.protection.outlook.com. [40.107.1.115])
        by gmr-mx.google.com with ESMTPS id j5si1857196ejm.1.2019.05.02.00.48.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 02 May 2019 00:48:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of arvid@softube.com designates 40.107.1.115 as permitted sender) client-ip=40.107.1.115;
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com (10.168.150.22) by
 HE1PR0201MB2425.eurprd02.prod.outlook.com (10.168.146.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Thu, 2 May 2019 07:48:05 +0000
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96]) by HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96%8]) with mapi id 15.20.1835.018; Thu, 2 May 2019
 07:48:05 +0000
From: =?utf-8?B?QXJ2aWQgUm9zw6lu?= <arvid@softube.com>
To: Jan Kiszka <jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: Building on Orange Pi
Thread-Topic: Building on Orange Pi
Thread-Index: AQHU/33X36/w3ziF40Wwhk63RnMw+6ZVFyAAgAAo64CAAV4CgIAA+z0A
Date: Thu, 2 May 2019 07:48:05 +0000
Message-ID: <6CB50872-A7FF-4688-BB7D-123AF52DD87B@softube.com>
References: <F1D21E89-5762-4890-A51F-5BFC0F0B4E0A@softube.com>
 <75218ca9-fd8f-6afd-8972-0852c8121060@siemens.com>
 <225DD87D-67CA-4969-A334-B1B27FB05B9E@softube.com>
 <36943512-5495-d84b-888f-e3752adb4a4e@web.de>
In-Reply-To: <36943512-5495-d84b-888f-e3752adb4a4e@web.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.80.110.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8500c4e3-7ba3-49d0-74d1-08d6ced28302
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:HE1PR0201MB2425;
x-ms-traffictypediagnostic: HE1PR0201MB2425:
x-microsoft-antispam-prvs: <HE1PR0201MB2425088CA27CF907E2D7DF4FA1340@HE1PR0201MB2425.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(376002)(136003)(396003)(366004)(199004)(189003)(5660300002)(85182001)(73956011)(53936002)(6246003)(66946007)(66476007)(305945005)(66446008)(26005)(66556008)(6486002)(82746002)(76176011)(64756008)(6512007)(8936002)(33656002)(110136005)(316002)(6436002)(2501003)(508600001)(81166006)(81156014)(256004)(71190400001)(71200400001)(76116006)(25786009)(2616005)(3846002)(7736002)(83716004)(476003)(446003)(14454004)(486006)(99286004)(86362001)(6116002)(229853002)(8676002)(11346002)(186003)(53546011)(36756003)(102836004)(66066001)(85202003)(68736007)(2906002)(6506007)(3480700005)(66574012);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0201MB2425;H:HE1PR0201MB2332.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: softube.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: D7J04AIW9oKj66bfAoVYV85980tD9LQP8iCeG8+F3O/Q5yuUQsvxHp0YLMkrvfbUxEafqtOBnFGZhZ29dFYuwU9jOA1K2BXr7Ig1C0Hn5OWPXpo+EwFbd7IRWkzdyru8CyDJKoNaYe088CHSSP6icpHd/Gd0WfI4MlwkpjWARFMvIyTvGcoZzM6PiY3DaBknHmqj4vGRNHgx9Vr0KUrpUvt6bBEpw9IzUnDMnNsOX/7wDd3HVVsr0bckn7LBbNpmHGQ5nAiaXHPb+04Nun+xnODOVjXTrhCmvsinMRvEUnTKigSFCDrQE3c2Y+HzDPqC6bjgcV3POrUUYnUSTDRm37iZkVHdE/cVg8ekRoXMCi5GbOg+IysEw6yjPbKXh4FBxDgCj/cuLwSo2qwNh0dsV7sk4trUV0r8eI7XFusxD9Q=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <4E717DDDD2BE8D47B6768972D1147F66@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: softube.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8500c4e3-7ba3-49d0-74d1-08d6ced28302
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 07:48:05.4753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8974e373-3f62-4142-9b7f-1b77262c89ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2425
X-Original-Sender: arvid@softube.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com
 header.b=Su5gW732;       spf=pass (google.com: domain of arvid@softube.com
 designates 40.107.1.115 as permitted sender) smtp.mailfrom=arvid@softube.com
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

Hi again,

See my commands and output below.

=EF=BB=BFOn 2019-05-01, 20:48, "jailhouse-dev@googlegroups.com on behalf of=
 Jan Kiszka" <jailhouse-dev@googlegroups.com on behalf of jan.kiszka@web.de=
> wrote:

    > On 30.04.19 21:56, Arvid Ros=C3=A9n wrote:
    >> Hi Jan,
    >>
    >> Thanks! Sorry for top posting and also being unclear. I can pull the=
 sources from the repo, and download kernel sources for the running kernel.=
 However, when I try to build it, just by typing "make", I get a build erro=
r related to the syntax used in .S files and also something that I think is=
 related to tumb2 instructions. I presumed that I either needed some specia=
l toolchain, or some custom configuration in the jailhouse tree or maybe so=
me patch or something. Or is this supposed to work out of the box?
   =20
    > Please describe in more details what all you installed in the target.=
 Also
    > provide a console dump from what you called and what errors you got.

I have installed kernel headers of the running kernel, gcc, build-essential=
 and the packages listed in the control file.
Then, I try to compile jailhouse and explicitly pointing to the installed k=
ernel headers. Is this correct btw? Or do I need to get the full kernel sou=
rce and compile on my target machine?

arvid@orangepizero:~/jailhouse$ make KDIR=3D/usr/src/linux-headers-4.19.25-=
sunxi
  UPD     /home/arvid/jailhouse/hypervisor/include/generated/config.mk
  CC      /home/arvid/jailhouse/configs/arm/bananapi-gic-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-gic-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/bananapi-linux-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-linux-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/bananapi-uart-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-uart-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/bananapi.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi.cell
  CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-linux-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-linux-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-uart-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-uart-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1e.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e.cell
  CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-linux-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-linux-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-uart-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-uart-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1h.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h.cell
  CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-linux-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-linux-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-uart-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-uart-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/emtrion-rzg1m.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m.cell
  CC      /home/arvid/jailhouse/configs/arm/jetson-tk1-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/jetson-tk1-linux-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1-linux-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/jetson-tk1.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1.cell
  CC      /home/arvid/jailhouse/configs/arm/orangepi0-gic-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0-gic-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/orangepi0-linux-demo.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0-linux-demo.cell
  CC      /home/arvid/jailhouse/configs/arm/orangepi0.o
  OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0.cell
  DTC     /home/arvid/jailhouse/configs/arm/dts/inmate-bananapi.dtb
  DTC     /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1e.d=
tb
  DTC     /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1h.d=
tb
  DTC     /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1m.d=
tb
  DTC     /home/arvid/jailhouse/configs/arm/dts/inmate-jetson-tk1.dtb
  DTC     /home/arvid/jailhouse/configs/arm/dts/inmate-orangepi0.dtb
  UPD     /home/arvid/jailhouse/hypervisor/include/generated/version.h
  CC [M]  /home/arvid/jailhouse/driver/cell.o
  CC [M]  /home/arvid/jailhouse/driver/main.o
  CC [M]  /home/arvid/jailhouse/driver/sysfs.o
  DTC     /home/arvid/jailhouse/driver/vpci_template.dtb
  DTB     /home/arvid/jailhouse/driver/vpci_template.dtb.S
  AS [M]  /home/arvid/jailhouse/driver/vpci_template.dtb.o
  LD [M]  /home/arvid/jailhouse/driver/jailhouse.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/asm-defines.s
  GEN     /home/arvid/jailhouse/hypervisor/arch/arm/include/generated/asm/a=
sm-defines.h
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/control.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/dbg-write=
.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/gic-v2.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/gic-v3.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/irqchip.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/ivshmem.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/lib.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/mmu_cell.=
o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/paging.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/pci.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/psci.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/setup.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/smccc.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-hsci=
f.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-imx.=
o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-mveb=
u.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-pl01=
1.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-scif=
a.o
  CC      /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-xuar=
tps.o
  AS      /home/arvid/jailhouse/hypervisor/arch/arm/caches.o
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S: Assembler messages:
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:22: Error: invalid regis=
ter list to push/pop instruction -- `push {r0-r10}'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:26: Error: instruction n=
ot supported in Thumb16 mode -- `ands r3,r0,#0x07000000'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:30: Error: only lo regs =
allowed with immediate -- `mov r9,#0'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:33: Error: unshifted reg=
ister required -- `add r2,r9,r9,lsr#1'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:34: Error: source1 and d=
est must be same register -- `lsr r1,r0,r2'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:35: Error: unshifted reg=
ister required -- `and r1,r1,#7'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:43: Error: unshifted reg=
ister required -- `and r2,r1,#7'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:46: Error: instruction n=
ot supported in Thumb16 mode -- `ands r4,r4,r1,lsr#3'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:52: Error: instruction n=
ot supported in Thumb16 mode -- `ands r7,r7,r1,lsr#13'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:54: Error: unshifted reg=
ister required -- `orr r10,r9,r8,lsl r5'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:55: Error: unshifted reg=
ister required -- `orr r10,r10,r7,lsl r2'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:59: Error: instruction n=
ot supported in Thumb16 mode -- `subs r7,r7,#1'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:61: Error: instruction n=
ot supported in Thumb16 mode -- `subs r8,r8,#1'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:65: Error: lo register r=
equired -- `add r9,r9,#2'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:71: Error: invalid regis=
ter list to push/pop instruction -- `pop {r0-r10}'
scripts/Makefile.build:403: recipe for target '/home/arvid/jailhouse/hyperv=
isor/arch/arm/caches.o' failed
make[4]: *** [/home/arvid/jailhouse/hypervisor/arch/arm/caches.o] Error 1
scripts/Makefile.build:544: recipe for target '/home/arvid/jailhouse/hyperv=
isor/arch/arm' failed
make[3]: *** [/home/arvid/jailhouse/hypervisor/arch/arm] Error 2
scripts/Makefile.build:544: recipe for target '/home/arvid/jailhouse/hyperv=
isor' failed
make[2]: *** [/home/arvid/jailhouse/hypervisor] Error 2
Makefile:1520: recipe for target '_module_/home/arvid/jailhouse' failed
make[1]: *** [_module_/home/arvid/jailhouse] Error 2
Makefile:40: recipe for target 'modules' failed
make: *** [modules] Error 2


This seems to be caused by AS using the wrong syntax or something. After so=
me searching, I can fix it by adding the line:
.syntax unified
to the top of the file.

However, I then run into the following problem:
  UPD     /home/arvid/jailhouse/hypervisor/include/generated/version.h
  CC [M]  /home/arvid/jailhouse/driver/main.o
  LD [M]  /home/arvid/jailhouse/driver/jailhouse.o
  AS      /home/arvid/jailhouse/hypervisor/arch/arm/caches.o
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S: Assembler messages:
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:55: Error: shift must be=
 constant -- `orr r10,r9,r8,lsl r5'
/home/arvid/jailhouse/hypervisor/arch/arm/caches.S:56: Error: shift must be=
 constant -- `orr r10,r10,r7,lsl r2'

My guess is that this is caused by the fact that AS is trying to assemble t=
he file for arch=3Dthumb, but the source is written for arch=3Darm.
I'm not good at this, so that might be totally wrong of course.

Best Regards,
Arvid


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
