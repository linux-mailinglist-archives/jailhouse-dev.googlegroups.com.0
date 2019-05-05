Return-Path: <jailhouse-dev+bncBD7KJ5F42UDRBG6FXXTAKGQEJQ4ELQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A4142C9
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 00:24:28 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id s16sf6790892edc.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 15:24:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557095068; cv=pass;
        d=google.com; s=arc-20160816;
        b=T4tq4KMQk7SJhPfPNu3ykK3LXrTK1CGOzqozmqL2vuHuQTzN9iKqWFkR7T8bQe7/MT
         LVPE3SG3ikdKqWO+XjidSM0UOy2/pWPrwwyW0g8q/L+fOgz/XYJpAks+MQDZhihO94Ze
         v54WOsv8zJVMCFQ2UzCFbXgPRuyYDuDik4P3u+kYaccmIMMp0TgjCAyHDwxNEECH1law
         nHMzsdvTud8aldBJ3Ji3KZVQjyM5Qzqtb1POXpnrZwl9CgzOVyhqiBF8/s6OtC8WTLdv
         vzkK5S6fhKhTt7wa+nNnvoCf8MJunYFQCYSHepS0Pqdu1j1btMi/7RLpMcfzgqGDBMqL
         Hjlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=ZLOfYN1anjlddgJmQ4HVtu7JexA5lvALm90DhoGsE7A=;
        b=0aZbQ6ZYCufzg3+ujck+EoEBwUCl1BWkl8sv6S7pusjVtgxcFaOx75ww5oAkVWWLab
         +SzlkUzspIDesonmM4uhrRCB0375eWl5cOmn7OUlWfcQDjRiCk6DP6ImTvMkwxyP8skV
         qtJEPOVUzIwtXnM5Vw+i97vcTLwBDKJoiRVcdm2FSqwfUN0vvIJziMNfQpnMiZ2Fj7BO
         lv4fq7WBCv8t5VNtBLg44o7EDMB8CPCFZRhpi97lCrkD19kFnEYCQLcaCkA30pmnnWN5
         K9gUKS8yW/TfKnWGIo+B4c5twOlkapFp1aO5o+2AXCVMQfK0ZTs15qOOMx5R0B0wDZel
         /4Rg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=L6kCzu0P;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.7.134 as permitted sender) smtp.mailfrom=arvid@softube.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:content-id
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZLOfYN1anjlddgJmQ4HVtu7JexA5lvALm90DhoGsE7A=;
        b=iNN5uBpbnJMs9MKvTdv3aEcOyrY2p1I1JiDuxJ8PO+7NiVAd0Ais8UFi6I7CtMIAIG
         NAlY55igPdUhFYj07ecrG7WmrZ3tibGnmi5sl+9tGQItUk+lfuVgrh8fPoxPKmrPtOqy
         YNHla8Q0Pls1+f1etez9xeQZnrqx8zIUC0AvsQZCttPlrlXly8+0OpuptdAsOY48f/Kq
         MYdhriR36WsTcEY+lwdgmariJwtA60M4gIfRihhedBHpGKXeI6BjZGeJ9k4K3vNTpQsI
         BBeHcH2fzsaPgouX9G23MzBedf6zay6TY5E7wFXgVoIi9T8l83uROHBMhIhk0HaGBzut
         bR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-id:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZLOfYN1anjlddgJmQ4HVtu7JexA5lvALm90DhoGsE7A=;
        b=no3o96wkX33qyXhT0K4UiaVJ44j62JykjM7d5A1VUK0geqNO5UCptB4AcX3h2oTKVw
         ZZZ6VgtSz4gqTeJXP/UtUQ6Mq6QBhM33hBaK9mnEmnYQnB8JCgHJNC6viBkoHHKFQuh5
         lJNX4zJtEGqrSpxJ4b3HvczKKes8XG9PTT3BiLM181x0sLfmxFRNfA+7J9rElTjp0hN9
         4syGyp20UfPWY/u8XXP87g07Gpf5DDAkQaY+baHs00nvBb5iNwua7XCGHWbrAv6KR9/A
         g6f30rW25zqXKFeXrM8ouRlDqNWXDzsPqBLqfONBACpK0DMBOoa0BTjhjJxvk09pSQ7r
         z2Eg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWP7BXeq8dyekDhyU/blzIpOX5LZwHXVq/WbchRMGo+jx7OeQaz
	44+7ID6ax52UcmYFYFPdChY=
