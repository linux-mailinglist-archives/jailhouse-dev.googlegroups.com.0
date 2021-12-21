Return-Path: <jailhouse-dev+bncBC44VTVY2UERBAU2Q6HAMGQE76ARL4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E547BFEF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Dec 2021 13:48:02 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id q13-20020a19f20d000000b0041fcb65b6c7sf6195643lfh.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Dec 2021 04:48:02 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1640090882; cv=pass;
        d=google.com; s=arc-20160816;
        b=N563xtVbQVdzkGquh/6sxHq8XXRkajMGPRyxGHcsHFM76+6Qpc6mHm9XSYLsPM8H0G
         Di02gnbLw7y/yXcYnUexLu5M9Wl4WUsVhoIvAO6ZKUfXNNJeZI2HSuSH9A9w7Q8pvmja
         iy6brvDlV0Hk+ZT9cJBQF28wQL15pLwMqJg8KIFt/Z61du1bBEZU091QqR2TAIwet1b1
         FYJPrVxQdfoW/ORhKQ6vGHXLKQAjak5Z1mXUrxM4C8V9gRKfDd6bSW+0h/oAzEFBOkct
         b4YFT7pQlXMNqLs1T4N02kbuNtvzVvW+J6+EKF7s1HyYFCcqGo+cjZPhN5S2WVPH6IRb
         TV4A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=fWlsioCpo4KBl7ViUzFZCV+zrJmDrYTM9JOHNWyK7R8=;
        b=ovdryNo+UW0Dj6fQWmh5rmeJOlSPrU+W/K1VNitPvDJ1kHkSW94DYY7Ps9KT9v9U10
         kXb4siRYdEu/zFOneQshvM9UdEdj/DCfbP2AvHVLFZg7O+nhzmKN49nHORZgK4Mr1npr
         CxzJN5En0ISrIZ9ipdzB5w3G+gCUigamcI34cVJqgSbxJ+fUEvCKpzNNBBlMjELZLWXm
         /thE79k9kNGVRta6Ku1/bxfQrKlWif8r34CBQsiZi6zRJVLK0QpeaaqxZ1fPOMwx0zuR
         kxSsP6YA97ZReGlrH1uYYPUYyUJbwOYd59XXG4FJNulMzi+xk8pfMWoU+9Wg62wAzDR0
         7U6A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=qKW4U+ag;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.21.89 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:user-agent
         :content-id:content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fWlsioCpo4KBl7ViUzFZCV+zrJmDrYTM9JOHNWyK7R8=;
        b=seRORWmsR0A2zWhzN/9kEhSkYq8VgRvX2o9wlBUqoTXoiJLSKJDaRKbS1aBuzQqZ4j
         ri6wt1NXn/YzTI/TwZcBqb+eQtLIh0SukQtQgHrAjGCLGdyc30cIsXPT+dOFL3vLn+DU
         fBBdDDeaA6YDlx5OYQ/0+EmgfyHwpd4Da9SB98oMOVyfle9BQak2EYKhUFGZ0uzkCV+Z
         nxVoDp10zw7weDO2MEc5jnVjDKvEAkIEE52Dcp7SmTADxer3f8FJM+1lSDJOvuyEL8mx
         X4W5hwLN5zbNra2i15Ac6IW5hwaf6cit7myU3dPqFVDbC2OsfZtZDo7WHbZ6HTm0fZcr
         Xhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:user-agent:content-id:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fWlsioCpo4KBl7ViUzFZCV+zrJmDrYTM9JOHNWyK7R8=;
        b=JXmO5hNm1SoTSIP97fJeR6n1frSBLzvuXvXGdsRLSLGlFsSP46P6obg08DnJmK8Yux
         CdbnUrhMR8q5/9ucSZRBv0Ox2y9agnFNE6bK5JdBbej5Bhl8b1thkacSghOweJV1EFlN
         ias1G8bqkwQ3TWnB7VOJ9tmMGiywcTN8BwXYtl1gwnQxPKRt3fFWKKKXqKgZSvDLFBu6
         x6zA2BBJQvlkJYqC/M3ywtuwr0IEIRg0Xf/kI81vsKZ9fucEVtCHjWRyvzviPsgPLsP5
         lhjY8kvvVxNAumqhREKjm2J6RAMUm9faks3DN+M/ePHjMioRnizSa/MkOPUZBpim0SSJ
         dglg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531YCU3LHHEm9ZZrxXaik4W8JU4J5K9Ximj8QSePQJcs2yyACNHN
	mSL9cGKz82MA1QXHvcIPZyE=
