Return-Path: <jailhouse-dev+bncBAABBMHFXWAQMGQEK7S3NNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B8131F5AE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Feb 2021 09:11:29 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id b14sf2618558ljf.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Feb 2021 00:11:29 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1613722289; cv=pass;
        d=google.com; s=arc-20160816;
        b=PuxVIhTBXyW/qMEwj+7Om7VY+ngp/lZ61us9SqDwDobia8TBY2Z9smPqZWrgBFOzn5
         eiVwWIM9I1n604BTbKkGXxwj7sF4e64VTJ4DDBIZv85/g6wJEyL4PRDmmYV2VbVXsQNV
         g0T/ZY/a57cYkZXPr+lhjJuBf0E3rqU9W+Pb1IHbkfV10LTYlEc6Kw58wtcwjY8OS08N
         yc7yS8YyFVti/0jBrMsb8GO3t8ZHSaf48IlRCBejXBvyDiXI31AphVx5YHrg72aCLrFo
         IBU4k0baFJc+1Gzkhx+OdG8TCD8GtbCozraVwAnMTzOzACpw3adHBAy+748LzGcUCKHl
         8WMQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=N+6vBQdMhzAxuSCC111zzR4fcPdpYEBkQ8mHBIxohZc=;
        b=NXlXRytr/KOSBhPBE6jLGRTjtSxwJO4rvK7DT4tDCO/ffojjSik5kVGVE/tu0hmHin
         z5Ji05FyN6vhjYMibKWJyeT4k9sn3jiYC6CYKpOJWpwEnXCsjbFt3TvuabdVomUbjxHH
         asHC+RyvtYQV7R4UsBcv8agchFcBZbZ4Sua7K0oNK3tHi1HIz4MzxDQcXGR4L3Iq7kc2
         TskMGKp4kW/yIrrL/AqZHzsYrTwZzlxQfZZWlZL9156VU1fx3GeEwOV8SWcHNCHU5Yb3
         s6ZItwh4/7dHN+CQkdFrqO77O/i4nxL9JqJbHf1J+T9S5Z2/xLSFoIZLG8xiUlNF/3iq
         T/Vg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=R6pj9Li5;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.8.84 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N+6vBQdMhzAxuSCC111zzR4fcPdpYEBkQ8mHBIxohZc=;
        b=H7Xpjt5RoDXp2gzjMpZZfk7EvIrTtTtP1MeTVHQ0RmlLW7vRN/BT/ra72rG1gYxbKR
         SG/9/IBSUFA/VygIJSaM3aNokIYL4h7XNA+JqBaM7lfiyV5/1t9Dza3Spa/o4zBtR1ZI
         9OkveVzI1dCU52pLpXg6pq1vIBIizKz4v1UXOSMeHEAUOgAn30bHDr2Z231/9bvDa/YR
         ZL/QedHuwsVeEntgmdcHPe0LuFYZwoH5Vofccgoke1uuSq+2U6kHz7cLcs3D8ezql+mX
         KPXiuCGSEaD2yu5GhCcnKwMc2POHdNNHFd7K8KSCzFO8dMaX0jqqEwYQxg+BcGcw7pA8
         KYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N+6vBQdMhzAxuSCC111zzR4fcPdpYEBkQ8mHBIxohZc=;
        b=te9Mc2Ceu05pEJPv/QF0fqJq42uYIXKc0QVTdEJusaKoMTLvWUQKiXNI8gkPDImFvx
         6Sjf2zanMDfXjoCsN2rdPgG2QSymCCBi7iS+gp11AzUTDTwLLUa+5K47LZrIiHot9Cge
         jA7yE69MfEpzOxq1t6JsXT0gBiZwcQZJZ17ext5XGl5SumPdAxmIvCcE0zy5uQ7f1N67
         G7QE38xb3uLN+Ebr9XrlWkPdK5qVc5gvBLiN85MNmcebSqMZG3qbeg8a3WeM3TVAyG5v
         rIWMF/BRBmhy6PMAvhqKON0cHYNsMMEOZ4SAcVfclnrVRWNhEgBtW0v6Zm5yow+IORWS
         DZhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533pJnuYIj4eogGwQ2AWQYzxCR74eSaaFxG+dlRpGeOJgheXUPYX
	My3JHvDQyD9jB+ZhMIt+mD8=
X-Google-Smtp-Source: ABdhPJzkDau+My+dQZsMdZCRGOpkTz5WiopgPDmfavCwrk4JOY+4jh9thmh+m8BbK8qoeBq1E5anYw==
X-Received: by 2002:ac2:42d5:: with SMTP id n21mr5205232lfl.154.1613722289152;
        Fri, 19 Feb 2021 00:11:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3993:: with SMTP id j19ls1934570lfu.3.gmail; Fri,
 19 Feb 2021 00:11:28 -0800 (PST)
