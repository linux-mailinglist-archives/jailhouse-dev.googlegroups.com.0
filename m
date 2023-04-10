Return-Path: <jailhouse-dev+bncBCQYBNFYQ4NBBJFM2GQQMGQES7MBOZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id F026F6DCAC5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Apr 2023 20:32:05 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id s5-20020a05651c048500b002a76f86229fsf782890ljc.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Apr 2023 11:32:05 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1681151525; cv=pass;
        d=google.com; s=arc-20160816;
        b=O9RYn2xr4XaDmgr3JTHUtA8KeHkEbgYhdGdFie5MdWaO1W2SqXWLE8gwQ1X2FbsEPm
         jhkY7/zcUy5B8IgkuRZGTqVJjHKp3el+qHfFKuKND0OUR9z+C2XpQX15lqkaBMnEtRg5
         QUhZZ71JBGOBwXHwir5WZij6he75FPOLGDjZXfHRIGmpRMpFpY/KsnCiqLn06eiRiqjn
         +TNwYvkW3Ve9ftcNLH1bjnLehU+tU694k94VDnQOqAgSdYcHakyj/06eRrJU0YQYCw4g
         LgopIIkOWKl/EoSbAesictfjLiGH8+FwgS6dyxES6It8tPeE/AIPWL1SQh+HgkAU3tbF
         TPKQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:msip_labels
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:sender
         :dkim-signature;
        bh=CWMQW4OcUmGw8CE62y6aUAbNOsMjOwLPOgM1jeHt7oQ=;
        b=jznoKE2RsZERjQF5iur7ZXfbQuQnYfVNsfQEL7lJz/yB97lFhmei2Gyg+5b6zEJ271
         mt96rA6tI8orbOsTgf6T7NLKSEzcg1mkQxiQBlarAagdWvM5C/Ii6lODFzuQy1dgtkrS
         CgFNGQWKcHv3GqOUJhlTolwk2678EPQ6sVqNq9EKBer8mOr/10iQc6ACQJavDToWTQ6k
         oU2+vCA7RInFNMoWhkWaFWqK9dj8642rztqx+RR+9BWhHxKkBHD0kOt2I8FUSxFb7v36
         d4uKNtAE1o5HzoXVYq4VE5TyZ9I+4zyBnrcDLK62N8Tntdb3bm6wx3Kg/YItIGAYrGGQ
         o4MQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b=idDoIsJ+;
       arc=pass (i=1);
       spf=pass (google.com: domain of jefpatrick@hotmail.com designates 2a01:111:f400:7e1a::81f as permitted sender) smtp.mailfrom=jefpatrick@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1681151525;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWMQW4OcUmGw8CE62y6aUAbNOsMjOwLPOgM1jeHt7oQ=;
        b=CYlMDnVp4dy5rkkGYdCUmz7yl6vYMdILcqTKByQQgANqO4/iRzTyu5XSmmsl74Up3v
         gbI+almO4F1V0bnCUZLug3ivkgHJIAQHE/tiOA6Vcf0feqcRRqhJrtSK+1uZa+t9jUqH
         DBqNjVEFmzhpkTnLziBWgUCKCy2QT4Y882wjmqSB8J4JOyPC0FgQzVll9/ZwkxgD9ylu
         i7+PD2NdxOWOv1+WVPpXlZfjyuPGsr3+PGUkOQCCJBaQfHUJGc7Wq5E1eBtLwnCv1YpW
         kYwMXu65/0AQfvs93UZf/UbeujZWKt5/GumP6+lGY6VbEM9BJUvF5KyCfhjdbIHGg3mj
         ocig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681151525;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :msip_labels:content-language:accept-language:in-reply-to:references
         :message-id:date:thread-index:thread-topic:subject:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWMQW4OcUmGw8CE62y6aUAbNOsMjOwLPOgM1jeHt7oQ=;
        b=K3jRZvV5dusCMuS/HNNhoFGG29OvuCE8nfYS4bcfyEWpvAh4l5UQM2jiSIKbewIrxT
         Hi3/uW6CILKKX9b7iMACHs3okcPozvbzNxbCr5dC1ah3y/3x7rWcnNWXzL0Ql5/ctI3a
         T3Dx2M+pdpGGA16GMYsGO94jYh7KgoPFLbf3kpfM1y268U+NBf3uvPhzIL0DoKG9bV5k
         GSR6y/cra1oysvkZuK1Qp/jnFWsgmEb705UW331EjKVSQ7il9MVrpoe2SAFKkVMH0gTF
         eWYeFMmUqhKiEKMOAYqvym89haRLbqOOBEE/bQBrGrmzwFncyObWn4EE2tp//ybF8oam
         zh/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AAQBX9d02IVEn3b4ZfnFU+GQb4X14/TQ3YCP22UsIHU7w1T0NTBamMu2
	qVCrDga500hSk+V/ygJh8WU=