X-Google-Smtp-Source: ABdhPJzAhQthfIzEo7WMfkUIKECUAitgdVZX7+aSQL39c2XqrcMChsntg2wK8OG4Dx3Q5cPLXd9cJw==
X-Received: by 2002:a19:ee01:: with SMTP id g1mr2961037lfb.50.1640090882264;
        Tue, 21 Dec 2021 04:48:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3389:: with SMTP id h9ls137105lfg.2.gmail; Tue, 21
 Dec 2021 04:48:01 -0800 (PST)
X-Received: by 2002:a05:6512:3f20:: with SMTP id y32mr2990333lfa.353.1640090881364;
        Tue, 21 Dec 2021 04:48:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1640090881; cv=pass;
        d=google.com; s=arc-20160816;
        b=wlhpZi6T5c/mVq9vuRH8BYi4GOTJZkG8SkN3QF15xARkBXHRLXuq4RkobJ9RBZcLT7
         rC6+76rfJBTgZadkKSw75NJ9s9nx3OdWZ7YnPYVTy8GoAT0FsDo4LJHQM+zX+7n+8cwN
         TQ/UNVdXd/P+XDz66oAMhkKKp783JXEYhTC9Tw8SFdxxgCrAxrjFxLbTt7X3IjwjgPsG
         uki2e/nKQZ789b+/3ibMfUGJ9D3cS31yBUSmkShXcpbG+anbybrunUYZWUbgfkvwFyxT
         PKgVgEeMX/z/YW0FxPxYXze6gGbzcnPGKxFMnxH3iwulWFQ4wxzE0fJ3eXOa6n0z1GQd
         bSyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:user-agent
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=fcDRdzNx7xMXOb3bQB+bnW5sRJEGKAwMgY44BT/EvDc=;
        b=mZQ6ii3ZxUQMbfdUgb9jzRZC2niJmUmnk52Ug3scZNlBdqGFqMY8g2TLyvIqEpSrl6
         5ir2Cn2pSNqtmwUbLYflYcxojSk2ENEG0zD2VGn5AcGct+dBp1e/bsFOQ6cEmuU6nKn4
         LSElX0GCqLSrD1wXIACsCyJCDCeBz9DBk/u3nZtiUG10d/JmxRG8Z6QHquUTk5lwyCV+
         LNIdzo0QQJ+omui+9y51ZAgi0Nk05hwG9cgU5RBq4yR1/vSlqWnSO4NttqPvpdhniXx8
         EoWIdqfAdKBhEFvWKIovdp1+QmUDVYTGTaWYLakHxh4TVSGgKQClea2EpCDxqqukttF8
         xQNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=qKW4U+ag;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.21.89 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com. [40.107.21.89])
        by gmr-mx.google.com with ESMTPS id l13si954899lfg.1.2021.12.21.04.48.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Dec 2021 04:48:01 -0800 (PST)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.21.89 as permitted sender) client-ip=40.107.21.89;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6rIfqhvJuC392Ju5Qlgk08m0rotRKiLuzi2N9p/Z8+o6GyolVl73opOV73V41kvk22bPidvKCTvk4Bk6B5Qyb/xmBaLA+vvhFJ0YGaBthj9bYEfOg+At2rBh6OwrhU4q0JfTUY6CFbAjL39mrlaSN2f0jr+UUUD3doipr4KWKRmzrqrtwae1v2jZWjLTU6eMh4FA45AJDIYUFlyIvO7q3EQVSPcbUiRFWGDWG0QVwL+q2SAaSx9PGSQ9tWGajMq/mVBzpl6H5bd02XdriE95yZ5K8CsiON7vQDnW4uHPn53tJQE3q5+cpJF8Mf5BpgwJwjQlrCz5M7qUy/SQXagYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcDRdzNx7xMXOb3bQB+bnW5sRJEGKAwMgY44BT/EvDc=;
 b=hPx07WFzo1X5oXyr7itDkwY+nTA8XkoH8/vnbr+poa33JyPpD3/YDwNBteo0Di3UXMCr7/qvmLPg/9kHWXP94+VF1Zx/HvnTVU20pfVEO40tBeJXeLYxSwZ1XAATiPiYr4SeY77Fb17l3pIqp6kujQbIYC8QQKYzN+ftSg2bAMqlDFLF7/tTljoNRAK3im0B68HjiEafEsqseZ99liEnzhUeDOh4qlOCDCtQHFo4+aql5VbbdASF3AIXAIVljolDjH49Rd0e0KJ3N6+XzxiL8dGHLasARGwIHnuSNID3Zly/bukJdwKFwSfbD9STtzDPkti0ZIfPUyH+UlM0CVmQWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4040.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14; Tue, 21 Dec
 2021 12:48:00 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 12:48:00 +0000
