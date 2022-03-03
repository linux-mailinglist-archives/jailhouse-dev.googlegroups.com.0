Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBF4CQOIQMGQEU2IYPJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8974CBEC8
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Mar 2022 14:22:32 +0100 (CET)
Received: by mail-lf1-x137.google.com with SMTP id z25-20020ac25df9000000b004435ff4bf94sf1563575lfq.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 05:22:32 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1646313751; cv=pass;
        d=google.com; s=arc-20160816;
        b=goJYJyGp/r+8a6DE/0d3Dy9weN46FP5kK7h3hpe0KfL2pynCa8DHCtZfOnK16RDLVa
         7qHEaYiQgle/pViluihl4SxpZ8YyaDSTOwf5KJ7ar/q2pABZWnA5FKdI6IexucvvMqrh
         3K6ZEkkf6Bt43MkomCU/G7EePwlhOYAryhCX7gUugZf7Xv2R+ClGROfNrWGg55Bnrj/g
         +g+ScuAthO7jMgql8Zf8wnUnb0YBGs/PQ3LK1jrbTPLV3iZMXm0rTXVdsTo/FwR+tUnB
         MTLRuYp3Weyp1cK1ah2LScEiSfyspinqr5hUJVgPx77dfygVWxKF033EWD5vOzWPurSK
         jfeQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=FiBlNrbd5ve0RXrw7POZsh9kpqy920VPY7r7csVC4tw=;
        b=t3/E+ruACik12Qff9er9ourbCi36BVrcET5KMJ7FpEFHX7ohgI8EeVLKSDZclVB1Yn
         6WGhnemogwQPDChmANxEEo+daSLUZ/jkzBj2i0xD8glHQjleF2KVR0Rnx4ie70gpdTme
         1ZiVsdvGnppOyKxug1rvyWNBbNfIB1foiA9FY/fcX/ee3y05r7Hf1/VrAPTiheWA0S5m
         eR/PTLMtj3k8E8VF7jxEFFM0qYIuCB5CWVo5pcgM25G+E2dM9v0uEeJY/uFuUgne4qIY
         NICVhKbhXITFYW5p/cneyJ5DSJbOc4a0Q6eVwkE2aw1Xh7upCml1IlwevznOYC2oYgKS
         IfLA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=nUOS65bd;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0a::62d as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FiBlNrbd5ve0RXrw7POZsh9kpqy920VPY7r7csVC4tw=;
        b=cXAL+7AACNTeFRXstwhzLYMuBRJu93kdRdQJhguVrOGD+Ifw5Fm2ooBnUEwlnXOp5j
         fC9q8bvFGQdWzSlN454qD30MgsVcuvRWvg9lvi+mTGgISIsHVwTX/xRfyVqjMxU4/3d9
         fIu50IoLujWHvz5C9kzsib78F2bnwELzc6z1qjXKj6IqJskgPZKNw0myj7pqVgfXPXnn
         cBRU6bwKnexGW3CBkXylK4YGZItEZ//lkcKVVw+zcO8UmhLLNO+K8TaDpBJZ3mo3ZfNF
         FNR84F12eiE1WYGiCyzsqd2rsJsXLZxT5BgjAud+2YjVB9CrTbllYyRCmrSLUQlM9Nz7
         t/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FiBlNrbd5ve0RXrw7POZsh9kpqy920VPY7r7csVC4tw=;
        b=L2+rTIOJpzMmZmIuXsLGqBwaVGdTO4uTLSvDqOnTq0Dn+s8WqnQk3ts1gn4vtYTs7f
         Tna/aOP0ImaZ5M5hV7I8L9S05Q87OZRW23r7L6WErASWxOdEJPaYnOy0zc29jDdz+kPf
         2q2WfENAOVSQEiAi0GHLvL6Lg5JTVwTcIJd3kmMC2vgH+IxBmHw9QyDhSPi5ocHEzspH
         P9sBKPzrgifLPqsAak/fBh/eRKBiUvBRVFAvyjg0VFsnKgWFjS+KUnKOi2tIsXBTCU+I
         cmn47xsgB2ejbZ2YpLSboM84Gi8z8NW8lFVxoAu7zOIuoOmoZ1qFB5fsKOdLN/rs/CNs
         ztAw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533W92vw2DUbjP1D/AS9j3dQaoQvIMaA1pNhN725kDyWWLxgWGlf
	qZN0qoaEQO16YAmBs4AUuUo=
