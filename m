Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBUG7WH5QKGQEUR44IZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CEA276E2B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Sep 2020 12:07:13 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id 20sf795063lfg.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Sep 2020 03:07:13 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600942033; cv=pass;
        d=google.com; s=arc-20160816;
        b=DaDw867iJiZtri4y50JQTHJNyomBRHHAx3TkpcjQB8hTV1t+XafY/tXZHfbIcs2CPd
         DuuW5mDp/nR1QoGTGIOFaTXKmSrdY08qcPeQJu70l5UpiJMsRJFZfxsyE417R4A7torV
         kuUnijeqLme13QUut7IziKflM8IH9HM32qoHDpwNufxfV2HFNrzZaK7hT7AX2VpyB9xn
         bKXz1mJf19h/YaHGtauNfRHRhCthefxWic30JOwtQjFvZA6QTtQiSGbcQYUArsbz5vD3
         FTD8GhiyPHYP6fUxxiD44S0d7kEOY32AhWRLgaOirxBqkAR0sPIMn5zLFmg07KtZ2RBY
         lU2w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=Lih0v5FJZaRPQm+NjnD1X72edoOF2jf2amrTTuz5LDo=;
        b=p2ZLLaEmh++tfm+ylNusVJFZxc79/Kwfn8QYmSLxFPROzWi5nGrTvmBwCXk/GSa9Sj
         2zKUsL/lksZV/bo4qbjyEVpmtOPBrpPr3C7SzFdPHbT+0lgcnB2gnm9eBMWwgxPB0Aof
         ejTx5qm1LKi+oCj3lRg5Ox4FUfm7RYdICIGZbuCwAtwHb81wkVACWuMbqSRAQY/SISPV
         b/4gAjzlsNXyGuGPdTGWsFaoWYrfBVclS048vsrj1j1sCIItz1xtMWWSterZVihYpClu
         xBcXnSqIfJ1i5IOmevdKc5I1s0b2TaqsmH9Xv+dUBUxiVb/pfa4HWiUfMkqkeN7Thf/3
         l2Rw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=YTLnyBWT;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Lih0v5FJZaRPQm+NjnD1X72edoOF2jf2amrTTuz5LDo=;
        b=TUK2HFZse/DepunFrLzarFrZKhensM22uOvu4MB0j0XB/I3q2S8gbS8G1Vd5yISCp1
         K6OrrJSqaTFLVnjMs74RYpNOTQvr0BISTd+uNolBhD/9bzUSKPVoRlYusLHJU2N4Dfnj
         HOCFufRAUKUDOgp6rgH0MaPMwR4jPeeqx7kTgDNJ4GXSHrnuGi03Kq1Pa/UbdtpQM46I
         ctiDq7qQ23xiU0rlQWsar/vG49rHGDsPWrFvAXEaotRPlQHuT2HBhOjV+wZnGYLuloKR
         aKW4nSUI3xwUvIp1Lx+SIMe42LvI58RCA15Pteu8ZjJAmbUt1ktUGy2IBGeuoac9cXiY
         p5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Lih0v5FJZaRPQm+NjnD1X72edoOF2jf2amrTTuz5LDo=;
        b=iShnMnJ91cRKxRcY3JzqeY0XZug5PxGK+cwYzk8H7ax92RBa5fMge+rt422U3O0E7K
         VCem9XrBqfYMKMU62Oq6Z9VJ+++FwNJbEwtfHwnAlNPtNt6INsJFiTWd9Cx7bNvUZUQV
         DOYKO2d/8VYi1joWK8ElZyv29TvaYVdqZRsg4UDbGQ/0xd9QIVkTgSN6z3PxFvZPWesE
         hpN3KBl2ABbL885rT446FXMZ31yMaEUn3wrNtodeb7B+cgPaqcIaifrhCMQqgUriNpQ4
         wJjE4P83Z+3BbsFfsaKlv5YbsEghHOeXWPWWEYCFQwU7cLshnCWxpq3dKWni3FIFN0qP
         9RBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533NoqjQdYGZGi1esN4OmqtsCifrgP2cIXz7Nbkz/01Hwezbta2x
	2cjUzUf7Hj9yFlGPNr51+Zo=
X-Google-Smtp-Source: ABdhPJydnd3W3QLrRxc+Xpb5MtTQOAKSd3MEYstASS6S7BZM1XyT6DZSbBSFF1jg5/2hq80xy9Fqhw==
X-Received: by 2002:a2e:8541:: with SMTP id u1mr70292ljj.101.1600942032858;
        Thu, 24 Sep 2020 03:07:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c44:: with SMTP id s4ls465526lfp.3.gmail; Thu, 24 Sep
 2020 03:07:11 -0700 (PDT)