From: "Bezdeka, Florian" <florian.bezdeka@siemens.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"huangjiajun145041@gmail.com" <huangjiajun145041@gmail.com>
Subject: Re: FATAL: unsupported instruction (0x83 0x00 0x00 0x00) (0xf3 0x00
 0x00 0x00)
Thread-Topic: FATAL: unsupported instruction (0x83 0x00 0x00 0x00) (0xf3 0x00
 0x00 0x00)
Thread-Index: AQHX9mhQ8Gt16vfZR06c8GatMbXE16w85SaA
Date: Tue, 21 Dec 2021 12:47:59 +0000
Message-ID: <0fe03b7d03ac8d9e622243d65b18812773af88c7.camel@siemens.com>
References: <de30fff2-ed9d-4a83-8229-6cfd9a2ac99an@googlegroups.com>
In-Reply-To: <de30fff2-ed9d-4a83-8229-6cfd9a2ac99an@googlegroups.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97c899c3-3869-489c-b411-08d9c4801ebd
x-ms-traffictypediagnostic: AM9PR10MB4040:EE_
x-microsoft-antispam-prvs: <AM9PR10MB404082B751006FC35E523C83F67C9@AM9PR10MB4040.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xU9LEaLGusLnDe3H3SCOuuK6m0nOn0X203/kPd6jUks3C3tpz/6adde+E0YWjTOg/xv7Amv5AAP29KfUHxDT4NFuakuMHbVCNxXI/L/ZpMhb4xQ+PpD/wbmBb1DmTLqeMFaHBW9l/33DdNWlzsoG+kI889l6LbzfO0DHpVXwcS426AJnogTbWAC/Qgc70AV0yhuShg7FcdIWedtPR6tuDWK+70SCeaFM5kCQ91dyckj+bnx/RC06xhwxtfNLHtl54fpf6d9B5FZ7PIBwjQ96oqtgT3ky3cv7ouWA/DF8hVKVTYS92F7cx1Kmq8eEiW0KyacdnjOO9cAB5nUuaO6zdByHFffcgLcAlxsAxssnCeFhNFvZ3dPDmePoTorOmsxqN4LyNqcQCmqLz6QQjgACugY92Vqlvh5SZmC30FPI4K/YDnOKxe2YjCqKhUnMRsWTaxREZNMzlIzDC+y7tGu+0/yGrNsVBLn7E3MrzgntLj0S8/q1t9lTT2CfFMgUGNwmZeV01JzSUgFVrz6lnKKbAoQC83gIfr72YGczgNbbXubOQHdgxpjdC/fasOnJYj+t0Gxsa03v1XLwn7EPhKk5QsdMeZbMTCuRAQBUU6APYG//KGkqRR9eSiMe+0/1borBhO9ZFYLPBCF+rS8gl+yU1P1MIrsf3sFYqmRSdlZuGYv21FZvZsSpF/16rSmAaQbakTY/7aCMM1bHDtY5poTG1w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(6506007)(4001150100001)(4744005)(186003)(122000001)(8676002)(36756003)(5660300002)(91956017)(86362001)(110136005)(2906002)(6512007)(316002)(66946007)(66446008)(66476007)(76116006)(82960400001)(8936002)(508600001)(38100700002)(71200400001)(38070700005)(66556008)(2616005)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVptU25zdTRkclk5ZVF1MVQ2RWdhNGtCbWRMQjViN0JlSzBqbVRmbW4xcFJ0?=
 =?utf-8?B?dUZCcitQd0RVd0dlWTZOQTlyWUIvQzhkSFlneVBzZ0ppN2ZRRGZtTzRGdCtZ?=
 =?utf-8?B?SGt4WDBmcVVGYjUwQ1k4VzV6S3M5dGM4dWYveFcySWRUKzY1alViSEtUWGVJ?=
 =?utf-8?B?MnRoMFlpRmFOOEVwejZEVkRIczVHT29zeWxQR1RhWlh3OEJqbnd5b09WOFB0?=
 =?utf-8?B?SVVJZ0Fkb3VrSytZQWJzdjluOGQxcUZIeDRPYytxNmp5R0sweWxiL2ZWWGFB?=
 =?utf-8?B?MG9wWE1IL2lqNFEzdlNPaVVHUTR0b0x0R1JSeGN5S0xsVDJmNjZQUVZicGlq?=
 =?utf-8?B?a3A4b0RRL3V4UGFKTG00ekh4TDVLL2N2ODIzeVdjWkhudHFaeFBRWlpDcmw2?=
 =?utf-8?B?dnUzczE0M3lPRHlRcWlnTER2L3dCS1Rxd0dRdEVvZzkvMVJOR3VFdHMvdnpj?=
 =?utf-8?B?KytTTEFNcCt0SXVhZlpJVnRYQkhhV1hmWGFBVHVvbWNSQ2I5N3EzaGtEZkJj?=
 =?utf-8?B?bHZaWkdKaHVLbFNzTXRwZ0VGanBrVjRuelJnbDlYTGljSVEyZDdtVktpWVN3?=
 =?utf-8?B?VVVmRjR3QWNlTUNnVUdSWlR5RnhFeUpRU2JmZ1ZsaWxBTElwd0VSQUVBVU8v?=
 =?utf-8?B?WDlVUXdpT2R4V2thQ0dJSnJlZkVlMDRqSkxRd2huM0w5WSsyVHVySlVoeUZX?=
 =?utf-8?B?NGRHZDFBZHN3NWtOWitEY2h2a3VNa0Zab0tNckRjRXNqY1VUVUxSeDNtbjhN?=
 =?utf-8?B?N1JXQTVjUTJOM2tiYUUwaXVvME42YUdHVDFxb0hNZ1N2R3ZXMWJJdkxkNWpr?=
 =?utf-8?B?ZmR5REdKeTc3VndsTFlETXlKdnIvc3d0ajBYUElNVTBMOXVBSGM1M3FGZGZ6?=
 =?utf-8?B?S3FuYlhiUlJReWU3bXcwbVdvNGFib2U3Z2piVUtaMTZFNVgzRlFQUVF0QnpD?=
 =?utf-8?B?aXJFRUN4eGdMMmoxOXQ1M2ZqZHpIQnNkU1NqRm5CcWJ2QXVXa2NOVzVkQ2tE?=
 =?utf-8?B?d1hpTEF6WGd6VlJQUEkvQUpBdHRsWG80VjMvQ0tuT3BVWjFya2QvSk50VlhP?=
 =?utf-8?B?czRkbzRkL0xYOXlSMDNVYjNJb3k2b2xhRE5IKzhmeGxncU5FY21UU0xQamJl?=
 =?utf-8?B?bWxJOWVhUzVmNXNXMVFMdTN1K0poYnpwd2tJME5kMm04SFFJaFBkaktkUGNR?=
 =?utf-8?B?QzAvVWJRNlNkdVVQaDhRS3hEREx3TmwvUDRsMXRDZ3ZUQlR2L09XdGVCNC94?=
 =?utf-8?B?SGV3dTdFSTdqRFhMRUYrTy9oanRWNjEwa1c4YzhFMHliUFVTOUFtOUQwc2J5?=
 =?utf-8?B?cmlqZHJZWWdrYS85YllRYjBabUxJQXd3QVJTRy9PdHUvd25LZlBvOUQrOXBv?=
 =?utf-8?B?aXQ3aTNkaVNtVDJjZGg0Ry9vYWpZVFRjc0tkL1AxS1NWTC90aHJMdEswK2tw?=
 =?utf-8?B?eXEzbE5YRkxQWWNOaU94SHd6VC9rS2lidWl2cEVBa2h1c2pGeHkrSklTeGxG?=
 =?utf-8?B?M0lSSzJPcGl2QlI0b1l5YmhHTTdJajhuU21pdHg4WStLV2xYSGk4Z2xUUDlk?=
 =?utf-8?B?a2FUOWt6VXJLMHI3OTY4TmgrZThHOTNrYzYyb2xIVWJiL2VpUWkvbWQ3M0xI?=
 =?utf-8?B?alNSZVJLTU9QOE13dzh5Qlk2REw3NldQMjM0Qi9tNmdhdTJVbm50MktoS2E1?=
 =?utf-8?B?MU5aU3N1YmJnMnZnbUVvYmpBR1RYdGRxWklFcGR5ZjlQZC9zY1Z0c3dIU1o4?=
 =?utf-8?B?bDg3L2ZYTFVyT2J2V2N2bmJYRUFKdHlyRnVjZjhVZ1Y1QU5WUkJDQklDbVAw?=
 =?utf-8?B?ZWZ4TmtRTlgvczJOZTcrVUNsVVZQVGZtS2NjcTA2OWF2UGpyUlF3NEpCb3Js?=
 =?utf-8?B?WEY4dUM4bVBpYkl0N2JCbFBZaHZEQkhKaWZoaVZwWC9xVXNJTFdwMHYyLzdI?=
 =?utf-8?B?Y2F5d2djTHMxK1FPczY4b2hoelN0Z2dFbzU2UGtKZ1RCcFJTRGxHYVVkRUti?=
 =?utf-8?B?akZSNzRGK2NKVmZtbjRrYTI3cTd3TEdvY1g3RkhqTlhHaGR5TVVEeTIvVXFG?=
 =?utf-8?B?SFB6Q0dXcVlCZWU3eXJ1VXpLMXgwekp1STFScDk5UTJxaVJacDZud0doQUhv?=
 =?utf-8?B?YlRaQUZhUXhiMVV1ZDRYUVFBSGxSNUVtM2xZVkQ1WFNmbWpUOFBEQ0hwc0NJ?=
 =?utf-8?B?M05WZHRpUXRjb1UwaFlUSDY5QlNVcHJvSkR5SllZYko1TDNVOFMwTUdsckpj?=
 =?utf-8?B?RFhOYnkxOVVZc3phQjRkOFRCS1p3WTFuYnBIYk0xMVNPVjhYVG1wVWtPOFBX?=
 =?utf-8?B?RW1rL3FWTy9oeHc5c0tWQ0ZwUWZEWmFGcjFQYlJRT1gwSlFWdi9Yek9Gb2dZ?=
 =?utf-8?Q?52zLih2zAiPBMLts=3D?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <A930A735D82D4348A34B0EC027E05AB1@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c899c3-3869-489c-b411-08d9c4801ebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 12:47:59.9305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HW/PT3OHHCz+37Wq3T2rTfMblR0rdgaIgzNonXMqN/3bnX34v+CZsIco1CSawFXMUF6BYulVnNetxYYVBALX+R/2GhVEi9icTLXaN3PnS9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4040
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=qKW4U+ag;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 florian.bezdeka@siemens.com designates 40.107.21.89 as permitted sender)
 smtp.mailfrom=florian.bezdeka@siemens.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=siemens.com
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

On Tue, 2021-12-21 at 04:43 -0800, jiajun huang wrote:
> Hi everyone,
> When I tried to add two ivshmem PCI devices to the root cell, a
> "FATAL: unsupported instruction" bug occurred. This bug is caused by
> x86_mmio_parse. How can I fix this bug? Below is my root-cell
> configuration and log output from the port.

I assume the illegal instruction is caused by the kernel panic
implementation. There should be a kernel stack trace somewhere. The
root cause might be an invalid mmio configuration. The trace / dump
should provide some more details which hopefully helps to narrow that
down.

>=20
> thanks=EF=BC=8C
> =C2=A0Jiajun

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0fe03b7d03ac8d9e622243d65b18812773af88c7.camel%40siemens.com.
