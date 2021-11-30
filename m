Return-Path: <jailhouse-dev+bncBAABBAXETKGQMGQEZ6PHOQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id F1810464232
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Dec 2021 00:21:38 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id p21-20020a2e9ad5000000b00219ee503efesf8001489ljj.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Nov 2021 15:21:38 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1638314498; cv=pass;
        d=google.com; s=arc-20160816;
        b=XtMTUp2AQopbsZ5KxCMYwVA2sPROhjj+ukUHos15d5bIu/k5GjlBCi23QmQMQG8ALd
         4K8mm1Jp5EPdnb2SwOnPDn8Tr5S0PaEIRWPbupeMcOlW157K3nlhOtNcusbIdi70gJPK
         55yB4qzIKynPGqK9oqMEzwxAec13fk+jEJJK/dcLvpTZoShY1iGrfJANwm6+UfKRRuch
         rm9E54n+TVpCZVna9eu/FMDdcPLvpxZWF9xLaYPtoMEF0nhMkUOTs2aQTHnni4lBLbu+
         6XDnfkgfwQkFqVk2yYtOjmZN0erPa1KhALjMxjfqHdwOh2uu2AVgFfopfzHvCGUjJXl/
         jBnA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=bNXih1uStCRnx6QJrfLR1KxTgqQt+ZVLxcJsKL7X5NA=;
        b=ghgPTxyNvjjPvkG4iWczX2BebrBSk9U8AH+FGP/URLlE7DWf6UphDKTyaQsDRh67fE
         H0JND9diDN6AI/p0jmO6Z9EogQtwuaxUNIOOR9MQno8xDFoI06WrxITt+ePE0ukYQYpi
         JdX7/y0CaiM/Cbqr117d7rvkdai5fEahmdqD5g65JdCbmazWfk0sWVvLfECXzOyc1AfE
         cOgqwIt3LCYHwrA0DSVeJ34iMybddpeDBkpsdsnKr+xHobTbLBTmu34gSTp0WnB7a0K/
         AYBfZgraR9JU5p2floG+J5AweeZshZ3N4dSB4YndFqlHuppMXUecG8vY0TSQGMHIe3G0
         uKgw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=gmpvTbnw;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:fe08::623 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bNXih1uStCRnx6QJrfLR1KxTgqQt+ZVLxcJsKL7X5NA=;
        b=lYQPx7pA+qB6lWGlXm0C+NM0CDlRaorXXa5cCJyRntLF9+pQdhk+tQ9t6viocyQfw4
         ohUT2PO5PwLb333seXF0ze+NLsl8Aks5pzVghZZAo6fY88dD6yPdOke4+KvUMc3ZGxs+
         mk0H2jPFeO9de1XYcxZskiRi19Dq42oj333MQDY17/ha3oKg0eW6nGMqiDwTgpXcYMHj
         a0wUmB3Ar73+pf4+kAnBC+vprbvSHZriVtIdbqlpKhue037qwI0eq3waw/6lBycrT5SK
         WChff23+BmFmdYNWBCsoFPAJquFB7DTbl53BteW/1EIum4DGPuQcrjqFdp+tQMuvgRkK
         id+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bNXih1uStCRnx6QJrfLR1KxTgqQt+ZVLxcJsKL7X5NA=;
        b=L4ygiL5bCaad+fXCHPKPSK3xw3uTLsxMte8NXXx8bP9L3LnWJyTpcARJYxBsugWoJC
         ZC8D14phAm4s5Z7hsGNrKO3yZ2B8mq+fV1sE5e2icYiE7tNw5s8693/Ot4bgRiZoQYMc
         F4KvJmgdxf8pZC1GpYhwV6ksaH70IAd5n8Y1Y4qxLV6vk+PI0lkvYtLDKjjzw5ccL7Q4
         8CyZjrWA5FubHvjOpvOB/E9TE7MuaG3Cnz70kyK29GmISrjkqwGEPwh4qUJEofuvxi0F
         tNzV3gonBksSgyrCPHp3L9iOWPy49pe0XwIlaSBMTWmbRbQ1B2hl0aOfFvP0Vshodeus
         8cHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532FoW90OJ1A7c8fL7iaaFoYKYpg0cyaDdpBUm9fm613e+nNrP/F
	57bSRjnEyAdCtlPkhX8gBRI=
