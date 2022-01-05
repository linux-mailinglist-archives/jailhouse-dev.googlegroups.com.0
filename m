Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBWHK26HAMGQEQOP7XNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id A94C748595E
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jan 2022 20:45:29 +0100 (CET)
Received: by mail-yb1-xb37.google.com with SMTP id c5-20020a25f305000000b0060bbdf755f7sf596647ybs.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jan 2022 11:45:29 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1641411928; cv=pass;
        d=google.com; s=arc-20160816;
        b=uoBfHsnVFqmpTZnStLIZuEr/6JQji7ZmzuO5pyTiDTbefjIEoVMMO8DBRklZMcSSF7
         r2rQHhZpUsWk8v0N+tSEjRjenHh3RRQTBOYhnNDVoKUp7GydQCQIT1l3DoK68I9lHTud
         pdBd7FoM9cHrUf6Fsrg4wEJveU3szkFrKg5aEvFfHkbFijv2MtwE+XPx7OT2ZAZ9zNeq
         +/ydxfeAoi0n+XMVAady6cK3icOGTXi/CP4VqXIGV3y6PBYTom/ltk7OOLGzhP1sskAH
         AbfjSTpunbYMC3kz9T93BkuQcWxR6D5/PeNhlhrfAByDbnW/sEONZyA7Ajv26EEtROhf
         4NLg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=wL0h1BJaoK4OajtdgJ0zXvzMlnEdGhndWEWDS7954gw=;
        b=tRs+vfpq7ahjzqHOnaHp8t2LAWZCyjRGZWz4LmzVhf2I9qXSGdq5umDzfU3TqtJoIM
         v/Zpt/RYRbqwm/VK+Av8n1UC4B13CuwAnTqri2K2c/QCGjgBgTWvJN9YVvxeMjOtewUH
         OzneXCQBZ0TZffkHqMYdgFSc4JY9t3F1nRhgeVozvaqnCypOeKqwpEYJTrmdlGtgyLpU
         DdsrrRlrrEGWMiheYaXtOvEiCiv6iuRVXTR1UGQc/nBMxVKes3l92Y7skQqbaGPSMwOr
         rmebfByi27op8VTH9XtqQBnTUyb4LT76vAsr2Vz+q3IPFCNd2NJN3KmDtk6NR3YfGoZc
         vF+g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=RxIW89ns;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.0.41 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wL0h1BJaoK4OajtdgJ0zXvzMlnEdGhndWEWDS7954gw=;
        b=gXxLwd5JXec+O8BEIjAn1khqHMvDwnaN49e2j6Ef1N0FDM9zCuTGEyjTyj5I9eLIh1
         JhIXYzMGCFt0SYW7iUISk0M9EFpxBSkVjO8UCjTHDemugxTPf6CbJQqUdmkgmcxUia/g
         Rntbyxd5ETymAz6WHSEv8Xj7WhrYo0606pjiwuXAAAw7b+fo6Cqii8Ic4Wyv5/LGkuMF
         /xmTkNbLwN5pRKlbxZpPmjaag11nYds2hjEEXfPSI2iUDSefxYLSwF0TDHGx/fiaqa/F
         Trxn65rnvU17Xswm7MVDo+1AgDbBdxGWEjcDXqZZSU4ZA5VG+a4IzvmIALLWdanUHzrq
         rYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wL0h1BJaoK4OajtdgJ0zXvzMlnEdGhndWEWDS7954gw=;
        b=evpsREsL708mDiBj2L9znQI1vjYaIeCLPyC1AYEki353Z/fo6NmCvx82rychj3xHX9
         sV/Fnt7lmy+qAUxTcZ2VakSIasxmwpV6ug8rpvVA8xEyf6+NjwGgUDZDV3EKFHOof0tD
         bWDTo5XDdgx7rdt3FpxFuB2h63KCgwLoW2Esv9uJ/+6cVjL2GakDs/MezvGXxO4/xwRg
         M6GD191W6kYO7FmPs1rUjHzvoMwmtI3B3HMAYIQrboHIwywvuOMahuYaACwNKvo6BuNp
         Vs4tsDMjaj0/kVEJuxRPPRLahOQix/s9UADeqsZtIqVk6fUCKaeS0T1frb+/p3jOLwYO
         Y79Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530MxhpoAYvsgcgEGbbFNvZBCWJ4+SpMGVvp66mmxiycrLd6VbCe
	2fG+veiv5GiEB//reTCBLeo=
