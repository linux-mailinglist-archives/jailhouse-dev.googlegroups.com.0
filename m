Return-Path: <jailhouse-dev+bncBD7KJ5F42UDRBMVJ4XTAKGQESAU4BMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE8E1B4E4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2019 13:27:46 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id k18sf8351055wrl.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2019 04:27:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557746866; cv=pass;
        d=google.com; s=arc-20160816;
        b=mdASl08haNdbXCa/abIMJuUwHfbAxubk0hQk/fqpSaQN/UdPq623uMYPjawjeeluFB
         3DjiENWWfdI3nx6MjIaQrN1rPi5N3bXvkbxhiK5+blz7FIVkXGN2zVZz0ezNUZRyifHP
         cCn1rSRiV18QNjQwKZQFyUEh9eMvW/IqbjWWP8uC8nfl8Q2U8py/qGI6SCLhSVsHk+UA
         aT+vSo/ycGdi5nxr+0ErkH/P0S1Tj3+Xxy1lpAC97Fs0wIc/5m1Zrql902jczHHXEMhk
         aADkBxC+rAlQgfllc1fp4mWgIFj08w+lWsAGWpEi1/iFU6MlzLODcWX1inIXFB/L4Q+W
         g9ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=YoOcbTLSnyKnn7pFevqs4Jq8hKt4oPt/kXwyklRQieU=;
        b=BwiBYAf8hRop722rfAhiFzHm1y9IJnezCrx0uvjkLbvNEVtnThsDFmZECLgs5Xj6Ul
         02axTDAYgglBPlKmc3kYuLVtECdJNfGi2NpftnbWiEAaK5UqjXthjXp0qZ2zmxhp3OkI
         wItnHqa8g1h4FAYmiJD7CvwNPyWpOZ+bHZgDp/MNtRo9X+S4fW6PHdzFHU4Dj01/ocHB
         P8e4vfHoC5eetmP/njBasm17xd2ch2Aqzg+GCh01dmuPmPFnQxMrI5JsKYyDLP4IOEnh
         CCpmmVb9NjACv8Z3v2HXynX0dg6086FrCHqk/rGIh+AumvmjTjZMu3PPjnJP7kT0aAhV
         6JrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=nSl9WaMB;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.0.95 as permitted sender) smtp.mailfrom=arvid@softube.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:content-id
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YoOcbTLSnyKnn7pFevqs4Jq8hKt4oPt/kXwyklRQieU=;
        b=EvCYqkdov+nmaC4dztBWEwTHh1mua0+qvN0cSias14Cw4pDB4J3rLTOdEYWIeiUgcl
         GfbDAqBLgoESuhkcBvGBJAXe2pdPB4elqtHjyaS3mdzQXXhDNjtf8xxkoSS8jg0fjfBe
         JhoK8M3DQRXAnqrAP9EsYeOG7gHB4qT1QJDhNOqci5Dz6RarhM1MP2UBnLRSluyZeJWX
         JMeSykxh2TxWDS03Ka+voRgQMn87YUDsHE4noysLIVKZOiRBBww50saF7TBZ7q0NMqdG
         8Gwsh7XhW24ffumrmfpd8IQviHPrsbHyNSgknTf1ocEtTvxYa2V1g/TX6VhUM7curqqo
         t0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-id:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=YoOcbTLSnyKnn7pFevqs4Jq8hKt4oPt/kXwyklRQieU=;
        b=pz/5rpTU50Ylo/WemK9CJPB4rgAq01gQAFa6n07NMypEtoXbARCKy9znepsKvt7w2f
         a8KhJi5xaNhbpoYIvpggQtUkPjlZ1suj/VyLD65dpNniIgz40od4wZ+eE498+HVdebL/
         GMOkBkXE3QgCwTa4Z3qdFzCWmIwJRlq4X6Of0N7sXcRmOhVWOOUVs+wfjyPwVYu/usP/
         86GLgp4s6mstKgzUMM8Qg6OUEofKSwrEznSqezEXFBzUJ5S+AxyzWgVoASI0L+NnVTQY
         6Z8K0L7vZOdRC6tMnxh8zsigdmD/NsqTf13ZJWa4otjv5nDo6jpClxRMA4YalIYcGzPG
         TaAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVm9eX3EepPr1L1p38RjBdZ426DXtPqjnqfyYRJOAh644LN8pwF
	/tX27sGrCUUX0QtDa52tWyk=