X-Received: by 2002:a19:7512:: with SMTP id y18mr5006240lfe.318.1613722288259;
        Fri, 19 Feb 2021 00:11:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1613722288; cv=pass;
        d=google.com; s=arc-20160816;
        b=P3Mnd6vhl/yUt6jb0vu5sm6PA27zsGrMkHwbhC98ydWFhuaNhF5u2+gooX91gGgqwk
         BKpyWsDW5aXA5vui9tZC5pWJ3TIlSGzMgaW6IgGsVlpTg4PrfCQSirkX6whwBrKNXBqd
         WhY3L5XKf8YO/VogFD4QvsGa+42+Kvc5DXLxH1XsTlX3sNHSsjdWS6ww1HB5yth1mvsT
         n5FAYNib9+A5XtHk+BVluRMJiQWslAs7doybcAcGxWvgfS613hAxdAqlWvrgcBtAnDat
         uZFP4dnTJsFJAKdfO5st5IhpwCUph5GBRTGtFs7MTXNKgk+HjgfRoWN4WU2VxNl6qXYq
         tDFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=RYj/dYzLPLygXisATF2Q+/j0xBkxyfAreObwL+1Y51Y=;
        b=KBvj+FDlF61IwzYwsCyHO0tM5/tDdlyQnjCr2D6IULpugpC9BSvOJbdRVAnDoqhogZ
         gWQI85j6oKkJ66dJGLZlUJhqtxc93vZnPrC4u8e4g8I2APiddJQ7txcvb66qInqWFqKj
         SnBjVkoslz+kSoaj4RsVve7j/XXEH+xFwtiOENkh2jPnLgJX799kBICekfmyDDC5KUBg
         c0+6TvkPySw7TsbHYQoqpyaKUzrh7h3d9sI2AABS6Dz2P4TFLXQVsjB9RRsgfwiWeVXo
         4kz0iw8vwEMd2HRCFJxOpuWvBYlt36vyBKU+MdrHRFLlNaton4b09D8FgQ2c8LctwcUT
         88hw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=R6pj9Li5;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.8.84 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80084.outbound.protection.outlook.com. [40.107.8.84])
        by gmr-mx.google.com with ESMTPS id y3si262175lfb.6.2021.02.19.00.11.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2021 00:11:28 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.8.84 as permitted sender) client-ip=40.107.8.84;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EG8rWmss8iZSza1hsVV6knpY4YLxlOPZbqlHs9IVJKSzI53IAvYa+Bk8AmARyNbKG6FquGr8r33roqxRV/l0NXUZpxBP5pbuTtcxcc/SClBmOeLJFEYVRLplfrJkbI0uoEZL7aodEuU2viJyBgpsR0Ebt/aF2toqM9B0SySXezP6tlOL1EnekaN9CygBrzDQSBT+EJckKXUxnxFHGlm4Ze2FR5lDmVkYlATr5Dp4PPtuX8A/Vo6piu4fB16As+KuWnSAaFrzRxkYoqR8XE47QEYCIvs1MWS6paxNmsrqj/VVBd0FTjxVGSqFaWs0Qr8QqK1huBzXj4qaVJEN4mutsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYj/dYzLPLygXisATF2Q+/j0xBkxyfAreObwL+1Y51Y=;
 b=NVrBKgGygTbrA70lUZe6lkqxEl1GAeXQa+FILFbCLPj65nFr7yRGB+HSEKf+atMXFEL0z40oJGNWnjgPGMNNFY3c3JKKOFcuyMGNukuH75A8XpXDHKOpJR/IoR4a3q6ugE4lZMmrmxnwmjbBMg37NuwsDPmmppVoOuGpu1D8ECUDx8y4bVIUBx9DpD+TD0p4CpjKu00XSOFhLtmgQaSUb3MlCoCWiUhz1njvA6SM/OmdSUdyAuVrKaXwXsBcOIJl4r4G/TUF9SA8oaQ5Hq8gzagtvTgfiV25plSlLPEh1riPcFn2a27byMcAYSF23wJDMls7PCF96QG1+OwoYXWSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR0401MB2255.eurprd04.prod.outlook.com (2603:10a6:800:29::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Fri, 19 Feb
 2021 08:11:26 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093%4]) with mapi id 15.20.3868.029; Fri, 19 Feb 2021
 08:11:26 +0000
From: Hongbo Wang <hongbo.wang@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, Mingkai Hu <mingkai.hu@nxp.com>, Xiaobo Xie
	<xiaobo.xie@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 2/3] configs: ls1043a-rdb: add DPAA support
 in linux inmate dts demo