X-Received: by 2002:a05:6512:302:: with SMTP id t2mr32136lfp.432.1600942031667;
        Thu, 24 Sep 2020 03:07:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600942031; cv=pass;
        d=google.com; s=arc-20160816;
        b=XqbQ4J6dwYEpvBdtZAZ0A5e9aG6kGsM5y0wP51cBemv+gASq2efjyBMuK3OEJe3f5G
         dfzy06DBbB0JdMchDoWP97AblSh9Wgg3FtM3Y0bvx4XCO4CyysLIaIwic23vZkB1boeN
         O5JnOsa3XBNCtb2u1aXLuxdSI3Xm44sg+4BnTyQns6cHJH3ydjrRyHXufX0Dif6vhul1
         p5hJlBrOB+P/Pc07EgKro2nqmSLA9SBMCvtxhJjgfoI9mtcqRDuAGF9pG7+ptoy1mwpL
         KyXwkVS8idQjLNNIwaS543IJ0juzvQ+DkWHaNWYDwNGUFm4tpvyzIcKHMNNU7ndqWeWF
         924A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=A/dlWmDyUVxGIpcZB7u0s3IofT5GC4+/uM+A2Fm6rzk=;
        b=TAJ1TqtpyXxfnpQsNXsRgpSAH3VQlzSbgKJGs/G0JP69OqXvSfwuQiM9Si5QpR8xUI
         NuhqKwOnPGS4WQq2xBl0uUTn9i6uMiYFPMj2P9m2ktDT3WeKJ3J+CqwJXn1q6eu3FAEF
         W3/Lk+JNq3eNxj1IlEvOYZ9gGWqZuS6iJa3O7EZ3eIQATp8wB6rrDA0zRN461LVjmP0J
         D+Q7w4kW2ri1N/cLK3DmxVCbpo/2YSEvZQxkThFrKBaAj/lvE1Kxyo9ujfualn8UnboG
         9JrPChbJa5ZqI5/B4swTlLJxUcR7VKCSMh34vDuP9Eg9IhqqoQm8zTBnnWobHhizJegg
         7kVw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=YTLnyBWT;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2081.outbound.protection.outlook.com. [40.107.22.81])
        by gmr-mx.google.com with ESMTPS id 143si32315lff.10.2020.09.24.03.07.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Sep 2020 03:07:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.81 as permitted sender) client-ip=40.107.22.81;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H128sFHn1UqJQqFfgGKyYIL1BTcH1DCQaRsgdMfErMIQjaEJH05nRtlM5tkLvIN4iHFfDdvBCswIAuxtF/HC6h+xnhKYCPCgV2fRL7KoxoGnH6QD+lSH89mJpzkNGeOboZgg434CPMu16QTnV4WSVR28CRtcf+0G4Pn+tQxeuGzK7J8009bOxxkB5iXWesfv6pNllDotw7saX92ceZ1cFBoMaN59Ly/n/nXx3E9glhj2rqhKAh+g1MI8J4q0XQItaTreG1yFwQWJf8pGj9/d3BeBSVOP9BYlMNPdsgbClpX5HZLUUjwU59zAsiW88/uJieILKZT35FxI+ZOG9HChtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/dlWmDyUVxGIpcZB7u0s3IofT5GC4+/uM+A2Fm6rzk=;
 b=DtukOhR08lCVMJ1AfCVsqrhC5TW5vHfLJcGQub6on5Gw569cg/iYH3lcjOOk2MOfw46VElOjypLYUDppfThZDSaeUIXy6Kd3VJ6CxX6G7P773vgDIhDznUBv2IUSwAeKV+WAL4jnG/39FfezchA/PLDwHK3LsZ9tjKX38J8HiuVFYfYHroRfdGr0YbYBYalo7XvkQ4GsmdmiFIVonCmRnu5UIAoOEaArKZiNubCrZ2SlaBDpNgE/Mn2CbuDWJbhP4GUgqztKw7iCFDFgZvenJPxUKd6s7h5O6qvr0OacxHZuuROZbMsqwcEu02/FwYqT/FPyNU5h+GZKft7ufqTPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4091.eurprd04.prod.outlook.com (2603:10a6:5:1e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Thu, 24 Sep
 2020 10:07:10 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.022; Thu, 24 Sep
 2020 10:07:10 +0000
From: Peng Fan <peng.fan@nxp.com>
To: =?utf-8?B?U3TDqXBoYW5lIEFuY2Vsb3Q=?= <sancelot@numalliance.com>,
	linux-rt-users <linux-rt-users@vger.kernel.org>, Jailhouse
	<jailhouse-dev@googlegroups.com>
Subject: RE: running it in an hypervisor
Thread-Topic: running it in an hypervisor
Thread-Index: AQHWklolRNXOvO/1PUGbAGg5M+1orKl3j+Mw
Date: Thu, 24 Sep 2020 10:07:10 +0000
Message-ID: <DB6PR0402MB27604D6E2BF8080D40BCA6A788390@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <bed0a3c7-6b1e-117b-0dd6-f91230161bd3@numalliance.com>
In-Reply-To: <bed0a3c7-6b1e-117b-0dd6-f91230161bd3@numalliance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4a44d4d4-f31a-4da0-10e8-08d860719a14
x-ms-traffictypediagnostic: DB7PR04MB4091:
x-microsoft-antispam-prvs: <DB7PR04MB40915C4909FB89D7DECCACF688390@DB7PR04MB4091.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GeLK9aQrNG8i1GVnfMDBKxwHtnUCva1tVdAusR+oSxnHA0VvvtdDcMpstWqOfwBBz3oYUDlF/2tcCMB+1Gb2eLNI74ILHroN8jmjfJ3FQKh5vedydnH//r+xX7+z30hbUNrWCFubhpf9Yt9E1xXHYfbVlZrmf4V0JqvkRoM0DiXUy6mF3+X+t/t32ZCEjUdRmdwIu8S2x59r2xVGKXpoIVj4FcSft/dpvvEarGu+z8bkxv/4ucLPC1pB2fqMx+aN/BXFaC6WjKWaYP/whiHksCqaFvT/fazBwDqRJeWz6HWW2NhNMQkS2Gqa1Bs5DcsxlNSxYbovueHCHWtLEFy93w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(110136005)(86362001)(9686003)(44832011)(5660300002)(316002)(52536014)(478600001)(66556008)(26005)(186003)(66446008)(71200400001)(6506007)(76116006)(33656002)(7696005)(64756008)(66476007)(8676002)(55016002)(2906002)(8936002)(4744005)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: wzz/hdWAwApwKKjg1jyINuvg/9GXcb2d0r/e3IxvxomGlGyDb3F9yvNQqVbgAMHyln8qPnPhFpRr6zs0en8gohFLWss+m6y/sp0P6vjBFElR1kn9z65NktIJqotMS0h7grRSUB/uKaUObkbfTierQvnJxSco8tIt4BpgxJ26NQ/3uULWcfevy5Zlf+qKjmykcsIThxSDLVJn3Ytou21dgN0pF8hWlyhd1piCTkBA5kyjc1/q1gyYinaAGwDRHT2m7jXt4mdGr99dIxyvFKIqAC3LVuu1KjY2koZ4z5fzcUzyTgEBZP6rxXzoHGC9dMlaaF3uuQ3TRVgG5MP/+ZE8jE54kfyPvAqMSSqvS49MCN88Bx+GqObDl87TqK270nevUurd9KoEys1Hw+A8XG5gsag2Ub20JMtoxpOxQdlD1tVQuMvwQp2JKb5jHRZDGCao/TwtNJqarzgTa//wnhrHyaGUwtxiDKSmwgjiM9dMCMQwX3+wo7HNFQbndMcEpv0PYKlRJBHdZ+arTnWoFAh3PgXPzX+TRrQIArfuwLuY3P3nX8tSc6i4u4JgftnekMErB89KZ5HJeAYwu+k7EjKu2AT7pzvxqSyA6dV8am/MqDnOcxr9y+GWGaMke3LvM9N5jzwu9eY4HQ+AnFoslalbZg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a44d4d4-f31a-4da0-10e8-08d860719a14
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 10:07:10.4632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NT7nqjCxyjCQBFTiEaMc2TBBSespRQPRoAng4iRUrwoQKrUJZhBn9zH9OoOqAgBNRUVESj87CEZS3MGyG9ykAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4091
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=YTLnyBWT;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

> Subject: running it in an hypervisor
>=20
> Hi,
>=20
> I would like to know which hypervisor are known to work with rt-preempt ?

Might give a try on jailhouse hypervisor. I ran ARM64 RT-Linux with jailhou=
se.

Regards,
Peng.

>=20
> In parallel I=C2=A0 would like to run hmi in a windows environment with 3=
D .
>=20
> Regards,
>=20
> S.Ancelot
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB6PR0402MB27604D6E2BF8080D40BCA6A788390%40DB6PR0402MB2760.eu=
rprd04.prod.outlook.com.