X-Google-Smtp-Source: APXvYqyGaIBfM0nJEraOdnYw1KItcNJp9uf9iuwEgBeomBkUZiS4Gnip+mBO9Vsw5nV7boLpVrZeMg==
X-Received: by 2002:adf:f743:: with SMTP id z3mr2057220wrp.129.1557746866555;
        Mon, 13 May 2019 04:27:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c18b:: with SMTP id x11ls2094835wre.15.gmail; Mon, 13
 May 2019 04:27:46 -0700 (PDT)
X-Received: by 2002:a5d:628d:: with SMTP id k13mr17008167wru.319.1557746865986;
        Mon, 13 May 2019 04:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557746865; cv=none;
        d=google.com; s=arc-20160816;
        b=xVYhEjT0roMqDU2DbzASOpJTJalr293jngk77I8vRl05f+b3Ovb2cvSoPsOE6u4Qew
         ZJFXWaqYz2gdUqL2EEUMD/haKqdM9RDvOAAsnjiGiMNJUCf69narWw1sKGj89NPmGH7t
         +XGxukzw2HZNUwXhnslRnBZbE4+NvSjCJABj0e8MZ0D6yKPZCiTSrbHH5d/6Kj81m42P
         rIbWVu7iMMxEaQ2BRG2zWToIEnjEZG9LrVIjRkgFQCKdtlg9u4GJ8Re//jwJQO179lWU
         YoPz5YAWi8/Fl+9kJGHo05jXUJFMmjZLiAO3xp9HZLiB/IYhn6Z2vxrUI589eE+CUosG
         kMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=ygw1GmqiUmm3fKwoqejDUG9us1yUAenmWJI0EPJWdnI=;
        b=EU1KvB3iBwYS3vVHCgAM4rcEqXfDUONCROEW1Ca2u/OBk6Org4aBngIRIlyYHTVyv/
         yAHvJzU9EUOCdYHC6xhNSu2xuGspYZxjU8Ur6MXoeEzYMMfDpNpY/RbeDfkGeQtA4bcc
         3hey6To0NAICnHGsg2xEXkx5oW787mPUWvmggkxXzl0tymUUqXeFa0lYZPXmTbb0xf6G
         ZkByYTlpX7Z9hauCYAfuFasS1yNKNvCDqPfwuIH+ekUscWMhmlo6S/L6WbsJq2AyKTey
         pVyxvokMha5dITD2YCIJtkJMcVpgihQwSUUgey8QENCsyn2lMosCS0BbAkESjLWp9pqN
         1hVw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=nSl9WaMB;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.0.95 as permitted sender) smtp.mailfrom=arvid@softube.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00095.outbound.protection.outlook.com. [40.107.0.95])
        by gmr-mx.google.com with ESMTPS id v1si2639562wrw.5.2019.05.13.04.27.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 13 May 2019 04:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of arvid@softube.com designates 40.107.0.95 as permitted sender) client-ip=40.107.0.95;
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com (10.168.150.22) by
 HE1PR0201MB2202.eurprd02.prod.outlook.com (10.168.30.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.20; Mon, 13 May 2019 11:27:44 +0000
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96]) by HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96%8]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 11:27:44 +0000
From: =?utf-8?B?QXJ2aWQgUm9zw6lu?= <arvid@softube.com>
To: Jan Kiszka <jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: Building on Orange Pi part 2
Thread-Topic: Building on Orange Pi part 2
Thread-Index: AQHVBppHHinIiqNX3E6acQP8uXAbqaZnHbUAgAH0YQA=
Date: Mon, 13 May 2019 11:27:44 +0000
Message-ID: <B974A7C7-F59D-4FA9-81DD-D9AE642BB9D9@softube.com>
References: <B9572A15-BD81-4DAE-9052-931E11167750@softube.com>
 <d7477b1b-ae39-0a0c-36ef-c56df033720e@web.de>
