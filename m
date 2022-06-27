Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAPF42KQMGQEHT7XFZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 3004D55BA18
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:37:06 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id h16-20020a05640250d000b00435bab1a7b4sf7209800edb.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:37:06 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1656337026; cv=pass;
        d=google.com; s=arc-20160816;
        b=huS9ARN0ACWj1Bn59P3Avonk4BCYd2fECOEmc0zWKQnmp++Pnl+2wMfLctmFuY6L4B
         Z+D2LuFDNWcXZDpsmR9KOYoV4dVsZ34e6ggLgOPwrh+4Tycpnk5Vz7vAzM00k/EMpoTH
         3Z1NGGTmSBk4pvrQb5Br+P3/HSR+EMfWnTO7pE2NdcwUCwxLBpx9ZgsE9R54TrgheN6Y
         /zde04b9BEKn8nkDftxmo6+nr1yQpanS/3Gr/I305Wx4Hpp8leiLVcC98TNBpWcStxOy
         9nqe7AzKaycq5+l6e2J6MyV4NdF4ttLhjQX6MVDj+jB3ZiX7UMpWfhKmqTpRH9DGcfTn
         ZXHA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=ugLtaKnRJI0iffZOF+QtC+ti7yqRA6tOjz4xVkW638U=;
        b=EDgOBJMULG+nHmQ2zLW2DiDA0+AghUTSc0VCv/zf9UuKzIVkBGo104JzrAZbQnYy1B
         NIoFtmf9yEK8dL24iKI0JodXTTKPs3caJkKOm1FAqADSRaLUljzJU+JhDtfOG7r0fcbr
         S3ynKL+J2ri62sbv0SykpWL35bmaJFBdcyB/md/zRsPiy0g2dHvkrmeAtsP9Sn8rrWSt
         KRlV8Uy0CdjrcYmWVQzFR69oGr6/DXERESXGIhxyvhg+ms1HO8YUEQ6Z/Ec766FIshPN
         rEdHFmMM/Vx6aQdWk9xRU1/cQ64N02/2kgPgLD3iZMNzKnJrHEPGb5+b7XQWQzLz6HJc
         LAPQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Ej7GOUE8;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.22.44 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ugLtaKnRJI0iffZOF+QtC+ti7yqRA6tOjz4xVkW638U=;
        b=JjhTJnLivgC0tFAnbN+lGc5X54BB+j6QU8A1HSaSKAyF5tCIYJrw5vdMPr+hV3i6oK
         d+Htfbj6iUachiDK1q1AuqYOs4se2ffw/S0F7oddILBQFi/eOFRDoAW/lX5ZWaTxpb0z
         EWvw5TiuCL4WIEJqwq4WIMl2rRCGspSDOs+PxSQuWU0p5QBFPwelKmbC0iAk7jfh/Iww
         cCVaJm3WLKLj8RwS2kFAizKATw65bWIrOuXrcaBCj7tXDQGJPvWjO1kjG7mpp13vAIlY
         qUuSGI8lypZUnDNhlMpmQ4P7CzeUsMHCwpB7h/MFY2i75K7h6qutffB+nIqQl3UKXMXr
         j3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ugLtaKnRJI0iffZOF+QtC+ti7yqRA6tOjz4xVkW638U=;
        b=azExKeJfnduePJHwdhC+zE5L8fYZkL1KJDmoX//+KzOIAzwZF1v6mKURm8JyQ60zTB
         LwKFA0T4OPK2TEWRTaZPEuPWViYw7OyiPs7PXsh/ABFPaMt6Bhcb0dwmoaOrf1xW/Bif
         NoqfZ7EwvXsS93QZ75qWcFnOWuAE+LaIMmYNX/IMHKALwPja2L06fmhK8HuFvrGMZ8QU
         +pnRWBiktYcOqOROQiGabd5cnW5zNLBF3dZgo04hpBf2W3NpP/GknanXVPLFS0o9BDLR
         tL4E02NXi9C8WxCGv546OVNAAgq9ZKvgsubW9EzyqO3Jw3uZ+PqO2XYCaoHNo6B+Qtkc
         JxXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+Pk4E2TBEA4O4c97TKfMWvF00MkM1K25SH/oLupMc2n/A3DEOe
	acbSfMCwFmIrbcb2yY86mFE=
X-Google-Smtp-Source: AGRyM1sTBznGLXEJr3JUH7ET05kMGGa/F1CoQVkx2r1ug9KwWxQpEm0PqsYmxXDoGv2G/N57HYadYw==
X-Received: by 2002:a17:907:1b03:b0:6ff:78d4:c140 with SMTP id mp3-20020a1709071b0300b006ff78d4c140mr13116496ejc.554.1656337025903;
        Mon, 27 Jun 2022 06:37:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:4245:b0:435:dc4b:1bad with SMTP id
 g5-20020a056402424500b00435dc4b1badls1461469edb.1.gmail; Mon, 27 Jun 2022
 06:37:04 -0700 (PDT)
