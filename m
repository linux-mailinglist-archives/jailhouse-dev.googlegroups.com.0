Return-Path: <jailhouse-dev+bncBD7KJ5F42UDRBEXBYLTAKGQEXLPN67I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7C3155EA
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 00:09:22 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id u18sf11556267wrq.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 15:09:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557180562; cv=pass;
        d=google.com; s=arc-20160816;
        b=L/gsPxCIojvVNEBg+dPWdTErhm6U7TWMhzvl9iTpQ5UjpkXyc1HeZFYzDq53yaTITc
         xGYYGYKYNvyHXO/fwbiFoVYB9jDewQypJtWvitcPihSCc6WqIoQGEBu/XR4CYG9c/njz
         jJrN83dHcaF0+cRKL1N0zZidZujZkdCpcXEUU2IT6tM6qbaY8Qa4TkEqNB3MlEsVw1rY
         iPYgXHBVP9TfLkcuufueWwx02sz5zqxEkwPo/bgGDzyAffwqxQRrXhWEisnzradrv0gZ
         OFZauaBuCN3uf4AROh3jlSpRe8Jy7kB9gdoBcrh7Etm0xrgUq9yGCaHfa+myLTjY6gtK
         ceDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=HriZSBZaoVIr5zHgwiUhk2zFzb33C3PnU5uugPWFGo4=;
        b=SQKErJ3sdryKhYLPe2wKe4yXxHBFQY98goBjQmzzQnSk6lxphA6FejloEU/Y72cxww
         XK/ZnplfW2rGqnxgw8Vcq+HZ3T7Foes6gwD0g9I2gb7Qlnd6GmSTXRbv1PqjkaFIyWQu
         kJoazssDTtQyygqqR0yIMBKic1yxI+4oEorVxVcLOW1n9gugaauvLqDFhGLrsKhy8ySm
         j/rkm639kOXwkH1gocWwnF6MpEaqJJYLM9gQpa7lAJkwDmLZYonZClZgZvEtBfNe4fZZ
         77HvpybqsEaAZa7sbzrrk/vuPTf2fZoTvYQoHrvQJ2BLtn2NGHFJnoK/KHAO6Rdwo4N+
         nXSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=B5IAX5RT;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.4.99 as permitted sender) smtp.mailfrom=arvid@softube.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:content-id
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HriZSBZaoVIr5zHgwiUhk2zFzb33C3PnU5uugPWFGo4=;
        b=EwJehCwGZDdRTgDzlTjr5hrcXKvLIs3ioLKZvmBj/TAB+fnuUaiMUvJQa8Gudc5z65
         /rEiBQaVe7ZAiorsEAID4Urlk6V/orwx+ZrCTCMQvilV6WjyCVgMISI5diCemf8Qiitu
         wDsPUS4w3zuywHPaOfXsvLcXejmmiRIRDRBjTgNocZOyVqOXRoNYrJy2Pn+SWQdbTCFF
         dYl7krvIBhpNpGD4p8igN9LGKg9PqYo9GT7Re7Jv00pLfe9CLO92JyhlJ+47wdJRuOTH
         QHbeqCtqHx/wP/SdDJes6+Ri8KREnFteaixCB5pR0LtnV6PQUoDn7mJfx4TdKXb45MV3
         HEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-id:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HriZSBZaoVIr5zHgwiUhk2zFzb33C3PnU5uugPWFGo4=;
        b=XxFC/NjclloDH9o94A8c+aqHgq946Cx3C1Q3kGvGBY1fFFzSNbZ5Ikmhc0bgY68OoP
         lsT9wPHSx6RLQhsqhYDzVq7DFmQOROPBeiIcKvGF90rqMca0vP+i5MjTKzeBQjgn3LlI
         kXt1HO+CfQBexynWOaOPjLCYfr6lcGb7HW/bU2LePu8omWff0yp3i+GX6npzZvbm/M/n
         jQzg7svxK8I4bUoPz4YQll4zrPenjCsGkn4c9z5NGemKrYDWrLosNoBv12qvWxi6m26x
         JAKCIyGdQUHEU9P3lE10w1sbN9cJvY4urnPvsvLwknHG6iUFwO0bRRrQBrw9lC2RIfnn
         CEJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWI7EamHUNzn9WLnHnBKgjULcdOfXQ0982AhAErf+Dgp+hQTL5F
	Igg1KuRos9Yih17wKaISLlo=
X-Google-Smtp-Source: APXvYqz8veaHe+2ZOgFRXB6GcM5NWyQaCZZk4seTM+LzDG/H3Uzaxa5T2qfv4KYeFoe/pb6+S23c7Q==
X-Received: by 2002:adf:ec51:: with SMTP id w17mr2722114wrn.326.1557180562583;
        Mon, 06 May 2019 15:09:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:db81:: with SMTP id u1ls3404737wri.14.gmail; Mon, 06 May
 2019 15:09:22 -0700 (PDT)