X-Google-Smtp-Source: APXvYqzLsN0PvOjanyoPbbSBoeiE1DX6p1OTyUNj2TBGX3/Up5e83M6YnMiDDFE9djlIT1QeMTl8xw==
X-Received: by 2002:a50:9425:: with SMTP id p34mr22382914eda.270.1557095067955;
        Sun, 05 May 2019 15:24:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:91a7:: with SMTP id g36ls2891709eda.4.gmail; Sun, 05 May
 2019 15:24:27 -0700 (PDT)
X-Received: by 2002:aa7:c512:: with SMTP id o18mr22856800edq.82.1557095067001;
        Sun, 05 May 2019 15:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557095066; cv=none;
        d=google.com; s=arc-20160816;
        b=jRDYB+quzal4jPYW2NkSZ/vOOJP5rFMRJ1W3b5gK32rwxE3ht/h7aoi2ANk9/DVaZu
         wKTufG/RjkpkABGzzfq9sF6DMpdLuQOd77GswlS2GcJ0e8w50KGe17yjo7Omc5fsXbxe
         HJeLO9MGdl8xw/pnp17rFb4hBk93cc3p9LIqTT5ALgILn0jHD5NsAeXu6vuAdXqWPpt1
         WSNkZWsESR1Sf0PMryJ7pkYxRPcYU/20d5K/JbF69q42d6yyC8zR0RtLl04HWCqBGNgj
         LbP67jqrTOCiFjCKx78ET2vW+A3H9ri6rjqb77hnzji2zq0rB6Q3BvETXpYsrgqJnhcK
         UsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=71EBIhU5W3ZUrX4mYdCHISXoSUe0zm3T7+vi6p/HTlc=;
        b=PgAtFimR/wkhf9kU7YoB0ysT/n++kVn/xRoa5hyJ7a7oZOEswUEhjLG+eFoxlfFxAC
         sW7Y2ZHpmQH6rYGtuOaFIxph8Sn/i156Urw478Xpq+pV8yK17oI1tq/VYQMGCfRy1YmF
         apfZ6+7L1umupf+uWmA7aATQANUkotNgK6TjJUsjEDjtQawd8C/p1p072jqzgxSm5bjd
         5Y97xcrHt+LYCXhkAm5M/UXceY+QIRocreAtURqYvqkj3SadBhtmBh13k5+UFOk5XvCL
         N8yYQ/abFneLT+K/MjKTS+r8H+uysW7utPPosOqCB0vXxI3fw7v03b4f2gBrRXMXXRCn
         AjLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=L6kCzu0P;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.7.134 as permitted sender) smtp.mailfrom=arvid@softube.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70134.outbound.protection.outlook.com. [40.107.7.134])
        by gmr-mx.google.com with ESMTPS id w5si469339edw.1.2019.05.05.15.24.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 05 May 2019 15:24:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of arvid@softube.com designates 40.107.7.134 as permitted sender) client-ip=40.107.7.134;
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com (10.168.150.22) by
 HE1PR0201MB2362.eurprd02.prod.outlook.com (10.168.150.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Sun, 5 May 2019 22:24:24 +0000
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96]) by HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96%8]) with mapi id 15.20.1856.012; Sun, 5 May 2019
 22:24:24 +0000
From: =?utf-8?B?QXJ2aWQgUm9zw6lu?= <arvid@softube.com>
To: Jan Kiszka <jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: Building on Orange Pi
Thread-Topic: Building on Orange Pi
Thread-Index: AQHU/33X36/w3ziF40Wwhk63RnMw+6ZVFyAAgAAo64CAAV4CgIAA+z0AgAABtoCAAEuREIAESeiAgAEUp4A=
Date: Sun, 5 May 2019 22:24:24 +0000
Message-ID: <1B499BC3-8628-4DB7-A37C-B68F02B2592B@softube.com>
References: <F1D21E89-5762-4890-A51F-5BFC0F0B4E0A@softube.com>
 <75218ca9-fd8f-6afd-8972-0852c8121060@siemens.com>
 <225DD87D-67CA-4969-A334-B1B27FB05B9E@softube.com>
 <36943512-5495-d84b-888f-e3752adb4a4e@web.de>
 <6CB50872-A7FF-4688-BB7D-123AF52DD87B@softube.com>
 <454361b4-b5fd-de0b-5d5f-d4c51f4b786b@web.de>
 <HE1PR0201MB23325FA2853B5CF1B9DB9963A1340@HE1PR0201MB2332.eurprd02.prod.outlook.com>
 <e65bfedc-880a-b2d0-d21c-506e5eea7008@web.de>