X-Received: by 2002:a05:6402:1459:b0:437:9282:2076 with SMTP id d25-20020a056402145900b0043792822076mr6431290edx.6.1656337024315;
        Mon, 27 Jun 2022 06:37:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656337024; cv=pass;
        d=google.com; s=arc-20160816;
        b=g4T2JJFjNYo7ZS+Y/Cca+bFU1Mg5l91bb6L8LaRW3u2U0a/87FAyZQRW8AWRimznEq
         dwrsW4aS6HZp1yL/NtRkWEEAytMiUgeCKki8L3ZSGeJx+XOiRfOlr2jjTIeS5ya3vCnc
         6/0riJnfHwcvKgw/otu09MxtKtQi40AZZyufd8tMDY96NKZJuaDQ2Pk0yMn6uIU6WkLY
         96A+nvB6q0Vk/E1wLrAJXfbvib+SqxxIDvTX4VaKKvoGDywyO4QdH6ETtXqqMi4es2ch
         Xd5i+7Mph5N/xHYSL1E1DrtSPatuVPTF6MK7qT25IOEkSvotnr9laIYquKxbsPhtt6gk
         aa8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KmuyzIy5XRjxDQv90oelZ8d8QOnJXkeHJY7NpwKUgZ4=;
        b=LnQvHwRLbnB7iMHrbiX+rBsva948cUZSm+Cn2gx4herxWRb6Yn+lduJ9lQRi5YFHow
         Irmt9k1p6gxZE79QaN2SK5Qzvq7jP5ugyUeYzQbielgNNemj5Efqx6baX9TgMlNMz4KV
         ME7CrtmoXHyQa5CGL7/w3dbOyni1wdHDGvGGjcHOrPLsPzF/eepWcmfe7E89I0KWVBzs
         3o54ohksoRKBheRf+hreoCWRq/atrCI2k/361Qt4L4V/UKrfMWqg50lScykq2p18XZVf
         WKkuZZcdAM1Uxa1C8gzImOwr11yKDCyiHggtpkwdknjeNPa6peQM7wQrLLb0V26URofX
         qELQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Ej7GOUE8;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.22.44 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com. [40.107.22.44])
        by gmr-mx.google.com with ESMTPS id e24-20020a50fb98000000b00435a7649ad4si536253edq.5.2022.06.27.06.37.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:37:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.22.44 as permitted sender) client-ip=40.107.22.44;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GURXJuFJdX4k5SBQWWRBi1qr7WqHpTtHGerWoRRCg2KbS/oYomu6G7Aza2knQKiWn4cLE5mV7q3WZ+EmNaSZ5tNe9Ewtyzkg6rFuqNEAwC5GLmZSoKdgsL7oSOv6vUA2uq+xSIZvLCL4Bfx0pv9abI4vT2FowcE33dePELHW0W+VgvvWBTyddWmng2tCYQeTmAvooV+iGqHkyPtVBkalddovJrjGBlx9iu/kUST7e5PtNsg7FJ1dmC55e8K1gGvHvR+9o2PZoFrbXavTjqPR/qbX3N9RIIZ2roThfvaGEIYlpr9rMTD85vJh+TYrp3W9KLTCbSjW5emILfKZwLlJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmuyzIy5XRjxDQv90oelZ8d8QOnJXkeHJY7NpwKUgZ4=;
 b=hSLoATlF/ElDjCLsWfBFJXeTPxyjM7OMfJLFc277kLUIWGi1RNAiLQojMSk8N/5zD2eZUEyQJqjxI5U5d0Dxy3JC8n+S/EAz+Kn6iauHZgBoko6eqdTGeliWfLOrJ6zyaVJB3fKPVoYAJYlYlypef7IuxmiofbT58pINX/W+02htcqMZiSObRYRw3ZVvQo25eASfAUxQhQfEq7/xlOE0VIr1XdwIwu3vJDwaPi8zCX80BYiIc4EGYY4FU72TQokGej+sRxxvEn8IeFqNRYbP1bqYxaetzN7++suzo3I5AXf337Hr4S2ZX/TYgNOx4f9/8sr2bLaOs+iSK0HOWF6BgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=oth-regensburg.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from OS6P279CA0041.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:32::19)
 by AM7PR10MB3793.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:176::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 13:37:03 +0000
Received: from HE1EUR01FT031.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:32:cafe::58) by OS6P279CA0041.outlook.office365.com
 (2603:10a6:e10:32::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Mon, 27 Jun 2022 13:37:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.73) by
 HE1EUR01FT031.mail.protection.outlook.com (10.152.0.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 13:37:02 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Mon, 27 Jun 2022 15:37:01 +0200
Received: from [139.22.133.104] (139.22.133.104) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Mon, 27 Jun 2022 15:37:00 +0200
Message-ID: <d85ed09a-9979-c40c-9b15-ba68187ab22f@siemens.com>
Date: Mon, 27 Jun 2022 15:36:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v1 34/42] configs: riscv: qemu: add system configs
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	<jailhouse-dev@googlegroups.com>
CC: Konrad Schwarz <konrad.schwarz@siemens.com>, Stefan Huber
	<stefan.huber@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
 <20220627132905.4338-35-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220627132905.4338-35-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.22.133.104]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.017300-8.000000