X-Received: by 2002:a5d:6912:: with SMTP id t18mr15351147wru.17.1557180562013;
        Mon, 06 May 2019 15:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557180562; cv=none;
        d=google.com; s=arc-20160816;
        b=f9uR2btOr9oKes6x9/8tykCTNRG5J7lZp53EJTj/SRUypVqs6uf3rWm70X7Wh08rtP
         oF+abDtt3mfcxKn8IzNRI2+16FV/PKfVzb9NImRsWX2kcCbtbR8tfLuKYpqcFmGUYf3y
         gqmuYlDiH/Bhpt7qui7ZV3iR7LAkufeS+BwW6j/lZPissb0LdRFK0gTx/wSFu71sWw2t
         mXogUmcnQXgTvaZmNBboQqLP71L+320HdeHkIzEF+FI0JDs/QZSZETp4EQVNonoH0QeI
         JnuG14eQxEMlCPdH0hZ+xC7p9tyXzTtjGTQIxv1qBIVpDkh+ooIfpLNCPeF/34CJ1QuB
         ic8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=YiWmkFEFtaHDCpUeuObAv9zWCgFeadcOYoSMC9a/V2w=;
        b=bvv6XiFXyVOJFfckv6+negTPFZJxsIxcg5ezzUpdFUz/h32LGpYjPNWrfqG/bfZkzK
         VuAKPmkUONVyAtBxqDo+VRd3U0Qh7mVfUGAdCebZNet2WWRkYuxaMOjg3pCzpwml3bSG
         HsL869g4FOT4uhQNLk4y5hk/Ba8ob+BngROJyUhWHNnTyfCkQvVCkFPkAzxpJKGWxPgR
         aMeyrI12XVeyXFiYRKbeAe/di4zOBs34+a2hfOSUaKqgRbkXyBJt6mJ7JJLBj+S99NP8
         96T8SAQF+cvSbeTds9Fb4iLK7d06RrjDj4hHWvWQOhyb8QzJ7E8ZcIrc7LzLx6XSdZoh
         +SgA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=B5IAX5RT;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.4.99 as permitted sender) smtp.mailfrom=arvid@softube.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40099.outbound.protection.outlook.com. [40.107.4.99])
        by gmr-mx.google.com with ESMTPS id z70si971785wmc.2.2019.05.06.15.09.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 06 May 2019 15:09:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of arvid@softube.com designates 40.107.4.99 as permitted sender) client-ip=40.107.4.99;
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com (10.168.150.22) by
 HE1PR0201MB2315.eurprd02.prod.outlook.com (10.168.150.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Mon, 6 May 2019 22:09:18 +0000
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96]) by HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96%8]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 22:09:18 +0000
From: =?utf-8?B?QXJ2aWQgUm9zw6lu?= <arvid@softube.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: Building on Orange Pi
Thread-Topic: Building on Orange Pi
Thread-Index: AQHU/33X36/w3ziF40Wwhk63RnMw+6ZVFyAAgAAo64CAAV4CgIAA+z0AgAABtoCAAEuREIAESeiAgAEUp4CAAM57gIAAv6GA
Date: Mon, 6 May 2019 22:09:18 +0000
Message-ID: <8F1E713F-3714-4634-9C88-1EC81E3B27D2@softube.com>
References: <F1D21E89-5762-4890-A51F-5BFC0F0B4E0A@softube.com>
 <75218ca9-fd8f-6afd-8972-0852c8121060@siemens.com>
 <225DD87D-67CA-4969-A334-B1B27FB05B9E@softube.com>
 <36943512-5495-d84b-888f-e3752adb4a4e@web.de>
 <6CB50872-A7FF-4688-BB7D-123AF52DD87B@softube.com>
 <454361b4-b5fd-de0b-5d5f-d4c51f4b786b@web.de>
 <HE1PR0201MB23325FA2853B5CF1B9DB9963A1340@HE1PR0201MB2332.eurprd02.prod.outlook.com>
 <e65bfedc-880a-b2d0-d21c-506e5eea7008@web.de>
 <1B499BC3-8628-4DB7-A37C-B68F02B2592B@softube.com>
 <67ff0ff9-f648-0482-ac1c-32e1c4431d66@siemens.com>
