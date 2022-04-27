Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBC7BUWJQMGQEQEJDKIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F7D511C61
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 18:34:20 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id k13-20020a50ce4d000000b00425e4447e64sf1268371edj.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 09:34:20 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1651077260; cv=pass;
        d=google.com; s=arc-20160816;
        b=tVkM0kzWRjLeGhC4QOTcCAhmlo0bUFTNYoWM/k5CLfkCo4uwjlLCVh18RSzsuyAEc8
         WJdcBUGIthp7FX5B/G3nvI0qkz4DActHBlFi2UlMc69eQPPpMjtcRomnsMbOSeo6zMlb
         gDY7oGRcSRt0mqonyT8CYmQVK6em+E/KnaPrAxStF4Y6rEK90hNtxzi5Mf28a+/OaeMu
         /errS35jvsYzlQbbPS/qRittDkAqlHiRYIgoVXuADgpNMtWMBi78djdzIxZdDVZuClQt
         bA3DhU4LaMC/0SX9UmpE/cw0ghrvHPjvKYGyh3vOyI7093xGK9ZLAWv4QooDKKD1WjhK
         JDfQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=hec/TZ/CGOOrK4y5JMoNVJt10o1W3kpY7TdxsKjBCPM=;
        b=CmH+HttuWpOTot91dW7fFMOqY7Twkfw7HEyPaHTVY0IM5nWCtp8AQ2fcnk0ehh3hV8
         UIN7imgihEE8hnPWgnKPrhZPnPiF6LJcohShEHyg/tkKL4i4zRByBF/Naxau1rnxd+C0
         KpmoK4NzIOZBJF51BIl/WlyM2Rye7aTWwZsrRxhkCODnj8oQeqU7GQX/yl5ALH28xJSe
         CbyVFwunuYE1B14retAqPZQp1flV0BrC+dLYVPMNpuCI1ZiZojC6I/GxU+kOm5GWYlxX
         fP2JyWzJtjKB+jRZ6OGeGilsYHQIpQRxfKF1EmC66uDwLnln8tLBJM/+h1JxKLkxQQEY
         6/gg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="RpP/AUi3";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe05::618 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hec/TZ/CGOOrK4y5JMoNVJt10o1W3kpY7TdxsKjBCPM=;
        b=tsazNE2vRQtDzQDSuRZsaFf5BUTgYqX9XmM1QacK3Ynfi7vDstRPXoAiD3EEVgFwXo
         XS4K59JJLhcryNTIU5k/NLajHx0yY+lVWV+2uMQYnyEthjEXmyMYAMfeIjyk4rB8wfPK
         iscvqBIMAzdrNkSkGiQ/qgPF7iAvITwMqtDGaF6DLN8hUQv8cjOTXxleBiW03rLoHs7o
         m9jLCZqaNk4AmUVbEc4tGzP5BgMIkombK8Nli8o85aNadQXiUMZvrLUAY/W2TL/tzPz0
         j4CqG9aNSL9k/tM2eMMcSgr16xacVeugBrkLv14f8n8iRfkfJGdfiJ5QVuvw3nTR/9bc
         SWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hec/TZ/CGOOrK4y5JMoNVJt10o1W3kpY7TdxsKjBCPM=;
        b=1Pz/j3EM7d502MZuJ/2aiXNMrZcabogCqwWm0/tkGx16haMM9n8jBxvnXcaI8QQkZ3
         NEgUIWbWP9pVW7m/4NTSSKN+nzSMsRdRULZf8mHgp3OlGAPVach4tokdNQbeEf6ZSQcb
         2DgUuGMDkLOJYZyXeSOuyKbeHuHz0bXhzcSmcRQqRIxfA7ATzI9kAvp70ab1xYFUcw4p
         FMESn/kCzK+ZQoGHFLCWoYJu9L1YSvoqz8G2ptiBRzqKhYM60sgmCZzYb0jG66fTvJbD
         PKnE6OGJHv6XMGbtxdg97qYPcIpDkvubLIr1SX570K1FE72bj6lpTtOpVD02gkeyFQ6+
         nP8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533HDczmt+7ywQqKZqh2RG0VhWNjH6yyVntYlvOUsKjQTTynns2f
	cjjzHv/reQK/tEF9cMbxKiU=