X-Google-Smtp-Source: AKy350YymEHwu7jnn9kGMdGUzENL+u7H1NLKWz9Xdsxwu8XoB00EiLMafFJnnfnpKxNcvTxdl+x+Vg==
X-Received: by 2002:a2e:3309:0:b0:2a7:85b3:582b with SMTP id d9-20020a2e3309000000b002a785b3582bmr147794ljc.6.1681151524973;
        Mon, 10 Apr 2023 11:32:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:be8e:0:b0:295:c3fc:8a56 with SMTP id a14-20020a2ebe8e000000b00295c3fc8a56ls39558ljr.1.-pod-delta-00-eu;
 Mon, 10 Apr 2023 11:32:02 -0700 (PDT)
X-Received: by 2002:a2e:a555:0:b0:2a7:66e0:cf1 with SMTP id e21-20020a2ea555000000b002a766e00cf1mr2725085ljn.0.1681151522626;
        Mon, 10 Apr 2023 11:32:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1681151522; cv=pass;
        d=google.com; s=arc-20160816;
        b=nENLo1C8aHSZWHqi6irC3Lzr8TfJ7omXE3ohZ+cjF8IR7ZgYi6awawk9zp4kqW50HK
         iVv9NQc7W4vdq3T/KG9UGrNf8EiKKu/4wJuLwe6ciMfwzc5JuegQunKIIknqywUtgcnr
         /XA5JTqAgW/ZSGoE3zK1osXA9xIzkvz1dxhYYBCpQwLocXyNjM6oLDFzvihfHOZ2bz+m
         5ija8ScFZkoMPV/PP1+rqjAO+xurgzPuRRkx9YWXP01pUel/PJPRbfN3zgzgP3xDCuME
         7Lxgi16M4U2CyaS/Cci+ymJwxqqIeGDGEWt6ksZYmH8Ymwvh7GvY0T0j+V8EptyKSgqP
         L/Ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:dkim-signature;
        bh=FSQ2ZW4hfGGWT4XT2KmjCTB0cM2PXC+Acxz38/1PXCA=;
        b=s9DonqI72aa46/zAuiF1WKcCTt6YBiVkbX0E0FFCbRG7zHcHwwvcvtuTS6ersO8RrT
         YsPnO2HT89uTVaI66JugUbBgah23RHUnQxNmrD8Zu0fPC3PLFpn8/xdrdQ9rVLbLpfbD
         dFCUkVZumzvN+M3NsCtbJy43/bQjQSbetu8LvCgnSAInpHNO84kjbH0hmDPz4j9uk9b3
         12kPRZw/KVOlVq7Fu9iKV66BQc+kxLy8RG9OHaqogVQFrnL7guvjAe0RCigqo3kvPulS
         LZYL/5pkUz1WvpkrfMjwXiJe5KG8qQssQzShdIQm1mqBqd6qPsPeFHV0NQ5unmyk+0yM
         fFEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b=idDoIsJ+;
       arc=pass (i=1);
       spf=pass (google.com: domain of jefpatrick@hotmail.com designates 2a01:111:f400:7e1a::81f as permitted sender) smtp.mailfrom=jefpatrick@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05olkn2081f.outbound.protection.outlook.com. [2a01:111:f400:7e1a::81f])
        by gmr-mx.google.com with ESMTPS id i3-20020a056512224300b004ec62de2d52si427625lfu.1.2023.04.10.11.32.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Apr 2023 11:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jefpatrick@hotmail.com designates 2a01:111:f400:7e1a::81f as permitted sender) client-ip=2a01:111:f400:7e1a::81f;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqKZANjWlK7CeeX3/mJuF0RFfPHqpEpZa2jSj4Kk2w9IOAUvjXJd8mvfS1qs8kCrUG87L3gVrRZPXYCR8Q/nQDXXTDj/oUL//ZhFbVrnYpN2gLAACS4Tc8SzWyPqQPCuH/sh5801oIwB6UWG0Ffrs9rhGZAUN/OB1hY3iCH56PwDHT1uqkMY6Fz0yxVaqaDQb9QbCdeL+W+RaDS3oRexQ90QmOWAoUOj8IOpD4m5OvnvskmDUtM4YUY7TidF5p9MCawveW9YFBO9I3dHzbPYMniB7XwghfAfzRHWckydlmK5UOzVYweDu9My1lJ0fQelLnW12+PKsHtu31X2AW7OdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSQ2ZW4hfGGWT4XT2KmjCTB0cM2PXC+Acxz38/1PXCA=;
 b=Bm0AHBYcS2AsYa2mkH/kNUqQa+pmQ1JqnLRe6TlCeFBl0siKDYFOINrxuiYoS40zAF+MJwzIMaFLAm9V5iIok/aBZ6zoXMVfETEKxYlFlrYHISJJoakCC+XbwHarrmO3xuGEwH2DB5DXuT0JL9LUJOqnD3RghSt+yLujmjkgSQPXfOv6rgAyVh0K51aV3RlWGIllW1Mc1rfNVKcq9J89sklEBy7U/6pjFGVXPfc+//fiL1Se7og0mFcCKcRUEaEd+oSvcMWblL5zSacu2rWx0kJlE83ULghPtxzZxxEyJQeJmJ5N1CHCYxcwf/dOduCTd4lkqngqoNnv7/ov4qN3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DU0PR10MB5875.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b9::5)
 by PAXPR10MB5182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:289::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.25; Mon, 10 Apr
 2023 18:31:59 +0000