Thread-Topic: [EXT] Re: [PATCH v2 2/3] configs: ls1043a-rdb: add DPAA support
 in linux inmate dts demo
Thread-Index: AQHW+5wn3hJfaaW9PEGrV2GiL2Drgqpdu2uAgAF3mPA=
Date: Fri, 19 Feb 2021 08:11:26 +0000
Message-ID: <VI1PR04MB567753F9CE8F7F06BF6542ADE1849@VI1PR04MB5677.eurprd04.prod.outlook.com>
References: <20210205085509.21595-1-hongbo.wang@nxp.com>
 <20210205085509.21595-3-hongbo.wang@nxp.com>
 <72aac64b-cd6e-82cd-4248-4bdbbdea4696@siemens.com>
In-Reply-To: <72aac64b-cd6e-82cd-4248-4bdbbdea4696@siemens.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 952a7192-bbbd-4a02-3a70-08d8d4adf41a
x-ms-traffictypediagnostic: VI1PR0401MB2255:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0401MB2255853D56967BFB9259C4C0E1849@VI1PR0401MB2255.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NhhPyXqnAKVYWyH2HW2vGmPCd0P110OyvmU/e3eHz7c6CkFHxi8SP0P0NMgW8F6Ejw8VDmiYtZvHall+EAxcPazPpBgrarS7fQNY6nfatx3XVSmzHXu6hTjT8R+UNRCeZyKoojqDZC540gau5QU2GEQClkN0bWKegVbCTTAzhQTwQ8tkUz3TxA643STU4GERbDqO2nx4j3alnUvEanIZD8gpCPGHYiN/k3t/27SsFH/ijrtPWDExGRTCvt7uq/pP31upS35zFUIYyyuLWVGXeE6PGMt7oFap0Edp9tb8cM4FshkXK7C12AYoCMCAO2huONtTaduxIqwX0XYPydx+BvAv+fZs/+ULOp+E4HrOLUJW3Yi2OBBxGsaj75OKYmt4/K7h562hailV25n4nKgX7WZFTyckD206835pXsycKLi53CJ4rXJujAf5/HHLbYqTAOXrE4ZodsrXjYO8RKxV9S8+k/RIf/qpxZ6CThEbG/ZshtuUzr85WAgBE0C927S0dv75Cv730Xkp9jp0jXGcGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(5660300002)(66946007)(7696005)(55016002)(478600001)(6636002)(4744005)(71200400001)(83380400001)(86362001)(9686003)(33656002)(76116006)(8676002)(316002)(8936002)(2906002)(66446008)(26005)(66476007)(66556008)(53546011)(52536014)(64756008)(44832011)(6506007)(186003)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?clFkY1B0NS9MMDlLVE9BWEkwU1hPeWluRGxjelJ5b1NmQjd0c2o2Z1AzczZh?=
 =?utf-8?B?c095VFRZUHg3NmV5cFZxaUxJemJ4cTVWMGptNmZoSDNVVWhCNmc4QVdRU3NQ?=
 =?utf-8?B?WE9kTVNseXRJOGI0SDc0VE1uZ1FMZDBQb1VwaHpRQmU3enNZeFlVK1loN1ZW?=
 =?utf-8?B?bFRkdU9YYUR5Ung5NkJ3Vm5wS09nMU52SVU3a0VLMzMwMmJJZ04rMVVscVAv?=
 =?utf-8?B?NHVJL0RFQnZuc1g5SW1oci9VVTZFK2l3NTYyUHRXYmZyS2xGMDJ6SGtjdkVo?=
 =?utf-8?B?U3Z4M0Nhd0lyTDMrNWJncFZTTGR4c3R2Y2ZCVUpGZlZ3QmJidHpPR2hDQU1n?=
 =?utf-8?B?dElPcmt4dE9aM2daYkd3K0c2aGxlY0p3MStOZ1RwbXdWSmU5T3ZvUjFZNWtp?=
 =?utf-8?B?YlVaRTN5WUM5b3lNUU5FMFZYOVZlZ0Uwd1JmZ3hUZjVmZDZzZXVoNk1pWkI1?=
 =?utf-8?B?UVkyQ0tGZWl3RWtRdXpCQmRIQWplM0tQWTR2VVpndytlMW95OWdrRU1CSXRK?=
 =?utf-8?B?THI1b01qcC83bitHTTRMQmZXNk96a0U4b3pUdC96bGtnbDVKQ2cxR3o4bEJr?=
 =?utf-8?B?K3FUSG9RYkdldVI0T0c2UlhBa25DS2JhY0IzS2dZMk5Qb1l5TjRmRHhYcVR6?=
 =?utf-8?B?d2lRZG84ZCs5OHJpVjBIYjQ5VVE1YW9sdUNJUHRuTS8wVlltZFF6SmdGMUxE?=
 =?utf-8?B?d3M0T2xhMFBMbWRoelhMMXVKa3FpcmN2dnV3MldsN0dkQ21JSmJubmR4V0JC?=
 =?utf-8?B?NTV0VWhudGxVT2VSWHVjbHBLclZZd3p4WWwvYyt2V1d6TUpQTmZyNVNJbTlk?=
 =?utf-8?B?ekRYOGxVMndwNjZqSkNyeUZyTk1seHhBcE9UWStwZWZySE9oY2NvbWxUOHh1?=
 =?utf-8?B?YW1EcUp0WnMzZUg1aitUM0lBTytaSFp6L0dneVgwcjdFckZpaFZRQXZGM3lQ?=
 =?utf-8?B?STVGSGthVWgyUDk4WE1RMWNhMTVic3QwV2tvVTUrUk96VFpWUW1oUi9HQmJh?=
 =?utf-8?B?bEM4UG1CV3lkYkRLQzdpUU9TazZwU05iUlF6aTkwc1lkZmFLdDBPblVzTzFx?=
 =?utf-8?B?ZU5PM2RsaDJOV0twTDFubkJZWWYxVkc4Ni9NUXB1STRkbzVtdEJsa3hxR0da?=
 =?utf-8?B?TlhqQ044UGFlcXZINEdNcHdSWWJXdDdzMWxCbjByZnIybS9yWkJLcTQ5N3pr?=
 =?utf-8?B?UnBkemE3am1LcHQzb1pBYjZzU0tYN0s3RmVYYXA1OExITzBaTXJWOEVxV3dE?=
 =?utf-8?B?V1BHMzVjWnJWa3RMa3JOTWhzczZVakV5SU9PN2pBZVNsMW5RVURQM1lMc2xi?=
 =?utf-8?B?dGo5ZDR5dURQVFhKYlc3WE5qdHVMdnVQTUVEMWxPdUNnNSszTjhDYStEbU03?=
 =?utf-8?B?UXBHNDh1VGtPaUlSckJCM1JVcnhoV0NYOHowTzl3bWZlNUF3eGpjRW1rcVJu?=
 =?utf-8?B?UFpESkJhK2Q5RWZNMXlBL3ZLR1BNcERRTEpqN1pNblZ0Q0RyMWQrR3p4YXcr?=
 =?utf-8?B?dXhXam9FUE1mTytpdEU0cTN4REJyQUNIbUUyQ3Y0K21qMm1pbFNkenptbmxB?=
 =?utf-8?B?RFM2dE5Qa3BTRkY4YVR5SDROUStXaldlTk83SGhYcFdHVVoyOFJRSFFQQ1Vm?=
 =?utf-8?B?ZzN1UzU1Y0orcnJ2eW5DOXFTOWthRjRXTlVHOTkzTmlzN3I4ZEJObWtjWENo?=
 =?utf-8?B?Mi9KR1IxNmJaM054YlhUMTluVDhMRDhKOGZnUWJjQTZHTGl3SVByT0FoOTdz?=
 =?utf-8?Q?S/F5R/sKZhr2jJ+tiPfhpxM9uDIt8XpcW1yodi8?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 952a7192-bbbd-4a02-3a70-08d8d4adf41a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2021 08:11:26.1206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: duVn6+voKSKzMP3yTnAhxi4yZ09Yx/JhB+yucbRgmVQdJPRUyWqp8Lr1HnIkdeMiDGSXEaFoIuwUO/l244V0bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2255
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=R6pj9Li5;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.8.84 as permitted sender)
 smtp.mailfrom=hongbo.wang@nxp.com;       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

> 
> On 05.02.21 09:55, hongbo.wang@nxp.com wrote:
> > From: "hongbo.wang" <hongbo.wang@nxp.com>
> >
> >   if user want to non-root linux can connect ethernet or cloud via
> > DPAA ports, and need high performance, should choose this dts.
> >
> 
> Wrong indention of the message (don't use "git show", use "git format-patch").


this patch set is created by "git format-patch", it's only wrong indention in email. 

> 
> >   this file will include inmate-ls1043a-rdb-fman-ucode.dtsi
> >   the related config file is ls1043a-rdb-dpaa-linux-demo.c
> >
> 
> What is the idea behind pushing the ucode into a dtsi? Will unmodified reuse
> be possible?
> 
> In any case, the include patch must come before this one, or you simply fold it
> in.
> 

for ls1043ardb platform, fman ucode is integrated to kernel dtb by uboot, and unmodified reuse is possible,
so I put it in a dtsi file, and is included by dts.

thanks,
hongbo

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/VI1PR04MB567753F9CE8F7F06BF6542ADE1849%40VI1PR04MB5677.eurprd04.prod.outlook.com.