X-Google-Smtp-Source: ABdhPJzQKYMmHcjxY88kYLjoRz0C3TdZ7s8bVJXryFIxFX2sHqgYAKp9H24GJO0fJ7GAM7Yzfzdipw==
X-Received: by 2002:a2e:5850:: with SMTP id x16mr1958668ljd.122.1638314498523;
        Tue, 30 Nov 2021 15:21:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8946:: with SMTP id b6ls34956ljk.7.gmail; Tue, 30 Nov
 2021 15:21:37 -0800 (PST)
X-Received: by 2002:a2e:9b41:: with SMTP id o1mr1914927ljj.499.1638314497717;
        Tue, 30 Nov 2021 15:21:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638314497; cv=pass;
        d=google.com; s=arc-20160816;
        b=QmXTpET4NChp00OKwM6Mdz3q4ccVq6k9RfnwhnAli+f65aLkY/ONlFlPptQr2WIVwb
         u68EV7iyKdueYZbziDl8lTweHZ1jnZpGsXPVAjSg1i01uitNXQQts90zhDEyK3v2nHBC
         +NEGzJuigxmXt/uRILqa0E12+1mNrx8RZaMeMO01BNm+ddYQo9SJEK34stdBpEJFrCsV
         k8eosI6G6PwkF+d0BPmTe2s7NBOPlwfDqkGlypOB4xbv9dHD5t0DDjCZqM84qmP581AP
         Aj0ICrdmgBzMi1DpeZiTXrMDOg5h3dO+7iNE8tfV9BObi7MKzSI/yQcivYAqvjsXKvGg
         GFXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cu53q806i+q/ng7fe+Q/irBZlCxrj5U8NcGk9k4Nwug=;
        b=qrkVPhxlWfbLLIbPRodeqpbaoR4Sd7mLIXVfSotnB8jxFFsbzxikgBrX7VqUqq80we
         oTyPYSG3aZ8DUGDfc+xY4TZtPWNa8+K3F+Hbnq3LCunhSdaE2WVbeeTN3RBY3heX52zV
         0qXC7EpyMAi+ORUAD36djHpx+O48WiCqGTW+1jhKIY//wwr2mLRjRDVcNxacIcXdHWEz
         HncKaSHcVvnsKTG5hjE9L9+j3tDjVF1BCspigl6t/+MnHO9EQWvjhsVq5A8op82wvass
         Ud7JUuwNinEug2YmKDOsBRlK37HXhlN+ACI5eE9s4Q4MPWdjZorUbqb00duUpcZuymeY
         UciA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=gmpvTbnw;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:fe08::623 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-am5eur03on0623.outbound.protection.outlook.com. [2a01:111:f400:fe08::623])
        by gmr-mx.google.com with ESMTPS id c12si1498822ljf.4.2021.11.30.15.21.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Nov 2021 15:21:37 -0800 (PST)