X-Google-Smtp-Source: ABdhPJy63XK28EuFoWJCN0P2RoJLMoahu2t225ySd8RnogbRQ87lGCR4xoq2gZLsB1+7X4OW7ckFTQ==
X-Received: by 2002:a05:6512:1510:b0:445:cbc3:a51f with SMTP id bq16-20020a056512151000b00445cbc3a51fmr1514560lfb.116.1646313751675;
        Thu, 03 Mar 2022 05:22:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3b8e:b0:443:9610:6a0c with SMTP id
 g14-20020a0565123b8e00b0044396106a0cls1645264lfv.1.gmail; Thu, 03 Mar 2022
 05:22:30 -0800 (PST)
X-Received: by 2002:a05:6512:15a8:b0:445:b890:97a with SMTP id bp40-20020a05651215a800b00445b890097amr5670987lfb.377.1646313750173;
        Thu, 03 Mar 2022 05:22:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646313750; cv=pass;
        d=google.com; s=arc-20160816;
        b=aJn0RsKjKa0AWVNJIyqkH6yF3FC0KBx/nWX9fFevb7Z+eIRXQgRBW95pJTqE57tm75
         1kicLOC9oSpQEX6DZgoywSFhWSOGoBoM46BBeyFuBP5GE/9vvuj7H6/a/ZJ1tGxgnQuT
         +ZMmJgSbCX5tD3oMfEWg783bU/GhRbpv2xlYjiYKfZtuxSun+uG97XsvB0AKwIocRQ5Z
         jOHmKj7jZXrBXvQyttjMmntlGe9djm9HTSb82HCC+cnYjHRqETjrS4+LHy1BABRliW/N
         +6gx926BQfsMES4swMwvLNBbKJK0bQZ4PK6FmKcqvY+rf+RZqu3t/RI+7DTmtMt7UCuL
         E53w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DlmYAkLUhWc5s9gFAgJvq+SMVl2N1Y+Zi7pT3e8qEU0=;
        b=JhRdtzwhEuybFd6M7AqWB+E3/HkEhiz2ocaNBVMMMtbpHEm//YpntxjJBZuryAu777
         mhAchwWUcIcUpTkP8GzM0w8S9K++Fq2L5J/Q/TdgYGqIOTg2RIz6pe9dBOpbL1ZxQg17
         w0O8PVDIZ0zA13KYGnsyTBzZLaCR2R7O6QtjnCzUrBTCL/sh1sjIcOcbosbfeNl4K/hx
         flNpmL1Inwfc6Y+F/13U61Hz+oHAiE6J7a+CoN1p2Ot3ogJIOS51+nz4ErL6fROOIFLJ
         eohWvbPj+3BpWuvZdM0b7YfX0FB7EKCrtBh9Da9TghWwRzRYurVHrENt5qUTYIl3D3Xv
         FMKw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=nUOS65bd;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0a::62d as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-db5eur03on062d.outbound.protection.outlook.com. [2a01:111:f400:fe0a::62d])
        by gmr-mx.google.com with ESMTPS id bn35-20020a05651c17a300b002462e02f542si85502ljb.2.2022.03.03.05.22.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 05:22:30 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0a::62d as permitted sender) client-ip=2a01:111:f400:fe0a::62d;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1wxAsueun+eb3QbXhUO5Ev4H31/NYEmEauCXiOSpOBYTPfFnjr+LKrt2OYJXq3UROE1HjAZQW+WsI9b7n2AWAkydQIDrOHKsJnXKnmLHNPkx8SqqoM2Ke99JcVHgVslNvR4jTklSKKfCr7ioDRrOEaJfqSU0UCWt/qK5m//n+P2p4e9R7sUxAQAtBzB4gEoJSC+zbYh1mqQqOdQyQETh/YDcdDZ+MGRrl59wwQXg/8fanJx3YJGUi6zOs2ug9NBTwVcJraj3FPMg0fd+Jem2jOiQPTurzJ5rpc4J7ZQhkW7BbxHTJG6gx7PlsTSm03rxSL5cLW3QMn1SdoD1+eVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlmYAkLUhWc5s9gFAgJvq+SMVl2N1Y+Zi7pT3e8qEU0=;
 b=Neo5tVmIzaLiug3q6hmoj3XYom8L1oo+ncPyeYgptG/dF1R15Dq2zSZRmRMhCUOSEwBwv+SLU+mJXSZGt2zO+aRv0HRc7FiwqPxNXjMmDD02wO36+OZGp22fIy1vscIATSFPookX3vu5mCZOrrYy2SIOyDFTuWxETVMOY1e5bAQ7YPC5YQ3cgUFGXmHmiyMxOuqT0i1UFF4VmDXHzER7wXwD6SMk1WliXTsflVd1j/n/t6GUumYJDF5STObmd1i/1MtKeA0DTi/kZdeXnOXosysbY7C0ln/Xa/MB4ArStntckRXUJ9ZDYTGxMGy9umMZF7x+hhHVuV9RWpMmOZVRIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=oth-regensburg.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DB6PR0301CA0014.eurprd03.prod.outlook.com (2603:10a6:4:3e::24)
 by AM0PR10MB2452.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e4::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 13:22:28 +0000