X-Google-Smtp-Source: ABdhPJzWVcUZkNtB2uL/X6QTIH1h5/eTGVmGTbMUfgrcGKuIiGlwiaqo7xqtTDtZdMtxjMF0qXxPHA==
X-Received: by 2002:a17:906:9b87:b0:6f3:a51e:80c9 with SMTP id dd7-20020a1709069b8700b006f3a51e80c9mr12296228ejc.362.1651077260372;
        Wed, 27 Apr 2022 09:34:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:2741:b0:41f:7eee:e393 with SMTP id
 z1-20020a056402274100b0041f7eeee393ls4624618edd.3.gmail; Wed, 27 Apr 2022
 09:34:18 -0700 (PDT)
X-Received: by 2002:a05:6402:254e:b0:424:244:faf with SMTP id l14-20020a056402254e00b0042402440fafmr31301105edb.260.1651077258811;
        Wed, 27 Apr 2022 09:34:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651077258; cv=pass;
        d=google.com; s=arc-20160816;
        b=PlnGszhSqBN8WUwQ09AlHHY4f6J+r7NfraMRu2rbKVuHBbR5GwekWt1a/i9fYIbIEM
         Qae8S+PAtCjGEojTvJ9sg7cV1UvwOVlvbFTGK2N/XKwNHAlpIYkUcAySkVms91WWY5lq
         0nQnydiLdZo0qQ+uj31R2KMA5YGPXQHoYV5Z02ZyZtahBdbk9f6QMcNcITh/X04VLJmt
         toeF8vzP675F2QEzJ7x0MFoxi0nrhRBcbgpfprIVEqzQj+dYKxrPft2jiKNWTijTxDga
         9ofEgtPRKGzRQIX5RFkTDprCNCjtSxCPUJv6IFrK9XgXEkOCOvPkTbarNC8rkJYv+spY
         AF/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lVgkMsNrWQ3GM24d9HgvV3e2NgYh050ymRuxlx3a5Ec=;
        b=HLs2oPnin3W1kxziJ5eezreZmEZOC3FljbJwZic0G3Mw/dCXLaZ5xcWlsv/ilskTi/
         fqeOGkKJRqxNa07/K47s4WJqrjx8oQfJS2sLnZ8Q0Re9LNoEMvS+FMSJkjtZ88diIjST
         ehic2qRUUDoMbNUBD5A1JPyD1xvay5BChnJbmMEMGaRf9iPgvdFXoxO4OJfea7Ekigmz
         5VZ/J4ez6NK3XUL7jsJLWWqyGbiAkVkjuDT5C2Guon7or6sWEdO7OhAkihNUsD2wx2lL
         iL+RIL6Am9PamI9XWJ6mxSR2KQv1xZkcbV4GwuSISnY1eKv72wXTPNuIkIgbxgyd1sBU
         JeZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="RpP/AUi3";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe05::618 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-he1eur02on0618.outbound.protection.outlook.com. [2a01:111:f400:fe05::618])
        by gmr-mx.google.com with ESMTPS id ca7-20020aa7cd67000000b00425b0722545si103550edb.3.2022.04.27.09.34.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Apr 2022 09:34:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe05::618 as permitted sender) client-ip=2a01:111:f400:fe05::618;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsdaY3lr0r17H0rC6KyzbBwBG+FjpppEqKRGMnAkvqsccagUrEtoYi8O9cZFVOUcDUb2VCqSB/GzY0TYLPUvzo3hhUD2VtXhEc2CpqLx8L5grKHVpWsBj0IyQgdXYE1qyttganKKZ5E2kx+iYnQi0fl1gTcqztUjJXRumD/O/39aP1pjGowHQMEBenKCKpt9S9u127Ae+FR5Pvd0dgv8YiTLylF/1FppzurVO4TTzql/iIANvPbnTIU3k5WHmiTQwsSzc/0eWXT2nJ7LY8qPzSlaPpT9UT9MPiMFmDPPcjLCGibXtle/KlBXG4guSHqzB28jlZ3Ro2sFplvpPbkXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVgkMsNrWQ3GM24d9HgvV3e2NgYh050ymRuxlx3a5Ec=;
 b=NFL7WNr1ykCHa7sFEZxhxe+oCDJ4BsRXhbJis85LDpX5cg6l5ALnZa/yXvc9Aezt6EaTW8QlUV5cNb7ozBQgPH+l1ftb78jmXGHGatGcxD3JC2Szz9V/3fiD8zePGSMnyBSARVoGLsn9zTqZaV3BBshxCTz+802wl7HmkO4utare6CutZDbrdXn8dDxJpdRXbjp/5XQZFySoLH7GPqJgTc8FJLHaRUVj60EOjvJUS4q3kVY7vj61qOopH7ABHIbdCfBgoAILK1dKSxVkmdsTy8rJR/eWvjRLoAmBEitIN4Q3cvN/eiBWOvy9c88+BWmQtxyF6b0vgIO+sOwCTp4GZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=oth-regensburg.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AS9PR06CA0345.eurprd06.prod.outlook.com (2603:10a6:20b:466::7)
 by AM4PR1001MB1331.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:8d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 16:34:17 +0000