Received: from DU0PR10MB5875.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3ced:7893:591a:82d3]) by DU0PR10MB5875.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3ced:7893:591a:82d3%5]) with mapi id 15.20.6298.025; Mon, 10 Apr 2023
 18:31:59 +0000
From: Jef Patrick <jefpatrick@hotmail.com>
To: "Jeffersons@bizzfund.sr" <Jeffersons@bizzfund.sr>
Subject: JKP presents "Missing U - Jeffersons"
Thread-Topic: JKP presents "Missing U - Jeffersons"
Thread-Index: AQHZaLFmXFNu1/YIYEO9NFuD1K4PPa8k4/US
Date: Mon, 10 Apr 2023 18:31:59 +0000
Message-ID: <DU0PR10MB587591304BA46142C7DEE7EAD0959@DU0PR10MB5875.EURPRD10.PROD.OUTLOOK.COM>
References: <XQubIZbIfugS1Jcba3rcfTBcCorZPEVGsbMR2WijzMM@bizzfund.sr>
In-Reply-To: <XQubIZbIfugS1Jcba3rcfTBcCorZPEVGsbMR2WijzMM@bizzfund.sr>
Accept-Language: nl-NL, en-US
Content-Language: nl-NL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [+pT1NJIuF6bcDRu8BX231djf8kUyWgIfdVH5ePbZDrabY8mK3zbzPGMZPrierVkb]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB5875:EE_|PAXPR10MB5182:EE_
x-ms-office365-filtering-correlation-id: 53b3c82d-0bb0-4a38-96af-08db39f1df09
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bcUva/WjAfhdrVwWDBBL9g/s59tv24CF52wSpzUKTQWlyIrV1FnlYQx+Dhuw/I9wOrlCYvA8gNlgMrwhCg1y60JLXfiZjVSckM/9KOjGoolJE5YINsMUHMxnxSiSc9KvtnFFBW9dYS90fGToJICVpuCaEhgciGaKKB7T1uldQOWlHNJ/4CSdlbtnL7y8+l9LUW21GcG8YnslB9BjTktFgV3QqeuKAglK/8e4FOQm1QZlT5ibgKfAGwfi1VieYLboAd3ASu+zP21XD0prS2q/zWSAD48YMO5ibnXV04VDLA9iWnlQ6+hnu+0i+ZHHRucxeJWPDGXj3KBpD6s8GUpHbnXMAV/wkEsZBE0Meuwhn+yvKNWS2L1T/ZrmCh35oTpZKqjj46cMcJUigQyuI69CsgX2KlH4wqop85AhdAYDSr1utuiM2V8gOY7rKyWW1BKDrssVU6o3fIJNneezA9X0tr1+hZnBSCBzwDeRDRPa6BRMfdH7RYB0KTZl9qW4AprfRS1S2hK95SjbwIn0OCQK0YT4e3RelRtwM0y1ONuO236mFElE8J/BpRiEAgLcEeoJA6w2WkLhkij4i9QHuclAM6iFWx7KLRfj0HaxiWu+Qhihmxz2idgHU1ewM4dzwCnqwkdN8GJGEP4J6nrJFPR73/lIbmIFkGkByqB52M80fCXJCZ9vqTCYQuNVHmGAgF6eyOyZqezg5HfDTs7mcrUMYw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sVQBkwTjxqZAI2CQeuBY/YzYwxKNGJMbGWtU9CLr3AaBGJm/DhxN/lgMzF?=
 =?iso-8859-1?Q?grqGasjg0Z2p1TfquTv11J/jF/Ijkss26ZGn/CLRM9qBMX6R2c4n84Uu5m?=
 =?iso-8859-1?Q?5pRBW+cV/uqGi6PpsTr8XuJshDbQ7lumKRoN/Tzhugq1tXIrM3p7EX8r3O?=
 =?iso-8859-1?Q?+8hN7GliHwmGysBTldIApUhFNlBMSthCjv7mrOlfq/cvEff3hflZaIuZve?=
 =?iso-8859-1?Q?9ypdN4akuAeJ+oztU06WxjTRWlv2meUo90pHA35wcAwbhQVnCnsrEmmgTh?=
 =?iso-8859-1?Q?mIjNDVtzblHjVAEoW5bRPdQR2Vt34T8DcIX7/ljK0XYDovfu8gnyaDOMIx?=
 =?iso-8859-1?Q?a8IeyTGQ9Q3ioxvxaA6ZXeAOOUQqldc5w4PtbSVSPw8JyhMPHZPHU9EE9l?=
 =?iso-8859-1?Q?zg0pd7cxbAeFKD/GjV66u48MreEP8hZBsf4kXvVMnI+OyIao35lFmzV/C+?=
 =?iso-8859-1?Q?EPeDMsbqDZztvLjXHJwRUE0puIBNgI95ojQtmTfUtRPwgsAyVL7AM6IV0B?=
 =?iso-8859-1?Q?Lcy+ndSzteKawhMfz2TkEffkwr2VLl2J4mhphlGUkkLY1SXzkVDKPYqMDx?=
 =?iso-8859-1?Q?KvFW704DyC4rj03ztMPG5t9XBKCNyleEJB+HbpmWYPFLkilARiNxiGDiqD?=
 =?iso-8859-1?Q?ysLbsHWrUmtYGijmA2U1/qAnSTP7XNqxXn2nSz6FG+7Nr0gAHREDbvDUri?=
 =?iso-8859-1?Q?C3kFmBCjOjNuoLrGwZxgN8oHNd4CTLd2VrNiNh5R3cfZFPS+uGogRLWF6E?=
 =?iso-8859-1?Q?qn40k2AzWeuImGEO0s/DDBfjIuK6nW0IcEysL3qMVC4LAUjzHNv1H7UFUV?=
 =?iso-8859-1?Q?GBWd+N7Oi8f/eC6wcizKYe7VS8mvZz6DhMU+yewmQdGVjL8wHoiQzPbHO8?=
 =?iso-8859-1?Q?r2tbJXyTB4OWXhj9faFG4tHhUW9NxKPNbNuL8ZKBLSR/+ipMWQmkRMjHC6?=
 =?iso-8859-1?Q?7uixXycZZ2KzPZ+f0ckC0n4ZXEgd8TP2dvvoG/U7xK+yhMprZLsWCmZAcv?=
 =?iso-8859-1?Q?3N03d3T6HUl693BKODi7Z1B5zXM08yQ7Z+9Drdza5pY9PkzD4/CheFK35R?=
 =?iso-8859-1?Q?iu8OAr1jKTQXBxVUU8+m7oGyAuH0q4L6+91CB5JqSXcTyC9XtPtyFUb6QS?=
 =?iso-8859-1?Q?ZSuYYSIC2Aui6xji3TdoyM1g7De1KuwdPC0QcTWMXvlMuDN/i8bi78/kf4?=
 =?iso-8859-1?Q?NdZmg1D04ubA482sE9rM/sMkBGnwiL5y0mYkeAAGI6j1WFCotTGCu9V15A?=
 =?iso-8859-1?Q?xCS8pSh4FTlgDb1uC5LhUFSk5mC1N13cQuoayZoDKzZXGU3W6OfYdoV6rL?=
 =?iso-8859-1?Q?0GNdXnSYUkWdCB9tP6O7OfEyBg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DU0PR10MB587591304BA46142C7DEE7EAD0959DU0PR10MB5875EURP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5875.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b3c82d-0bb0-4a38-96af-08db39f1df09
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 18:31:59.4437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5182
X-Original-Sender: jefpatrick@hotmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@hotmail.com header.s=selector1 header.b=idDoIsJ+;       arc=pass
 (i=1);       spf=pass (google.com: domain of jefpatrick@hotmail.com
 designates 2a01:111:f400:7e1a::81f as permitted sender) smtp.mailfrom=jefpatrick@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
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