Received: from DB5EUR01FT027.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::50) by DB6PR0301CA0014.outlook.office365.com
 (2603:10a6:4:3e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 13:22:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 DB5EUR01FT027.mail.protection.outlook.com (10.152.5.1) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Thu, 3 Mar 2022 13:22:28 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Thu, 3 Mar 2022 14:22:27 +0100
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 14:22:27 +0100
Message-ID: <c7480ba6-de4d-af7a-d325-6d144f10d59b@siemens.com>
Date: Thu, 3 Mar 2022 14:22:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [EXT] Re: [PATCH] README: arm64: disable ITS in qemu cmdline
Content-Language: en-US
To: Stefan Huber <stefan.huber@oth-regensburg.de>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20220225142929.385616-1-ralf.ramsauer@oth-regensburg.de>
 <33cd5f6b-5735-e8c0-b161-9ced86292b29@siemens.com>
 <40f5570a-e545-9968-1c15-972a9fd9b42d@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <40f5570a-e545-9968-1c15-972a9fd9b42d@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84e21841-f3c2-43c2-d4fb-08d9fd18dd59
X-MS-TrafficTypeDiagnostic: AM0PR10MB2452:EE_
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-Microsoft-Antispam-PRVS: <AM0PR10MB24522D56222F236B53356F9495049@AM0PR10MB2452.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tKbk+2Uze5mrTk0Lg2SsiQb/NsHYLR8jAGEErALe2mDrZZKUMzdB0qOV+yqO8uQw/7uXfsN7I0S+ySk/PGWGtN5/EBgwwC6ABIhLPVm8tVXsdrT7hnvIygtDHat9/lJqT2AuWp4ypQDaltEcoFNHFQ+YP3WQSJaR0w3/6WFLiSGohrbsNg6c8/KDQGHNPH+nu0q83LTNkyMYj9YU5bHGPgFHMRn7/2MkWcMFjFc4A51BZcq+RftSCtUloE2Q5zGUMOQXVjeHY4IydPH9iNCbJSH7TP+qOofF/lby+1wfyC/+zriw+ojZcQbHf1GYb8pL7s7oYU5iWrB43fpeVsZFRjQ2ezW9kkKIez+YfHyq/KmjLI6qGHuLyUPpwY3hgbRc+FWapyHHslbPdOvm2dUFndQv2AVGP1m25e8QfBqiDWgE7uQjVvDbbbkntpJ1U0aZCGrc9tgDR4FzPLBopuZq2IavyxtzooG1qktbhFaaQjNqENJGsWLXnPj/jupmSO13q75oUOemXBVnVkBpXQA1kOtdCB5OP6I3CoZoHeI89upMlDnU+E86Hs6ax0Yf4VimSqwbqjYu4GOggOUP9ly2faetD0yau/Y13smZF4sOlgFB9x0YUDR1VGZJ+VPj+SGsDSYQyv5aedE87AGhUS2JzocjtNSD5ZyhW7qsWNyEyxTA+1H9/wyLse79hddAYtrCrM4ASqKQalnMakfVqMqzl6OhlGHubOC6l+rBEh1FY/9TtjJvR8uecSp6XoAa4bjC84Qp8Aai/I7dvMexdnjhfA==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6706004)(81166007)(16576012)(83380400001)(47076005)(82960400001)(356005)(508600001)(70206006)(8936002)(8676002)(70586007)(36756003)(316002)(44832011)(31686004)(5660300002)(2906002)(31696002)(40460700003)(956004)(2616005)(186003)(26005)(16526019)(110136005)(53546011)(336012)(86362001)(82310400004)(36860700001)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 13:22:28.3626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e21841-f3c2-43c2-d4fb-08d9fd18dd59
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT027.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2452
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=nUOS65bd;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0a::62d as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 03.03.22 13:32, Stefan Huber wrote:
> On 3/3/22 12:57, Jan Kiszka wrote:
>> On 25.02.22 15:29, Ralf Ramsauer wrote:
>>> GICv3s in recent QEMU versions have ITS (Interrupt Translation Service)
>>> enabled by default, which Linux will make use of. We will crash when
>>> trying to re-assigning a CPU back to the root cell, as the root
>>> cell's Linux will try to access ITS regions when powering up a CPU.
>>>
>>> As we don't support ITS in Jailhouse, disable ITS for the moment.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> Reported-by: Stefan Huber <stefan.huber@oth-regensburg.de>
>>> ---
>>> =C2=A0 README.md | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/README.md b/README.md
>>> index f1b0cbe3..b5937300 100644
>>> --- a/README.md
>>> +++ b/README.md
>>> @@ -365,7 +365,7 @@ Similarly like x86, Jailhouse can be tried out in
>>> a completely emulated ARM64
>>> =C2=A0 Start the QEMU machine like this:
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu-system-aarch64 -cpu cortex-a=
57 -smp 16 -m 1G \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -machine virt,gic-version=
=3D3,virtualization=3Don -nographic \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -machine virt,gic-version=
=3D3,virtualization=3Don,its=3Doff
>>> -nographic \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -netdev user,id=
=3Dnet -device virtio-net-device,netdev=3Dnet \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -drive
>>> file=3DLinuxInstallation.img,format=3Draw|qcow2|...,id=3Ddisk,if=3Dnone=
 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -device virtio-b=
lk-device,drive=3Ddisk \
>> Good catch. Is this feature flag understood by the recommended QEMU
>> version, or do we need to lift that lower limit along this?
>=20
> The flag was introduced via commit: ccc11b02792
> git describe ccc11b02792: =C2=A0 v2.8.0-1634-gccc11b0279
> current README asks for QEMU >=3D v3
>=20

Thanks for clarifying. Applied then.

Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c7480ba6-de4d-af7a-d325-6d144f10d59b%40siemens.com.