Received: from VE1EUR01FT012.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::52) by AS9PR06CA0345.outlook.office365.com
 (2603:10a6:20b:466::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Wed, 27 Apr 2022 16:34:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 VE1EUR01FT012.mail.protection.outlook.com (10.152.2.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 16:34:17 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 27 Apr 2022 18:34:16 +0200
Received: from [167.87.0.81] (167.87.0.81) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 18:34:16 +0200
Message-ID: <179b997b-4830-fb3b-792d-79c25fb39788@siemens.com>
Date: Wed, 27 Apr 2022 18:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [EXT] Re: [PATCH] driver: sysfs: Replace default_attrs with
 default_groups
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Stefan Huber <stefan.huber@oth-regensburg.de>
References: <20220426172222.1910982-1-ralf.ramsauer@oth-regensburg.de>
 <c2c4c771-6772-9511-4b47-49e2473d5531@siemens.com>
 <2e24bb64-4111-a75c-1ed2-c79a717b5500@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <2e24bb64-4111-a75c-1ed2-c79a717b5500@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.87.0.81]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--17.875600-8.000000
X-TMASE-MatchedRID: AQ9SOYvqpDY5QaOxwNGfvo9bHfxDWoibR9fQDKDdQ3cSEYfcJF0pReqh
	uTPUDQDt0MT4bYTRBTdIPDhB+IjkDc4ymjNl6z5PuNcow2BaEoiCrALIB9jKZtzeRUM2WkV7AQ8
	mtiWx//oda1Vk3RqxOEAc6DyoS2rIj6kCfX0Edc48yTEHRf/stGi8YU2giSiP/1dEgwtQ6NCOVG
	ny5q72hg6QlBHhBZuw7nlnMJDXl1nCfvo3UgFFJOSOkVbqE3osn/ux8vMQXzW3RxL+7EfzsCIk3
	dpe5X+he+xt+hmLFRPx/hK2QE5rfr6qhTbZa5dPgHaw5VXiALvDmsS2PwIow15hVZTm4dD8DKvL
	dahoIESbKItl61J/ybLn+0Vm71Lcq7rFUcuGp/EgBwKKRHe+r7VZecsfsKv7oWJBOGCxkY5yojz
	CQd1Xvw15YxmyPvnnFee3kAoM9Pk=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--17.875600-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: F418DCE3591A4FCD696713D5FCDA82185D8FEE1943441A8BA5B65B57983F6AB82000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb8260a7-2d96-48f1-f2c5-08da286bc5c7
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1331:EE_
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-Microsoft-Antispam-PRVS: <AM4PR1001MB1331BFA914F8C9F0AD26C6ED95FA9@AM4PR1001MB1331.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M748JsdJ7/u41UrAa0dq7GKFiMQ5g1n7OdDCEr+wiZBpAMNq+MLlrY+SKMl/zX3VyNFo7uZIt2rRBkhTr77XRRWzziy15A0dV9KeIysOryQD2/2qxpL4T64w4cV8FKjff2+e8F2jfZ8wD5PLGG61Q2rvSiDTq960xRinsSxQtR1dzYUxuIUdaLM6s30SQi8ac9aAe4l1M4Hd1Xa3oZir5qZQtSJXJfef4tBcwFHnKI29VVYltg+q7uvhU5k8WsIH6qWWC8KGVkF0PNEKgKqKwMCzFMW7EB/kPuMVEx1RDmmSFTZuUWANV0kfVfXUaFEKJeSi9yJaWtbtPO7kwgLw+5wwRddzSLuR2LO+BYY47KlvG+555mzMFo3gEo3qSKRh+xruIGT7h2RlbBQoZvaI/RmeRYHyEsZ0oQW17+OPzQIPoUl3GX6A+j5FHh3yyUmg2RuR9H67WqZyf93J3gn750SpwseYDBlJYsG8z3c8igLUuARpgjpbVf4wa94fh+wd8fZGJMwD6qU6l97dHBF2F3zdu63CaZQHj0gJd3dGwT4tNzmqvrVqThpSIoahpDnxlw3Riv1w0cX43MhTDko67sgP6U3mrePht8nXaRMoVWT1KxwpsaNXDtQT5M/yrJdN1+AGYDw1v5GLsxuN9sWwmqk/mfvE/pdS4xVOdkOmHH82gAXwMcDT9KawqAqXgBjYUI/Vb/xAVydRd4XAA6r92FDDMb89iF85xt66qvnakg9l0qaWFVuL7ua+MjUD4E3H
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400005)(36756003)(5660300002)(53546011)(70586007)(316002)(70206006)(7596003)(2906002)(6706004)(16576012)(110136005)(82960400001)(508600001)(8676002)(83380400001)(31686004)(86362001)(7636003)(356005)(26005)(36860700001)(44832011)(8936002)(40460700003)(4326008)(186003)(16526019)(336012)(956004)(47076005)(2616005)(31696002)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 16:34:17.0704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8260a7-2d96-48f1-f2c5-08da286bc5c7
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT012.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1331
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="RpP/AUi3";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe05::618 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 27.04.22 18:13, Ralf Ramsauer wrote:
>=20
>=20
> On 27/04/2022 08:26, Jan Kiszka wrote:
>> On 26.04.22 19:22, Ralf Ramsauer wrote:
>>> Since Linux commit cdb4f26a63c3 ("kobject: kobj_type: remove
>>> default_attrs"), the deprecated kobj member default_attrs is gone. It i=
s
>>> replaced by default_groups.
>>>
>>> default_groups is available since 2013, so simply switch to
>>> default_groups, without (hopefully) breaking any older kernel.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>> =C2=A0 driver/sysfs.c | 9 ++++++---
>>> =C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/driver/sysfs.c b/driver/sysfs.c
>>> index a604afa4..f91d5ac5 100644
>>> --- a/driver/sysfs.c
>>> +++ b/driver/sysfs.c
>>> @@ -180,10 +180,11 @@ static struct attribute *cell_stats_attrs[] =3D {
>>> =C2=A0 #endif
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL
>>> =C2=A0 };
>>> +ATTRIBUTE_GROUPS(cell_stats);
>>> =C2=A0 =C2=A0 static struct kobj_type cell_stats_type =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .sysfs_ops =3D &kobj_sysfs_ops,
>>> -=C2=A0=C2=A0=C2=A0 .default_attrs =3D cell_stats_attrs,
>>> +=C2=A0=C2=A0=C2=A0 .default_groups =3D cell_stats_groups,
>>> =C2=A0 };
>>> =C2=A0 =C2=A0 static struct attribute *cpu_stats_attrs[] =3D {
>>> @@ -212,10 +213,11 @@ static struct attribute *cpu_stats_attrs[] =3D {
>>> =C2=A0 #endif
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL
>>> =C2=A0 };
>>> +ATTRIBUTE_GROUPS(cpu_stats);
>>> =C2=A0 =C2=A0 static struct kobj_type cell_cpu_type =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .sysfs_ops =3D &kobj_sysfs_ops,
>>> -=C2=A0=C2=A0=C2=A0 .default_attrs =3D cpu_stats_attrs,
>>> +=C2=A0=C2=A0=C2=A0 .default_groups =3D cpu_stats_groups,
>>> =C2=A0 };
>>> =C2=A0 =C2=A0 static int print_cpumask(char *buf, size_t size, cpumask_=
t *mask,
>>> bool as_list)
>>> @@ -342,11 +344,12 @@ static struct attribute *cell_attrs[] =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &cell_cpus_failed_list_attr.attr,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL,
>>> =C2=A0 };
>>> +ATTRIBUTE_GROUPS(cell);
>>> =C2=A0 =C2=A0 static struct kobj_type cell_type =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .release =3D jailhouse_cell_kobj_release=
,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .sysfs_ops =3D &kobj_sysfs_ops,
>>> -=C2=A0=C2=A0=C2=A0 .default_attrs =3D cell_attrs,
>>> +=C2=A0=C2=A0=C2=A0 .default_groups =3D cell_groups,
>>> =C2=A0 };
>>> =C2=A0 =C2=A0 static struct cell_cpu *find_cell_cpu(struct cell *cell, =
unsigned
>>> int cpu)
>>
>> Which kernel versions are compatible with the new API?
>=20
> With the latest v5.18 release, it becomes mandatory.
>=20
> I just successfully compile-tested v5.17, v5.16, v5.14, v5.10, v5.4 and
> v5.2 (the latest one that works). Latest LTS 4.19.y and downwards won't
> compile.
>=20
> The question is, if we want to demand at least v5.2, or introduce yet
> another workaround.

I think wrapping could be fairly simple in this case, and 4.19 may still
be used, and we actually wrap much further down, let's account for this
difference once again.

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
jailhouse-dev/179b997b-4830-fb3b-792d-79c25fb39788%40siemens.com.