--_000_DU0PR10MB587591304BA46142C7DEE7EAD0959DU0PR10MB5875EURP_
Content-Type: text/plain; charset="UTF-8"



Do not scrole on or delete this mail, but check it out on U'r platfom of will
[https://bizzfund.sr/wp-content/uploads/2023/03/YT-TopPica.jpg]
A brand new single released on iTunes and Spotify
[https://bizzfund.sr/wp-content/uploads/2023/03/Bandcamp-Header.jpg]
Listen to a, Swinging Dynamic Energetic Melodic Jeffersons, catchy lyrics.
[https://bizzfund.sr/wp-content/uploads/2023/03/iTunes.jpg]<http://itunes.apple.com/album/id/1678248658>
[https://bizzfund.sr/wp-content/uploads/2023/03/Spotify.png]<https://open.spotify.com/track/2mrZr0qwyHlpbSC7OjIxcS?si=41ce97fdfe18439c>
[https://bizzfund.sr/wp-content/uploads/2023/03/youtube.jpg]<https://www.youtube.com/watch?v=bzY6ASN6-pM>
[https://bizzfund.sr/wp-content/uploads/2023/03/Facebook.png]<https://www.facebook.com/Jeffersons411/>
[https://bizzfund.sr/wp-content/uploads/2023/03/Instagram.jpg]<https://www.instagram.com/jeffersons_411/>
[https://bizzfund.sr/wp-content/uploads/2023/03/Twitter.png]<https://twitter.com/Jeffersons411>
[https://bizzfund.sr/wp-content/uploads/2023/03/Missing-U-Cover-1320x1320.jpg]
Life on the road
Ready to promote this song worldwide

[https://bizzfund.sr/wp-content/uploads/2023/03/Jeffersons-Ibiza.jpg]
[https://bizzfund.sr/wp-content/uploads/2023/03/Jeffersons-Nemo.jpg]
[https://bizzfund.sr/wp-content/uploads/2023/03/Jeffersons-dope.jpg]
For bookings FB/@JKP Entertainment<https://www.facebook.com/jkpentertain/>
You are receiving this email because you work in the music or radio industry.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DU0PR10MB587591304BA46142C7DEE7EAD0959%40DU0PR10MB5875.EURPRD10.PROD.OUTLOOK.COM.

--_000_DU0PR10MB587591304BA46142C7DEE7EAD0959DU0PR10MB5875EURP_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
<br>
</div>
<div id=3D"divRplyFwdMsg" dir=3D"ltr">
<div>&nbsp;</div>
</div>
<div leftmargin=3D"0" topmargin=3D"0" marginwidth=3D"0" marginheight=3D"0" =
style=3D"margin: 0px; padding: 0px; background-color: rgb(39, 40, 46);">
<table class=3D"x_mailpoet_template" border=3D"0" width=3D"100%" cellpaddin=
g=3D"0" cellspacing=3D"0" style=3D"border-collapse:collapse; border-spacing=
:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_preheader" height=3D"1" style=3D"border-collapse: c=
ollapse; display: none; visibility: hidden; font-size: 1px; line-height: 1p=
x; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden; color: rg=
b(51, 51, 51);">
Do not scrole on or delete this mail, but check it out on U'r platfom of wi=
ll </td>
</tr>
<tr>
<td align=3D"center" class=3D"x_mailpoet-wrapper" valign=3D"top" style=3D"b=
order-collapse: collapse; background-color: rgb(39, 40, 46);">
<table class=3D"x_mailpoet_content-wrapper" border=3D"0" width=3D"660" cell=
padding=3D"0" cellspacing=3D"0" style=3D"border-collapse: collapse; border-=
spacing: 0px; max-width: 660px; width: 100%; background-color: rgb(255, 255=
, 255);">
<tbody>
<tr>
<td class=3D"x_mailpoet_content" align=3D"center" style=3D"border-collapse:=
 collapse; background-color: rgb(39, 40, 46);">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse; border-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse; padding-left:0; padding-right:0">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" clas=
s=3D"x_mailpoet_cols-one" style=3D"border-collapse:collapse; border-spacing=
:0; table-layout:fixed; margin-left:auto; margin-right:auto; padding-left:0=
; padding-right:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_image x_mailpoet_padded_vertical x_mailpoet_padded_=
side" align=3D"center" valign=3D"top" style=3D"border-collapse:collapse; pa=
dding-top:10px; padding-bottom:10px; padding-left:20px; padding-right:20px"=
>
<img width=3D"620" alt=3D"" style=3D"height:auto; max-width:100%; border:0;=
 display:block; outline:none; text-align:center" src=3D"https://bizzfund.sr=
/wp-content/uploads/2023/03/YT-TopPica.jpg">
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_text x_mailpoet_padded_vertical x_mailpoet_padded_s=
ide" valign=3D"top" style=3D"border-collapse:collapse; padding-top:10px; pa=
dding-bottom:10px; padding-left:20px; padding-right:20px; word-break:break-=
word; word-wrap:break-word">
<h2 style=3D"margin: 0px; font-family: &quot;merriweather sans&quot;, &quot=
;helvetica neue&quot;, helvetica, arial, sans-serif; font-size: 24px; line-=
height: 38.4px; text-align: left; padding: 0px; font-style: normal; font-we=
ight: normal; color: rgb(39, 40, 46);">
<span style=3D"color: rgb(153, 153, 153);">A brand new single released on <=
span style=3D"color: rgb(224, 62, 45);">
iTunes </span>and <span style=3D"color: rgb(29, 185, 84);">Spotify</span></=
span></h2>
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_spacer" height=3D"20" valign=3D"top" style=3D"borde=
r-collapse:collapse">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_content" align=3D"center" style=3D"border-collapse:=
collapse">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse; border-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse; padding-left:0; padding-right:0">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" clas=
s=3D"x_mailpoet_cols-one" style=3D"border-collapse:collapse; border-spacing=
:0; table-layout:fixed; margin-left:auto; margin-right:auto; padding-left:0=
; padding-right:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_image x_mailpoet_padded_vertical x_mailpoet_padded_=
side" align=3D"center" valign=3D"top" style=3D"border-collapse:collapse; pa=
dding-top:10px; padding-bottom:10px; padding-left:20px; padding-right:20px"=
>
<img width=3D"618" alt=3D"" style=3D"height:auto; max-width:100%; border:0;=
 display:block; outline:none; text-align:center" src=3D"https://bizzfund.sr=
/wp-content/uploads/2023/03/Bandcamp-Header.jpg">
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_text x_mailpoet_padded_vertical x_mailpoet_padded_s=
ide" valign=3D"top" style=3D"border-collapse:collapse; padding-top:10px; pa=
dding-bottom:10px; padding-left:20px; padding-right:20px; word-break:break-=
word; word-wrap:break-word">
<table width=3D"100%" cellpadding=3D"0" style=3D"border-collapse:collapse; =
border-spacing:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_paragraph" style=3D"border-collapse: collapse; font=
-family: &quot;merriweather sans&quot;, &quot;helvetica neue&quot;, helveti=
ca, arial, sans-serif; font-size: 15px; line-height: 24px; word-break: brea=
k-word; overflow-wrap: break-word; text-align: center; color: rgb(39, 40, 4=
6);">
<span style=3D"color: rgb(5, 10, 251);">Listen to a, Swinging Dynamic Energ=
etic Melodic Jeffersons, catchy lyrics.</span>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_content-cols-three" align=3D"left" style=3D"border-=
collapse:collapse">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse; border-spacing:0">
<tbody>
<tr>
<td align=3D"center" style=3D"border-collapse:collapse; font-size:0">
<div style=3D"display:inline-block; max-width:220px; vertical-align:top; wi=
dth:100%">
<table width=3D"220" class=3D"x_mailpoet_cols-three" border=3D"0" cellpaddi=
ng=3D"0" cellspacing=3D"0" align=3D"right" style=3D"border-collapse:collaps=
e; width:100%; max-width:220px; border-spacing:0; table-layout:fixed; margi=
n-left:auto; margin-right:auto; padding-left:0; padding-right:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_image x_mailpoet_padded_vertical x_mailpoet_padded_=
side" align=3D"center" valign=3D"top" style=3D"border-collapse:collapse; pa=
dding-top:10px; padding-bottom:10px; padding-left:20px; padding-right:20px"=
>
<a href=3D"http://itunes.apple.com/album/id/1678248658" data-auth=3D"NotApp=
licable" style=3D"text-decoration: underline; color: rgb(33, 117, 155);"><i=
mg width=3D"56" alt=3D"" style=3D"height:auto; max-width:100%; border:0; di=
splay:block; outline:none; text-align:center" src=3D"https://bizzfund.sr/wp=
-content/uploads/2023/03/iTunes.jpg"></a>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"display:inline-block; max-width:220px; vertical-align:top; wi=
dth:100%">
<table width=3D"220" class=3D"x_mailpoet_cols-three" border=3D"0" cellpaddi=
ng=3D"0" cellspacing=3D"0" align=3D"right" style=3D"border-collapse:collaps=
e; width:100%; max-width:220px; border-spacing:0; table-layout:fixed; margi=
n-left:auto; margin-right:auto; padding-left:0; padding-right:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_image x_mailpoet_padded_vertical x_mailpoet_padded_=
side" align=3D"center" valign=3D"top" style=3D"border-collapse:collapse; pa=
dding-top:10px; padding-bottom:10px; padding-left:20px; padding-right:20px"=
>
<a href=3D"https://open.spotify.com/track/2mrZr0qwyHlpbSC7OjIxcS?si=3D41ce9=
7fdfe18439c" data-auth=3D"NotApplicable" style=3D"text-decoration: underlin=
e; color: rgb(33, 117, 155);"><img width=3D"103" alt=3D"" style=3D"height:a=
uto; max-width:100%; border:0; display:block; outline:none; text-align:cent=
er" src=3D"https://bizzfund.sr/wp-content/uploads/2023/03/Spotify.png"></a>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"display:inline-block; max-width:220px; vertical-align:top; wi=
dth:100%">
<table width=3D"220" class=3D"x_mailpoet_cols-three" border=3D"0" cellpaddi=
ng=3D"0" cellspacing=3D"0" align=3D"right" style=3D"border-collapse:collaps=
e; width:100%; max-width:220px; border-spacing:0; table-layout:fixed; margi=
n-left:auto; margin-right:auto; padding-left:0; padding-right:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_image x_mailpoet_padded_vertical x_mailpoet_padded_=
side" align=3D"center" valign=3D"top" style=3D"border-collapse:collapse; pa=
dding-top:10px; padding-bottom:10px; padding-left:20px; padding-right:20px"=
>
<a href=3D"https://www.youtube.com/watch?v=3DbzY6ASN6-pM " data-auth=3D"Not=
Applicable" style=3D"text-decoration: underline; color: rgb(33, 117, 155);"=
><img width=3D"63" alt=3D"" style=3D"height:auto; max-width:100%; border:0;=
 display:block; outline:none; text-align:center" src=3D"https://bizzfund.sr=
/wp-content/uploads/2023/03/youtube.jpg"></a>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_content-cols-three" align=3D"left" style=3D"border-=
collapse:collapse">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse; border-spacing:0">
<tbody>
<tr>
<td align=3D"center" style=3D"border-collapse:collapse; font-size:0">
<div style=3D"display:inline-block; max-width:220px; vertical-align:top; wi=
dth:100%">
<table width=3D"220" class=3D"x_mailpoet_cols-three" border=3D"0" cellpaddi=
ng=3D"0" cellspacing=3D"0" align=3D"right" style=3D"border-collapse:collaps=
e; width:100%; max-width:220px; border-spacing:0; table-layout:fixed; margi=
n-left:auto; margin-right:auto; padding-left:0; padding-right:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_image x_mailpoet_padded_vertical x_mailpoet_padded_=
side" align=3D"center" valign=3D"top" style=3D"border-collapse:collapse; pa=
dding-top:10px; padding-bottom:10px; padding-left:20px; padding-right:20px"=
>
<a href=3D"https://www.facebook.com/Jeffersons411/" data-auth=3D"NotApplica=
ble" style=3D"text-decoration: underline; color: rgb(33, 117, 155);"><img w=
idth=3D"47" alt=3D"" style=3D"height:auto; max-width:100%; border:0; displa=
y:block; outline:none; text-align:center" src=3D"https://bizzfund.sr/wp-con=
tent/uploads/2023/03/Facebook.png"></a>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"display:inline-block; max-width:220px; vertical-align:top; wi=
dth:100%">
<table width=3D"220" class=3D"x_mailpoet_cols-three" border=3D"0" cellpaddi=
ng=3D"0" cellspacing=3D"0" align=3D"right" style=3D"border-collapse:collaps=
e; width:100%; max-width:220px; border-spacing:0; table-layout:fixed; margi=
n-left:auto; margin-right:auto; padding-left:0; padding-right:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_image x_mailpoet_padded_vertical x_mailpoet_padded_=
side" align=3D"center" valign=3D"top" style=3D"border-collapse:collapse; pa=
dding-top:10px; padding-bottom:10px; padding-left:20px; padding-right:20px"=
>
<a href=3D"https://www.instagram.com/jeffersons_411/  " data-auth=3D"NotApp=
licable" style=3D"text-decoration: underline; color: rgb(33, 117, 155);"><i=
mg width=3D"51" alt=3D"" style=3D"height:auto; max-width:100%; border:0; di=
splay:block; outline:none; text-align:center" src=3D"https://bizzfund.sr/wp=
-content/uploads/2023/03/Instagram.jpg"></a>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"display:inline-block; max-width:220px; vertical-align:top; wi=
dth:100%">
<table width=3D"220" class=3D"x_mailpoet_cols-three" border=3D"0" cellpaddi=
ng=3D"0" cellspacing=3D"0" align=3D"right" style=3D"border-collapse:collaps=
e; width:100%; max-width:220px; border-spacing:0; table-layout:fixed; margi=
n-left:auto; margin-right:auto; padding-left:0; padding-right:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_image x_mailpoet_padded_vertical x_mailpoet_padded_=
side" align=3D"center" valign=3D"top" style=3D"border-collapse:collapse; pa=
dding-top:10px; padding-bottom:10px; padding-left:20px; padding-right:20px"=
>
<a href=3D"https://twitter.com/Jeffersons411" data-auth=3D"NotApplicable" s=
tyle=3D"text-decoration: underline; color: rgb(33, 117, 155);"><img width=
=3D"52" alt=3D"" style=3D"height:auto; max-width:100%; border:0; display:bl=
ock; outline:none; text-align:center" src=3D"https://bizzfund.sr/wp-content=
/uploads/2023/03/Twitter.png"></a>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_content" align=3D"center" style=3D"border-collapse:=
collapse">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse; border-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse; padding-left:0; padding-right:0">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" clas=
s=3D"x_mailpoet_cols-one" style=3D"border-collapse:collapse; border-spacing=
:0; table-layout:fixed; margin-left:auto; margin-right:auto; padding-left:0=
; padding-right:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_image x_mailpoet_padded_vertical x_mailpoet_padded_=
side" align=3D"center" valign=3D"top" style=3D"border-collapse:collapse; pa=
dding-top:10px; padding-bottom:10px; padding-left:20px; padding-right:20px"=
>
<img width=3D"620" alt=3D"" style=3D"height:auto; max-width:100%; border:0;=
 display:block; outline:none; text-align:center" src=3D"https://bizzfund.sr=
/wp-content/uploads/2023/03/Missing-U-Cover-1320x1320.jpg">
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_text x_mailpoet_padded_vertical x_mailpoet_padded_s=
ide" valign=3D"top" style=3D"border-collapse:collapse; padding-top:10px; pa=
dding-bottom:10px; padding-left:20px; padding-right:20px; word-break:break-=
word; word-wrap:break-word">
<h3 style=3D"margin: 0px 0px 6.6px; font-family: &quot;merriweather sans&qu=
ot;, &quot;helvetica neue&quot;, helvetica, arial, sans-serif; font-size: 2=
2px; line-height: 35.2px; text-align: center; padding: 0px; font-style: nor=
mal; font-weight: normal; color: rgb(255, 255, 255);">
<span style=3D"color: rgb(39, 40, 46);"><strong>Life on the road</strong></=
span></h3>
<table width=3D"100%" cellpadding=3D"0" style=3D"border-collapse:collapse; =
border-spacing:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_paragraph" style=3D"border-collapse: collapse; font=
-family: &quot;merriweather sans&quot;, &quot;helvetica neue&quot;, helveti=
ca, arial, sans-serif; font-size: 15px; line-height: 24px; word-break: brea=
k-word; overflow-wrap: break-word; text-align: center; color: rgb(39, 40, 4=
6);">
<span style=3D"color: rgb(90, 92, 102);">Ready to promote this song worldwi=
de</span><br>
<br>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_image" align=3D"center" valign=3D"top" style=3D"bor=
der-collapse:collapse">
<img width=3D"348" alt=3D"" style=3D"height:auto; max-width:100%; border:0;=
 display:block; outline:none; text-align:center" src=3D"https://bizzfund.sr=
/wp-content/uploads/2023/03/Jeffersons-Ibiza.jpg">
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_image x_mailpoet_padded_vertical x_mailpoet_padded_=
side" align=3D"center" valign=3D"top" style=3D"border-collapse:collapse; pa=
dding-top:10px; padding-bottom:10px; padding-left:20px; padding-right:20px"=
>
<img width=3D"355" alt=3D"" style=3D"height:auto; max-width:100%; border:0;=
 display:block; outline:none; text-align:center" src=3D"https://bizzfund.sr=
/wp-content/uploads/2023/03/Jeffersons-Nemo.jpg">
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_image x_mailpoet_padded_vertical x_mailpoet_padded_=
side" align=3D"center" valign=3D"top" style=3D"border-collapse:collapse; pa=
dding-top:10px; padding-bottom:10px; padding-left:20px; padding-right:20px"=
>
<img width=3D"358" alt=3D"" style=3D"height:auto; max-width:100%; border:0;=
 display:block; outline:none; text-align:center" src=3D"https://bizzfund.sr=
/wp-content/uploads/2023/03/Jeffersons-dope.jpg">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_content" align=3D"center" style=3D"border-collapse:=
collapse">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse; border-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse; padding-left:0; padding-right:0">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" clas=
s=3D"x_mailpoet_cols-one" style=3D"border-collapse:collapse; border-spacing=
:0; table-layout:fixed; margin-left:auto; margin-right:auto; padding-left:0=
; padding-right:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_text x_mailpoet_padded_vertical x_mailpoet_padded_s=
ide" valign=3D"top" style=3D"border-collapse:collapse; padding-top:10px; pa=
dding-bottom:10px; padding-left:20px; padding-right:20px; word-break:break-=
word; word-wrap:break-word">
<table width=3D"100%" cellpadding=3D"0" style=3D"border-collapse:collapse; =
border-spacing:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_paragraph" style=3D"border-collapse: collapse; font=
-family: &quot;merriweather sans&quot;, &quot;helvetica neue&quot;, helveti=
ca, arial, sans-serif; font-size: 15px; line-height: 24px; word-break: brea=
k-word; overflow-wrap: break-word; text-align: center; color: rgb(39, 40, 4=
6);">
For bookings <a href=3D"https://www.facebook.com/jkpentertain/" data-auth=
=3D"NotApplicable" style=3D"text-decoration: underline; color: rgb(33, 117,=
 155);">
FB/@JKP Entertainment</a> </td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_content" align=3D"center" style=3D"border-collapse:=
 collapse; background-color: rgb(39, 40, 46);">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" styl=
e=3D"border-collapse:collapse; border-spacing:0">
<tbody>
<tr>
<td style=3D"border-collapse:collapse; padding-left:0; padding-right:0">
<table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" clas=
s=3D"x_mailpoet_cols-one" style=3D"border-collapse:collapse; border-spacing=
:0; table-layout:fixed; margin-left:auto; margin-right:auto; padding-left:0=
; padding-right:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_text x_mailpoet_padded_vertical x_mailpoet_padded_s=
ide" valign=3D"top" style=3D"border-collapse:collapse; padding-top:10px; pa=
dding-bottom:10px; padding-left:20px; padding-right:20px; word-break:break-=
word; word-wrap:break-word">
<table width=3D"100%" cellpadding=3D"0" style=3D"border-collapse:collapse; =
border-spacing:0">
<tbody>
<tr>
<td class=3D"x_mailpoet_paragraph" style=3D"border-collapse: collapse; font=
-family: &quot;merriweather sans&quot;, &quot;helvetica neue&quot;, helveti=
ca, arial, sans-serif; font-size: 15px; line-height: 24px; word-break: brea=
k-word; overflow-wrap: break-word; text-align: center; color: rgb(39, 40, 4=
6);">
<span style=3D"color: rgb(255, 255, 255);">You are receiving this email bec=
ause you work in the music or radio industry.</span>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td class=3D"x_mailpoet_spacer" height=3D"20" valign=3D"top" style=3D"borde=
r-collapse:collapse">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
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
om/d/msgid/jailhouse-dev/DU0PR10MB587591304BA46142C7DEE7EAD0959%40DU0PR10MB=
5875.EURPRD10.PROD.OUTLOOK.COM?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/DU0PR10MB587591304BA46142C7DEE7=
EAD0959%40DU0PR10MB5875.EURPRD10.PROD.OUTLOOK.COM</a>.<br />

--_000_DU0PR10MB587591304BA46142C7DEE7EAD0959DU0PR10MB5875EURP_--