In-Reply-To: <d7477b1b-ae39-0a0c-36ef-c56df033720e@web.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.80.110.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6759d7b5-ef24-4f7e-dc9a-08d6d79604f4
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:HE1PR0201MB2202;
x-ms-traffictypediagnostic: HE1PR0201MB2202:
x-microsoft-antispam-prvs: <HE1PR0201MB2202BAB8A268552092FB49E9A10F0@HE1PR0201MB2202.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(136003)(366004)(396003)(39830400003)(189003)(199004)(81166006)(66446008)(64756008)(66556008)(66476007)(316002)(85182001)(81156014)(66946007)(76116006)(73956011)(2501003)(68736007)(6512007)(110136005)(8676002)(33656002)(8936002)(66066001)(82746002)(256004)(71200400001)(71190400001)(83716004)(5660300002)(66574012)(229853002)(76176011)(6486002)(6436002)(476003)(2616005)(11346002)(99286004)(446003)(486006)(186003)(6506007)(53546011)(26005)(508600001)(2906002)(102836004)(25786009)(86362001)(53936002)(14454004)(3846002)(6246003)(6116002)(305945005)(36756003)(85202003)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0201MB2202;H:HE1PR0201MB2332.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: softube.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l3s1eodhIdPvSKnYYgSC8Kh2WaCcsiTAB3XpV/UPmItkHH2NbJWWju281JLxtNnbcbNv25PLqS2crsTsayVhreG5koL7k2E0lrRGg9rvwl6LgpJSkSRd+G1RSQ+41KDQBgYxw3wzJnnlDhNxX+NlMAAczy9apr+PYQ7QWmYmAfV0wdTZSsbND+Q735OMaM+DLh5vLx7sV7nGT2Ie93aHsOx8Daj3yOmH7Q/ApjuysKMqoOuIGhXuc1Iafb38LK3N4bCYY5IBJ7i0cBr/rZVe3Xm4vk6Q4PDfQkqcAcxaXG4ALebbDBcl+pLiljz06kiw+2T3QGAf+2/FxvA6hKO9rXj6CGTQJqhHqJ2ssNGYAjiuUl7lENPMrIsuYeAq9A5zBWjNXJyFRsGQAiVzFmjJbe4zZaikJzKGg2N0Wb6MBkM=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <D5D1195DB45531478CB9EBFCF96CE28F@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: softube.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6759d7b5-ef24-4f7e-dc9a-08d6d79604f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 11:27:44.6615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8974e373-3f62-4142-9b7f-1b77262c89ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2202
X-Original-Sender: arvid@softube.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com
 header.b=nSl9WaMB;       spf=pass (google.com: domain of arvid@softube.com
 designates 40.107.0.95 as permitted sender) smtp.mailfrom=arvid@softube.com
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

Sorry -- I missed the patch, but see it now. Thanks a lot! I'll try to test=
 it shortly.

I tried to build my own kernel with the exact same .config file as the one =
used in the jailhouse-images repo. Still it doesn't work, which is strange.=
 I wonder what parameters in the build process can actually affect this beh=
avior, as 128M is still quite a lot of RAM. I'll investigate a bit further.=
 I might look into modifying the cell configuration too, but the configurat=
ion file format is a bit difficult to understand for me at this point.

Cheers,
Arvid


On 2019-05-12, 09:36, "jailhouse-dev@googlegroups.com on behalf of Jan Kisz=
ka" <jailhouse-dev@googlegroups.com on behalf of jan.kiszka@web.de> wrote:
    On 09.05.19 21:06, Arvid Ros=C3=A9n wrote:
    > Hi again,
    >
    > I finally set up a computer to cross-compile both Jailhouse and a sto=
ck kernel for my 256Mb Orange PI board. For reference, the Armbian kernel t=
hat comes with the standard Orange Pi images, are all compiled with thumb2 =
encoding of the instructions, which isn't compatible with the assembly file=
s in the jailhouse repo.
   =20
    That build issue was already fixed in next branch, you were on CC for t=
he patch.
   =20
    >
    > I have tried both kernel versions 5.1 and 4.19, both with the same re=
sults. The kernel compiles fine, and a chose to copy the kernel config from=
 the jailhouse-image repo for the Orange Pi board. This yields a kernel wit=
h minimal features but no undefined references when compiling the jailhouse=
 sources. Jailhouse.ko loads fine too.
    >
    > However, before calling jailhouse enable, I need to reserve memory fo=
r the hypervisor. In the jailhouse-images repo, this is done by passing the=
 kernel arguments mem=3D128M and vmalloc=3D512M. If I do the same, my kerne=
l never makes it past "Loading Kernel image ..."
    > If I change the arguments to mem=3D192M, it works, but then everythin=
g hangs if I try to call "jailhouse enable"
    >
    > Can anyone recommend how to proceed here? Do I need to change anythin=
g else regarding the kernel or some u-boot thing for mem=3D128M to work? Or=
, could I go with mem=3D192M and modify the cell config somehow?
   =20
    Yeah, I suspect you will need the custom kernel we build in jailhouse-i=
mages due
    to the size constraints of the target. If you keep the Armbian kernel a=
nd
    instead decrease the memory reservation, you will also have to adjust t=
he cell
    configuration accordingly. And you will not be able to load a secondary=
 Linux
    cell, only bare-metal cells.
   =20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/B974A7C7-F59D-4FA9-81DD-D9AE642BB9D9%40softube.com.
For more options, visit https://groups.google.com/d/optout.