Received-SPF: pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:fe08::623 as permitted sender) client-ip=2a01:111:f400:fe08::623;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ityGRXG42iQvEdPbVI3Xv47CKZl5JXmwAs3FzbcWTR5CxaKoytF9lF05ZoqbgrgUxENxseraGE8/m/7rtxySjuWZuhdQPozgJIM3mlSDJ9dPgeMu6mAHDC0EcMxV2BpL4DiCUFu2Bd9v4v57vpIwE05yN9TpkToCvvE2MISLrEi+9nF9B1piRdku0JKosLZ/uWiR/vUAxP3BZVawgomEr/4BlZB8MKSl8zHJs3ym3hSUVPRT4opBAtmqnQPdXQ/cI/SrrJZUs/OnsT/sK31nbmQFtpm+TwwqB3P6T4O5aXr4KCCBByxx4oMgtdnuaTfnQ1SyffSLP7D2CpybQ/vziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cu53q806i+q/ng7fe+Q/irBZlCxrj5U8NcGk9k4Nwug=;
 b=WfmOpt+6a+0B9G58l5iqHdGuouLz+eNY5n7Y4Pe5Vy4f0c3zOE6+hR5rADGIzOgFYm4s+y7Xc5kcJeDCDkkpxWdI6EpkbCnp8aNvcZOyS8IjhS0NXqXBpRDrJQZ9jxNktmrPIMOXEDHtG3bY53xZsmjPyOwHujbRoiNncBy/FBbfxlajTYvz6a64AGvneoQdiaqfepCjOS5/KtNaN5rQSkwK8MW2La153o7tT/wEVl6CgSK00Xh8UfuvP3iJzEcnZQqjwkSSvli60q+NrYzaQ69LwbjqwtXnT0mqQ2AOq4MDH/MDg4j4/pb8qifdtRw6/Jr+1FvAkFZbeSWA1Azu5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com (2603:10a6:20b:43f::21)
 by AM9PR04MB8634.eurprd04.prod.outlook.com (2603:10a6:20b:43d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 23:21:35 +0000
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370]) by AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370%9]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 23:21:35 +0000
From: Stephane Viau <stephane.viau@oss.nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	ralf.ramsauer@oth-regensburg.de
Cc: Stephane Viau <stephane.viau@oss.nxp.com>,
	Stephane Viau <stephane.viau@nxp.com>