X-Google-Smtp-Source: ABdhPJyvz0kd2/4FM7jhI2+/11io8iv5zxXjKJqJQNIVG5lTWEy7b4q/lVNc6nNsVU6D//mi0JDZNA==
X-Received: by 2002:a25:9347:: with SMTP id g7mr55966046ybo.255.1641411928460;
        Wed, 05 Jan 2022 11:45:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2207:: with SMTP id i7ls6255379ybi.6.gmail; Wed, 05 Jan
 2022 11:45:27 -0800 (PST)
X-Received: by 2002:a25:e047:: with SMTP id x68mr62272089ybg.724.1641411927078;
        Wed, 05 Jan 2022 11:45:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641411927; cv=pass;
        d=google.com; s=arc-20160816;
        b=hXnd8LZJOv1c90U3yDZjjfyXWS+G8+fb1i33GcR6vYNrGWxWU4dH2ecV6538iVXD8k
         SHDkYh9l7HqJ+mPy1eNWSkLgWvNJx7IB2hGmaAbCLZ8BcrGKdMKX9yqDq3ssWPBLPedd
         PrvBRomWtSC2RYNDBMkjbOGzezj8PBPh82jUTuOczy4yCjT969jjZ9bxDJ845gBKU3fy
         2yXE56y2ceXARrDr9RAj9kDY0tKGqswZTPtxXmFXyyvW0Zy62QxhzZEiAmbasROQZKSw
         MTGep9k1gsLuBrAjpigYxUfUWtTMt0mIAdDUAwUbYLvzUpWue4Ui9ul2au8EYaj3Vcm+
         kQvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=O/Cvpcvhb5nD5jXJ845EMrUXHZHLCVexfcKOiDUGGeY=;
        b=RCW4KCpm3N9Ouql7m02CDmgfkI03y7+mooDyypThh2iaGCKwlmTxr1CzdnZDHq17Ln
         eIRXAWYw8HpARwXVyN/zNb4ZPqsVoYsH2DRCbKvBNUmG+hlbUsx5J6KxSKNTbSV9jQhx
         oILyZ3PLvuRyqHCjg6mYpLvE5F2DggL3L9aMSKpww57QzJf/jsUWxgeWA3kecJvTzm1j
         sPFtxOrQONyaHn2xjSjvh+CrDUA3O2F8/4l42UeLzjkd+7aPs7Hv+gcQTnnn9s/9RRDB
         HNh3pkN1+Tl5/8EUa2CcjQZOWIb1RFDqEbS2JdNSUrZriVu3s+sk4G+TjIEmWtlX41vX
         jPCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=RxIW89ns;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.0.41 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00041.outbound.protection.outlook.com. [40.107.0.41])
        by gmr-mx.google.com with ESMTPS id r7si1658182ybu.3.2022.01.05.11.45.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jan 2022 11:45:27 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 40.107.0.41 as permitted sender) client-ip=40.107.0.41;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKZal0KzY0pEbjidxBs4ROsAXwOItmilMybQVQUGLO43kAC0gyoYQuNHd1mK4d4SKqSTbkLmGpM+DPPmqz3vWmNkE7Ys2Jc0aFiZB5XnsuHJKFv58PlzZJUU3hj72VWA3IkzhXt1MdbqgazGKJhfI+F7uZ8vNAkHZwB//6Y2N5DU5Bv9YhsBD3q65UU8uFM3AZZ/S+fCgPiFfceFzC+y9AD5wOJkjZd+F1XgYJmEYjWo7yvmszwy0jrstEIgHEcb7GpgcTPD+SfgXO+ukeIG/s2JZuESArZLcOqdqmBma2l68e3soBOCJZ/DnFQdGJeK/yAyklniPezb9eDO472gCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/Cvpcvhb5nD5jXJ845EMrUXHZHLCVexfcKOiDUGGeY=;
 b=V89ZMZdbQsu/l7qUgZK7YCHIV9i6t+rAL93t3r1112aq10Oe0qU8Mgo4N4t/7oh00NBzbXBFp0TsQY9mNyah/0H46QyMG5kapg1o755dI7zwUcU1X+QBskUNE19IcfAPfsIwzzcJYVLRkAA/gAyeVrmRulNCzI8xdmb4h84s8T7SXwTFJyT/3kU7+3fTmR/fmwycmW4FBp67wy4p/sTEudvv3H2bfpBaJPbYPHIL/zJYk/NOzIbMhcxwlFeZGUnfd6lIEp0PYLYhZG0md/fnnfJ9W98L86Jn/LxNZprR31hjCLJJvl/nDvBSHEPKJGyLpJ1mhpQVm0ECvvXmV5yRJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DB7PR03CA0076.eurprd03.prod.outlook.com (2603:10a6:10:72::17)
 by VI1PR1001MB1071.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:65::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 19:45:23 +0000