In-Reply-To: <e65bfedc-880a-b2d0-d21c-506e5eea7008@web.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [81.230.58.122]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53e930d6-0bde-4e0a-65c0-08d6d1a86db0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:HE1PR0201MB2362;
x-ms-traffictypediagnostic: HE1PR0201MB2362:
x-microsoft-antispam-prvs: <HE1PR0201MB23626981BE8733DCFB49F743A1370@HE1PR0201MB2362.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00286C0CA6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39830400003)(136003)(376002)(346002)(366004)(189003)(199004)(6512007)(68736007)(66066001)(7736002)(81166006)(81156014)(8676002)(2906002)(102836004)(6436002)(3846002)(71190400001)(71200400001)(486006)(14454004)(110136005)(86362001)(83716004)(446003)(76176011)(6116002)(508600001)(25786009)(476003)(11346002)(6506007)(186003)(53546011)(26005)(2616005)(6246003)(316002)(36756003)(229853002)(6486002)(8936002)(99286004)(14444005)(256004)(3480700005)(53936002)(66446008)(64756008)(66556008)(66946007)(73956011)(76116006)(2501003)(85202003)(66476007)(82746002)(5660300002)(305945005)(85182001)(33656002)(66574012);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0201MB2362;H:HE1PR0201MB2332.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: softube.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XyyfKqFW82f4Etlw8FwPkzDliOOmdnkcO7M4FOxsSC16Id65TicIuWR1WvAzm5TrvWDnOewPBjVqlRDrCuTFFjkcBjWatidqdbt3rT+LhRv78OJj+fQ0kyZidXFKrVZo+AnwCl6xcxrWBeydsMVDl/shwlnJWCPqaiSPHNO5UGEkdyjh54A1b3Vi+SvfFA2nzXLyanX+x1m3KFGNE7x8ecRRSuNbDJSTgGgpfNUkl2stRuOhH+2+HHdqAvTwbG+m+0voxRIRvH11mHnoiXXKMgAdjiRFPUjXAO4rYBl9BpWbdCI3OtE00ruHC/aRN0nxpjHE8cp3TbMO9N4LWRlTfUhHaXOKNPzmjtAZ7xQMPuCHTOru9QOCCYIxz9btw7iqE6J7waXj+JDvcyA6UcPFDRoErkkyDhlF/VT3Bmm1h9M=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <7065D00DC8705B469CA884F163429905@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: softube.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e930d6-0bde-4e0a-65c0-08d6d1a86db0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2019 22:24:24.2630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8974e373-3f62-4142-9b7f-1b77262c89ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2362
X-Original-Sender: arvid@softube.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com
 header.b=L6kCzu0P;       spf=pass (google.com: domain of arvid@softube.com
 designates 40.107.7.134 as permitted sender) smtp.mailfrom=arvid@softube.com
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

Hi, again.
Se below.

> =EF=BB=BFOn 2019-05-05, 09:54, "Jan Kiszka" <jan.kiszka@web.de> wrote:
>
>   On 02.05.19 16:28, Arvid Ros=C3=A9n wrote:
>    > Hi again,
>    >
>    > Thanks. I=E2=80=99ll try the same thing with the stock kernel source=
 to see if it=E2=80=99s a
>    > toolchain or source problem. This kernel came with the orange pi Deb=
ian image. I
>    > guess it=E2=80=99s patched for that Allwinner chip or something.
>    >
>    > Does the jailhouse build derive compiler flags etc. from the kernel =
headers
>    > somehow? That could explain the problem too maybe. I=E2=80=99ll repo=
rt back.
>   =20
>    For the hypervisor and the inmates, we should not use the kernel's fla=
gs. We
>    rather try to overload them with our own needs. But that may fail if w=
e are unlucky.
>   =20
>    Compare "make V=3D1" builds to find out differences. If you post your =
logs, we may
>    help with understanding the switching, and hopefully what went wrong.
=20
Some, more information about this issue. After some more testing I can now =
confirm that the kernel config flag "CONFIG_THUMB2_KERNEL" is causing the a=
ssembly problem I saw, which was roughly what I expected early on.
So, the stock OrangePi Armbian kernel seems to be compiled using the THUMB2=
 instruction set, but the jailhouse assembly files are not THUMB2 compatibl=
e, and then some instructions are missing.
I have no idea how this is usually handled, or if this is the only place th=
e build will fail if we use thumb2.=20
I'm rebuilding the kernel now with the .config taken from the jailhouse-ima=
ges repo instead. Let's see how that goes!

Cheers,
Arvid

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