Subject: [PATCH v2 1/2] [RFC] configs: Introduce helper files to create inmate cell config
Date: Wed,  1 Dec 2021 00:20:12 +0100
Message-Id: <20211130232013.395-2-stephane.viau@oss.nxp.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211130232013.395-1-stephane.viau@oss.nxp.com>
References: <20211130232013.395-1-stephane.viau@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM9P250CA0014.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::19) To AM9PR04MB8652.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b57362-l-11.ea.freescale.net (81.1.10.98) by AM9P250CA0014.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 23:21:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 705d2064-0497-489c-795e-08d9b458271b
X-MS-TrafficTypeDiagnostic: AM9PR04MB8634:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB8634E8FCEFE5CABD52DEEC1AA7679@AM9PR04MB8634.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pyI5q4RRjdsscD0GzqqubVfRCte2f34LLb4RoWeLsc4xseiqrdoon5II59ljfxRyzlhmWf9uN3X1xAmStvKZJifm4mYL/JWlf7GnKNEDGrJYbMUkttRGM6Y5U7pS128aC/9cmoPslFtaSDSLJYqy6usPm3qXAZrir4gkEAuskEv95gLJL8gmCT04ukb/2r4izGs58fWNGCOL18T7EKaQK76gIWm/97qA574Vz89/aANReSh2nJmEqLgq2kLUyaj6QrYfyFRs4H1vxzaaIx7UkuAuIRZd43wXuvT8+PSLbvirwumLhtBP1QRaVpIlmtKao4qCbawe3wv1ZXTPcZs5hCAPtcAkmPgNSMpta6zUO/19DZPKHFhTQQkzGK+48IUDygzxZukagcWGmXkUFO9KIrlqIUfpUgFkgjvHKWUTFxlJLJX1inYM+eeTCIqV8sIM9ufQqWvYJhfjVCfQrIg+95RcjzCieDuLKJHOB9X4wUQoJIsKpvUcM1l6UzLy3YaMVEdj8AJNPti8dDnIBB7LN6FHmRStk4/p1GfarCxBm01i0rpNxy5+5hvghWB9armammooZzeNeYWQKDuM7KTif72kwwgtwz6vhAxws+2uqxtWFeJHKbLnrMLsKJUmORbefwGi1yX2H+6LHipnT0RvNYpcsxYGhcYcQHNIKJ13unfv4ODfSrfFqJf2Ww8OGlaOU6YwxU9PnhBQtuRRgHh2cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8652.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(26005)(38350700002)(508600001)(1076003)(316002)(6486002)(4326008)(956004)(44832011)(2906002)(6666004)(6506007)(6512007)(8936002)(2616005)(66476007)(66556008)(83380400001)(66946007)(8676002)(5660300002)(86362001)(186003)(52116002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hWf6y4GLTD6/OoYpksLvbmEaGiNwfBm5ZJ5DW6CHo9aHKV9KgH/Hh5/b0Khu?=
 =?us-ascii?Q?zTJ0PtxiLcsMsyQyOJIrA+NPwAR1nkWSXnxb94xColPdwOEbWQFBbrjAKLvk?=
 =?us-ascii?Q?ausLmmEyvaEMvMGvx3VmiE2wVWc6Wqpqu7QDeQoEH/IOyKnQSeuett3EBDfQ?=
 =?us-ascii?Q?Rel2XC/8rvajYXCnF8EMtpvRuiI+um3Zgu9Q0FUb2ONiI7m1yY+sACOEIt9v?=
 =?us-ascii?Q?7bopm68hxBpRanQVV9XW2ydFPc68DpyQw2zrj3ahyAw2GJfdes9FAox9yhVK?=
 =?us-ascii?Q?Qojy1/QkmQD9QKNJPYDeUa9nJv0CrA3YzRzJR2GqgPimYRIK3h/Yc8YgUwC/?=
 =?us-ascii?Q?W6IKXLugTPNMQE6zBnOoNx4vW2vBdiOXSotwTSDl0izeSn28zFwyFF0T8Bd6?=
 =?us-ascii?Q?+pOIFQbA1tlO4XeRIdtnunVptNuqCe6wXwwIIAovUor0rl9/CP0D/us9xgMM?=
 =?us-ascii?Q?bm728cjbAHKGObaRa7SU1h853hfuQf2GY+aOwd4B8espt82rPyiTYgClFnmh?=
 =?us-ascii?Q?Hiri221mXZIOzCJ0ntSlC/DqZh7T92UC3c0YmN0jjpcIewJq4lCTyWj0z6WS?=
 =?us-ascii?Q?J3tHf6DDgJ1JDzwnEba2PWLdhGwGBbw22EyyhjznTUVZ2c2+Y05xbcuIuxGh?=
 =?us-ascii?Q?/S9vdCfqwNBMvwRMrwpsgBQ+8PBeYgXAAaIHjSdlXCoW4gs3DfUIPNxhtFCt?=
 =?us-ascii?Q?6TDD5W8FlIa1QZnxAfI7BtbloJYtYmTYmtzyYfVciwuIBgnIfIYtc6swyBl0?=
 =?us-ascii?Q?WtSV6trryw9P7xEFhTPHFEjamiIHs5zL35dkgPI9UY7v6Ho49aDbRNMyF3ep?=
 =?us-ascii?Q?LcCJk6S2J0DDlHO5ZDUZXil18Pf3zluZgOIdM8fmn73Sd6NWTTw8KPoJKSbZ?=
 =?us-ascii?Q?8Vq8C0IDd+05IPiFqpwX0RLmdg0LMcamWuF7rTZGyAiyHfl2KZOD6JJYy376?=
 =?us-ascii?Q?nuxvYZwyJbHlAn4wv/Z5Da1jkqpX1EvhR4WgyKVj0gi6XjWV469Q2hOXheYQ?=
 =?us-ascii?Q?JwP3/u7cnh2ME3QdLNQtXUmGtGjHejWxQn/NbG3tJr4XLXKOA9Cznzr4evl1?=
 =?us-ascii?Q?+Eq2BcJU8XSwHR+Ewq74vuP6JxaoM8q2Io/AhQWWqveyanimF292OUzVcuXY?=
 =?us-ascii?Q?gYA+OYVOf2wbUWpOcf8b+ZdCjbF8grZ/JV1Pr2Ge/37l+jLRKcvOVN+cDSqK?=
 =?us-ascii?Q?bj8w/obcCXYlj+Wkg80/Cwi+IeDS+BEw3ijdevxHeIUiAsgkjFjWifJiGXjU?=
 =?us-ascii?Q?5fJLccdPAMpAJjmSQ96bGimceNFMBSRXhmA4R0XgnLSfNXCPQ3r5K9Fs09b4?=
 =?us-ascii?Q?WVxFtc0MhHENDkDbi1I0wny+sgBpy70lgwk1buqjS65GAfgsXJD2Z0VflQCC?=
 =?us-ascii?Q?SF0WkNihCpHjOf31GbnGaVJfcWDDpqodDErqDgKpRgawmsPMoC2JsBoP+Vjh?=
 =?us-ascii?Q?S+liRHGiMhptlLGccnh4ZAHpVyRxK1xvkDKCes2wAO0ssES9M6t3zojTphhP?=
 =?us-ascii?Q?PpInTOBiEAj2uiZsAgL8x4tElR8aQ2Imxrgd2zXaiW2McYmWhWG8ANJiHIDl?=
 =?us-ascii?Q?ko1dvLAsQg1U02NNuNhoRgPG3563avq/AtFEZf/D8TDZ+MbErHHTMwCJ3feT?=
 =?us-ascii?Q?mmmUWlQqJkbU7+o7enrCncw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 705d2064-0497-489c-795e-08d9b458271b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8652.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 23:21:35.8657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fgRsep41Oy8FWI934WptX7EyMlMxYUl6SU+FvaaA4ngWTzX4qdIRQiaCZhST8ZyYOaHLsKFgfOYjaio2zuGDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8634
X-Original-Sender: stephane.viau@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=gmpvTbnw;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates
 2a01:111:f400:fe08::623 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
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

Inmate cell configurations all look alike - more or less.
Let's create a couple of header files to hide the fastidious stuff
(structure field names and so on) so that .c cell configuration files
look a bit less ugly.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>

---

v1 -> v2:
- Add PCI and Console helpers (needed for inamte cell conversion example)

Signed-off-by: Stephane Viau <stephane.viau@nxp.com>
---
 configs/arm64/cell-create.h   |  67 +++++++++++++++++++++
 configs/arm64/cell-helper.h   | 108 ++++++++++++++++++++++++++++++++++
 configs/arm64/cell-template.c |  51 ++++++++++++++++
 3 files changed, 226 insertions(+)
 create mode 100644 configs/arm64/cell-create.h
 create mode 100644 configs/arm64/cell-helper.h
 create mode 100644 configs/arm64/cell-template.c

diff --git a/configs/arm64/cell-create.h b/configs/arm64/cell-create.h
new file mode 100644
index 00000000..c562b4e6
--- /dev/null
+++ b/configs/arm64/cell-create.h
@@ -0,0 +1,67 @@
+/*
+ * Cell Configuration - Structure definition
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Stephane Viau <stephane.viau@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[CONFIG_INMATE_REGIONS_NUM + 1];
+	struct jailhouse_irqchip irqchips[CONFIG_INMATE_IRQCHIPS_NUM];
+	struct jailhouse_pci_device pci_devices[CONFIG_INMATE_PCI_DEVICES_NUM];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = CONFIG_INMATE_NAME,
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.cpu_reset_address = CONFIG_INMATE_BASE,
+#ifdef CONFIG_INMATE_VPCI_IRQ_BASE
+		.vpci_irq_base = CONFIG_INMATE_VPCI_IRQ_BASE,
+#endif
+#ifdef CONFIG_INMATE_CONSOLE
+		.console = CONFIG_INMATE_CONSOLE,
+#endif
+	},
+
+	.cpus = {
+		/*
+		 * bitmap of cores used by the inmate cell
+		 */
+		CONFIG_INMATE_CORE_BITMAP,
+	},
+
+	.mem_regions = {
+		COMM_REGION_RW(0x80000000, KB(4)), /* communication region */
+		CONFIG_INMATE_REGIONS
+	},
+
+	.irqchips = {
+		{
+			.address = CONFIG_INMATE_IRQCHIPS_ADDR,
+			.pin_base = CONFIG_INMATE_IRQCHIPS_BASE,
+			.pin_bitmap = {
+				CONFIG_INMATE_IRQCHIPS_BITMAP
+			}
+		}
+	},
+
+	.pci_devices = {
+		CONFIG_INMATE_PCI_DEVICES
+	},
+};
diff --git a/configs/arm64/cell-helper.h b/configs/arm64/cell-helper.h
new file mode 100644
index 00000000..525d91c6
--- /dev/null
+++ b/configs/arm64/cell-helper.h
@@ -0,0 +1,108 @@
+/*
+ * Cell Configuration - Generic definitions
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Stephane Viau <stephane.viau@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef KB
+#define KB(bytes)	(1024 * (bytes))
+#define MB(bytes)	(1024 * KB(bytes))
+#endif
+
+#define REGION(phys, virt, bytes) \
+	.phys_start = (phys), \
+	.virt_start = (virt), \
+	.size = (bytes) \
+
+#define MEM_REGION_ROS(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, \
+	}
+
+#define MEM_REGION_RW(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, \
+	}
+
+#define MEM_REGION_RWS(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+			JAILHOUSE_MEM_ROOTSHARED, \
+	}
+
+#define COMM_REGION_RW(virt, bytes) \
+	{ \
+		REGION(0x00000000, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_COMM_REGION, \
+	}
+
+#define MEM_REGION_RWX(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_EXECUTE, \
+		}
+
+#define MEM_REGION_RWXL(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, \
+	}
+
+#define MMIO_REGION_RO(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO, \
+	}
+
+#define MMIO_REGION_ROS(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO | \
+		         JAILHOUSE_MEM_ROOTSHARED, \
+	}
+
+#define MMIO_REGION_RW(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_IO, \
+	}
+
+#define MMIO_REGION_RWS(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, \
+	}
+
+#define PCI_DEVICE_IVSHMEM(_domain, _bdf, regions_start, dev_id, peers) \
+	{ \
+		.type = JAILHOUSE_PCI_TYPE_IVSHMEM, \
+		.domain = _domain, \
+		.bdf = _bdf, \
+		.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, \
+		.shmem_regions_start = regions_start, \
+		.shmem_dev_id = dev_id, \
+		.shmem_peers = peers, \
+		.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED, \
+	}
+
+#define CONSOLE(_address, _type, _flags) \
+	{ \
+		.address = _address, \
+		.type = _type, \
+		.flags = _flags, \
+	}
diff --git a/configs/arm64/cell-template.c b/configs/arm64/cell-template.c
new file mode 100644
index 00000000..c6981a51
--- /dev/null
+++ b/configs/arm64/cell-template.c
@@ -0,0 +1,51 @@
+/*
+ * Cell Configuration - Structure definition
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Stephane Viau <stephane.viau@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "cell-helper.h"
+
+/* Name, cores, entry point */
+#define CONFIG_INMATE_NAME		"inmate-cell-name"
+#define CONFIG_INMATE_CORE_BITMAP	(0b1100) /* inmate uses cores 2 and 3 */
+#define CONFIG_INMATE_BASE		(0xc0000000) /* entry point in DDR */
+
+/* Memory & peripherals */
+#define CONFIG_INMATE_REGIONS_NUM	(1)
+#define CONFIG_INMATE_REGIONS		\
+	MEM_REGION_RWXL(0xc0000000, CONFIG_INMATE_BASE, MB(16)),   /* RAM */    \
+
+/* GIC */
+#define CONFIG_INMATE_IRQCHIPS_NUM	(1)
+#define CONFIG_INMATE_IRQCHIPS_ADDR	(0x38800000) /* GIC DISTRIBUTOR BASE ADDR */
+#define CONFIG_INMATE_IRQCHIPS_BASE	(32)
+#define CONFIG_INMATE_IRQCHIPS_BITMAP	\
+	/* interrupts 32..63 */         \
+	0,                              \
+	/* interrupts 64..95 */         \
+	0,                              \
+	/* interrupts 96..127 */        \
+	1 << (76 + 32 - 96), /* SPI */  \
+	/* interrupts 128..159 */       \
+	0
+
+#define CONFIG_INMATE_VPCI_IRQ_BASE	(76)
+
+#define CONFIG_INMATE_PCI_DEVICES_NUM	(1)
+#define CONFIG_INMATE_PCI_DEVICES	\
+	PCI_DEVICE_IVSHMEM(2, 0, 0, 1, 1)
+
+/*
+ * #define CONFIG_INMATE_CONSOLE \
+ * 	CONSOLE(0x30890000, JAILHOUSE_CON_TYPE_IMX, \
+ * 		JAILHOUSE_CON_ACCESS_MMIO | JAILHOUSE_CON_REGDIST_4)
+ */
+
+#include "cell-create.h"
-- 
2.34.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211130232013.395-2-stephane.viau%40oss.nxp.com.