X-TMASE-MatchedRID: dzgRF5KJYaM5QaOxwNGfvo9bHfxDWoibzMJfjs/I2decVWc2a+/ju0yQ
	5fRSh265tmTuCy5+VUo/ftLU11DRzKtUn36QB84Oo/wuV1Zm3TmAsyTzvcMKh46MisxJraxHLoz
	I+rhNYbm2zFWqrVN4BZIu8BCNfKQKQY9ube1qTn6Rk6XtYogiau9c69BWUTGw0C1sQRfQzEHEQd
	G7H66TyH4gKq42LRYkQ1XxIxBknRTbXWmtbtzm7bgUr6gmVxSBoY5+creWsa5+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.017300-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 615B8547FFD6A250D453AB18784F2E224B9DB58A88A1E7CFB9075791619FA3E32000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acfc0e75-5157-4378-72f6-08da58421e86
X-MS-TrafficTypeDiagnostic: AM7PR10MB3793:EE_
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3gIlKqeny1yWYu2fs2DPltMjzKnO7zy/WJVU1GeEOkqXKWN0QajyZFo17dc3NNITqCfwgmRAm8lRx412MQUxBN3DdxblxMOfUwpYrg9s/OO/90yH4JyT2YnbaG65JufTePUGbcDq21FlN0rDBZfg6+eCBGQ2bRpZyPZV+IZBks6CF1NqgOEYe2EZn+FnHc4yKJpmGvdLIf9qCBJhNFRDMRs6KAHn82dtC8bd/eEYBKb4wFBuhLL5SBwyk67XrIWwkKLEQVbzsXJIBJWFzrBcb75cPlo+fIJE79S2AZ66Zq2mBDiyWxO+9lgDn+puIzFLWkX9C/4Hhq7+4BIySMQsSmFqn4SgJElgdg5Ed+90t9et9gDFqcom/9bMMSfK1ZveQsBmBb07qq4rd/J6yljj8OZcPbgNqa+13HwerAie5intC33q6ukqgwnfNJtEwP4ruwy0argtK4mrp2SeKBFCKcWthFHoiGBbvkFZB7MOJxfLviTh+CDqOJojtUZx1URRJTGyRLl63nLgP7i64S+2AYg7Dy2av+2CwhHBajnFm3puEhD+voq30NxnMz81oyDEE61ckXCk1UMm3aE1w0SVMW46wppjrpBXUP3qH4v0Ad/zXGIu+fVt6tbeTFGkiutsO75AvPzsPRyAs1I1FSvb5SSh245BLQm/jTX6rcaqnFPewGfw4zkl+6quT/J8OlDbu4EO9UoXhMCxOGgG78HlWFEgUGg/yzftoKGE59tW13OtzAM+JH6PlJKB0hiRLEJQ3hu66JcGOPP5Laf4fNWmoTMwRoqOyAvooK/das+hTyHHfph/eYI7ofmVazdI4PwjhStL3xSoToFMp7wwqkKm3x0dUYTOEHWusFPreokH84vn9Xn0q2lvU7w3SZyNSWdYpz0uUc5PlgKbCgHyLiqNdg==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966006)(36840700001)(40470700004)(956004)(5660300002)(2616005)(41300700001)(110136005)(82740400003)(36756003)(6706004)(54906003)(31686004)(16576012)(186003)(336012)(2906002)(40460700003)(82960400001)(82310400005)(316002)(8936002)(356005)(47076005)(16526019)(70586007)(53546011)(26005)(8676002)(86362001)(4326008)(83380400001)(31696002)(70206006)(4744005)(81166007)(36860700001)(44832011)(478600001)(40480700001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:37:02.8778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acfc0e75-5157-4378-72f6-08da58421e86
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT031.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3793
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=Ej7GOUE8;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 40.107.22.44 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 27.06.22 15:28, Ralf Ramsauer wrote:
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  configs/riscv/qemu-riscv64.c | 218 +++++++++++++++++++++++++++++++++--
>  include/jailhouse/console.h  |   1 +
>  2 files changed, 211 insertions(+), 8 deletions(-)
> 

...

> diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
> index 34dd7209..0b6c558b 100644
> --- a/include/jailhouse/console.h
> +++ b/include/jailhouse/console.h
> @@ -50,6 +50,7 @@
>  #define JAILHOUSE_CON_TYPE_SCIFA	0x0007
>  #define JAILHOUSE_CON_TYPE_IMX		0x0008
>  #define JAILHOUSE_CON_TYPE_IMX_LPUART	0x0009
> +#define JAILHOUSE_CON_TYPE_RISCV_SBI	0x000a
>  
>  /* Flags: bit 0 is used to select PIO (cleared) or MMIO (set) access */
>  #define JAILHOUSE_CON_ACCESS_PIO	0x0000

This is likely needed earlier in order to allow building things.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d85ed09a-9979-c40c-9b15-ba68187ab22f%40siemens.com.