In-Reply-To: <67ff0ff9-f648-0482-ac1c-32e1c4431d66@siemens.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [81.230.58.122]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dac032d-be0e-4926-64a7-08d6d26f7c05
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:HE1PR0201MB2315;
x-ms-traffictypediagnostic: HE1PR0201MB2315:
x-microsoft-antispam-prvs: <HE1PR0201MB23150B363DC193B7FAEF7611A1300@HE1PR0201MB2315.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39840400004)(396003)(136003)(346002)(376002)(189003)(199004)(110136005)(68736007)(99286004)(229853002)(36756003)(508600001)(186003)(446003)(14454004)(76176011)(316002)(102836004)(86362001)(6506007)(26005)(66066001)(6436002)(6486002)(76116006)(6246003)(6116002)(7736002)(6512007)(53936002)(5660300002)(2906002)(64756008)(66556008)(66446008)(66476007)(8676002)(66946007)(73956011)(256004)(81156014)(305945005)(81166006)(71200400001)(2616005)(14444005)(33656002)(476003)(486006)(85182001)(85202003)(8936002)(82746002)(25786009)(71190400001)(2501003)(11346002)(83716004)(3480700005)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0201MB2315;H:HE1PR0201MB2332.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: softube.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A7CxpxczoeyxM8WfVjyiMMTeO3fEd9fx0jNqk0fiDZOBnseFkd4Dp+CyahsjsGEhN8dlwtlgwwDmnRz+REkx/xKFkxiEO1cDIz4f0jj+IBkKDsbINby3O73aDda1wahLN250HXHBCfVhebkgkUbDJGMTjT9/uUTMUNgPezbJt98CV1dpcxwEnaxCkHkc7+RwFh7+xCTjU/YK2tKnHsZqjU5H5X+GlzYsTAn/OyU0qO1l/TCSgxnSjlcethqiggCJ3cbapI1u3JbZGb205pO6RlNVa/SKnzvl0dSLmDp+jamrXWdua7WAbr68eynvhygb82H7W7MW1Fr6vtnymId8RAlQnR9e6cFLhB0AjZb0ieJFdRmZLQ8QggFwkCyWkAvDMw3a9pc6pX07SzZuzOnQO9hK8NTw4ZpYW9la1qbo798=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <886B1A940F4EC545B07DEB59DF3D6168@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: softube.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dac032d-be0e-4926-64a7-08d6d26f7c05
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 22:09:18.1833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8974e373-3f62-4142-9b7f-1b77262c89ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2315
X-Original-Sender: arvid@softube.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com
 header.b=B5IAX5RT;       spf=pass (google.com: domain of arvid@softube.com
 designates 40.107.4.99 as permitted sender) smtp.mailfrom=arvid@softube.com
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


=EF=BB=BFOn 2019-05-06, 14:43, "Jan Kiszka" <jan.kiszka@siemens.com> wrote:
    >> Some, more information about this issue. After some more testing I c=
an now confirm that the kernel config flag "CONFIG_THUMB2_KERNEL" is causin=
g the assembly problem I saw, which was roughly what I expected early on.
   >> So, the stock OrangePi Armbian kernel seems to be compiled using the =
THUMB2 instruction set, but the jailhouse assembly files are not THUMB2 com=
patible, and then some instructions are missing.
    >> I have no idea how this is usually handled, or if this is the only p=
lace the build will fail if we use thumb2.
    >> I'm rebuilding the kernel now with the .config taken from the jailho=
use-images repo instead. Let's see how that goes!
    >
    >What is the gcc output for such a thumb-enabled build? Maybe we need t=
o filter=20
    >something. OTOH, we set KBUILD_CFLAGS in hypervisor/Makefile which is =
supposed=20
    >to avoid such effects.
   =20
Hi again. Here is a typical command line using the working configuration:
   arm-linux-gnueabihf-gcc -Wp,-MD,certs/.system_certificates.o.d  -nostdin=
c -isystem /usr/lib/gcc-cross/arm-linux-gnueabihf/6/include -I./arch/arm/in=
clude -I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi=
 -I./arch/arm/include/generated/uapi -I./include/uapi -I./include/generated=
/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -D__A=
SSEMBLY__ -fno-PIE -mabi=3Daapcs-linux -mfpu=3Dvfp -funwind-tables -marm -W=
a,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -include a=
sm/unified.h -msoft-float -I.   -c -o certs/system_certificates.o=20

With the option "Compile the kernel in Thumb-2 mode" (CONFIG_THUMB2_KERNEL)=
 set to 'y', I get the following line instead:
arm-linux-gnueabihf-gcc -Wp,-MD,certs/.system_certificates.o.d  -nostdinc -=
isystem /usr/lib/gcc-cross/arm-linux-gnueabihf/6/include -I./arch/arm/inclu=
de -I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi -I=
./arch/arm/include/generated/uapi -I./include/uapi -I./include/generated/ua=
pi -include ./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -D__ASSE=
MBLY__ -fno-PIE -mabi=3Daapcs-linux -mfpu=3Dvfp -funwind-tables -mthumb -Wa=
,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -Wa,-mthumb -D__LINUX_ARM_=
ARCH__=3D7 -march=3Darmv7-a -include asm/unified.h -msoft-float -I.   -c -o=
 certs/system_certificates.o =20

The important difference is  "-marm" -> "-mthumb" I guess.

Another approach would be to fix the assembly code so that it actually work=
s using thumb2 too, but I have no idea if there are other things in the cod=
e base that will fail too because of this.

Cheers,
Arvid

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