Received: from DB5EUR01FT034.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::fc) by DB7PR03CA0076.outlook.office365.com
 (2603:10a6:10:72::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Wed, 5 Jan 2022 19:45:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 DB5EUR01FT034.mail.protection.outlook.com (10.152.4.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Wed, 5 Jan 2022 19:45:22 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 20:45:22 +0100
Received: from md1za8fc.ad001.siemens.net (158.92.8.107) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 20:45:22 +0100
Date: Wed, 5 Jan 2022 20:45:17 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Moustafa Nofal <mustafa13e09940@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: HELP
Message-ID: <20220105204517.06c9af0a@md1za8fc.ad001.siemens.net>
In-Reply-To: <022d5f64-8a41-4128-9349-1f2d82b8727an@googlegroups.com>
References: <53464ac4.9478.17879314390.Coremail.caohp19@lzu.edu.cn>
	<20210329104747.2f396831@md1za8fc.ad001.siemens.net>
	<022d5f64-8a41-4128-9349-1f2d82b8727an@googlegroups.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [158.92.8.107]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d09d578-5769-418f-5887-08d9d083e9a1
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1071:EE_
X-Microsoft-Antispam-PRVS: <VI1PR1001MB1071F470CA6A5D7E168C8C00854B9@VI1PR1001MB1071.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PETTH0UGokYEE4b7RUlSndtZuYM14IBKX1ZfqNmjAPgGON7p9lX+Pvq38Cszkmg/oxUaJIiVYafZla4FdSzqb4PO70j9Kf8l3+zeVKxCjC2FyX51WHiV8aqMIgeWRe5RS+xA9IWIAQNaJSNeXuYpnFBe9GPxaAmnvet7/EzPROdQjFBJsheDxTkomGTsLHmNPxiEAIhB5k44agzj8wMhk61IC+sEOcUkABhjTC+WiW2pl1S3POcWvH2hEfLD9O4peSI4ACKyEVBEjrx7RRMceAxO2YMcDv+uf2gxW2gNFCXnVb80Tfql17jbLucPydz9gHWlsvEIgpB82CoYZ7Av5kZoD9qc6C887UHyEhzpQ+7LAav1fgd6ehJZpxlEEOEKKI3kCHmIUkfJ4KJSssqdnjVRCKvrmefRRSHBZOSLTLVNJzqO0+QZ+CiruyI/j715siQGlnBJX+/SoTc6vpuMUx8/Hopb5k4PpykkmZcU7j+vBrpIFzVVLZbpog0OpZDuxHuq3rkZ/5AeoRKs+Kb2W0Heo+wTMR6vVjpxq84Qf24ZeXcWnlZ/ts4nNCedn05OeAL6Me+u5PEA3xZb51Yw95QwStLL5gyhKVVxS8HysGRZ+monj0/HrfaS6HsEXnfu1seZc5S49SFeYgt4qSOcDPyMI7IdIAjuS1s709QxY4InLj9Z1sC12oz1KGttUysAMjneGO/J9YyNCgycuxwy5uYD+R1vXA3yy75FrkPMid19LqrCkZIc9pLnVF9MbEbyYckrGPBZi9I2DkX/0kzTHtdisDopmMJgCGOABQb2u9mP3cnuyJSh3gGcLBfEcapRyv9kxlWahbMG3BoUkNk/CT2zgjMUGML9yCsnZ22rITsfjXdWv0IQ1OwReLCJ8Mq6ziroL6NsAbtWvFntp3C0MfCpNEnMxg1KvC/+npS/ECc=
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(4326008)(2906002)(6916009)(186003)(16526019)(70206006)(7116003)(7696005)(44832011)(8676002)(26005)(6666004)(83380400001)(86362001)(70586007)(956004)(336012)(3480700007)(47076005)(82310400004)(66574015)(82960400001)(508600001)(36860700001)(5660300002)(40460700001)(966005)(8936002)(316002)(356005)(55016003)(9686003)(1076003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 19:45:22.7813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d09d578-5769-418f-5887-08d9d083e9a1
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT034.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1071
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=RxIW89ns;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates
 40.107.0.41 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
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

Am Mon, 13 Dec 2021 01:31:01 -0800 (PST)
schrieb Moustafa Nofal <mustafa13e09940@gmail.com>:

> Hello Mr Henning
> >If that PCI device is of type JAILHOUSE_SHMEM_PROTO_VETH=20
> >and the cell has a driver ... you will see a new ethernet interface=20
> >becoming available.  =20
> What do you mean by "and the cell has a driver" I ported jailhouse on
> both 5.4 and 5.10 kernel using jailhouse patches. And added ivshmem
> interface but it was not working.=20

Cell has a driver means that you took one of the "jailhouse-enabling"
branches from
https://github.com/siemens/linux/

You did set CONFIG_IVSHMEM_NET for that kernel.

You did configure your cells with the respective virtual PCI devices
and memory regions.

Best check out https://github.com/siemens/jailhouse-images to see how
to plug things together.

regards,
Henning

> Best regards,
> Moustafa Noufale
> On Monday, 29 March 2021 at 11:02:57 UTC+2 Henning Schild wrote:
>=20
> > Am Sun, 28 Mar 2021 22:16:14 +0800 (GMT+08:00)
> > schrieb =E6=9B=B9=E5=AE=8F=E9=B9=8F <cao...@lzu.edu.cn>:
> > =20
> > > Dear sir:
> > >=20
> > > As we all know, the cell could communicate with root cell by
> > > ivshmem in Jailhouse. And there is a virtual Network Interface
> > > Card(NIC) on non-root cell. When I run Jailhouse on my raspberry
> > > Pi 4 model b, I was successful to create a cell and assigned a
> > > address to it. The root cell can communicate with non-root cell ,
> > > I know this is based on ivshmem. But I want to know=20
> > >=20
> > > 1. Whether the virtual NIC support other protocols. =20
> >
> > It is a virtual ethernet connection, on top you can use anything
> > that can be done on top of "network". It is probably best to build
> > whatever you need on top of Ethernet, maybe nfs, remote desktop ...
> > but if you really need a custom protocol at the base you can write
> > your own driver and choose another ".shmem_protocol"
> > There is ivshmem-demo giving a simple raw usage example of
> > JAILHOUSE_SHMEM_PROTO_UNDEFINED.
> > =20
> > > 2. What is difference between virtual NIC in non-root cell and
> > > NIC in root cell. =20
> >
> > There is none. Once running under jailhouse a cell might see the PCI
> > device for shared memory communication on the bus (depending on the
> > cell config). If that PCI device is of type
> > JAILHOUSE_SHMEM_PROTO_VETH and the cell has a driver ... you will
> > see a new ethernet interface becoming available.
> > =20
> > > 3. Why the virtual NIC cannot ping baidu.com(in China ) or
> > > google.com. =20
> >
> > You essentially have an isolated network between the two cells. To
> > connect the inmate to the internet, the root cell will have to
> > become a network router. So you would set up i.e. NAT to connect on
> > layer3
> >
> > The most simple solution could be to create a network bridge where
> > you attach the real physical network interface and later the
> > virtual one. (in the root cell)
> > After doing that the non-root should be in the same Layer2 network
> > and can use DHCP to get a network configuration that will allow
> > internet access just like the root-cell has.
> >
> > All that is basic networking and has nothing to do with jailhouse.
> >
> > regards,
> > Henning
> > =20
> > > If I get your help, I will appreciate =EF=BC=81
> > >=20
> > >=20
> > > Yours sincerely,
> > > HOngpeng Cao.
> > >  =20
> >
> > =20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20220105204517.06c9af0a%40md1za8fc.ad001.siemens.net.
