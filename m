Return-Path: <jailhouse-dev+bncBAABBKPZROBQMGQE6ZZGDZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E334E568
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 12:25:46 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id a29sf3409532ljq.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 03:25:46 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1617099945; cv=pass;
        d=google.com; s=arc-20160816;
        b=xvchIHqC3VV0iTT20ctMWtcFdpA1chAY/ifnnqY69R7FgQyiVLI/OU+wfm5Eo8yWD5
         8FeeSJVQHGbL2AMU3vk4Yhv0QA6Ux0g60PlKlxokNFUmeiJfTJl5ftgBc525K5qA54+Q
         +pjOMckXFhkW8xy/J+GVRZZ+BFkqh7vgV9IUOeX3zoF2OlkmiSYkZsrgsxjt6Vw0G0w5
         9FAijhC3R1jsWStV9texWfNB6C77zuahJ7Bq5nVOlpTeSXMF5PeloYZton/WdNcaXdeT
         W3y4dVCOKda1ce/3VhrWaCWfa4A4QhlAA2WsRVW478eQXcqxd91+/MyTf+u6ERTs1k1j
         cvzw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Kkk8TFFQ4yyy35ZE6XV/Lva2k+jlZo2+us88YPk7JbA=;
        b=NtQeeVq74Ok+Y3S3F5Ok6L53vn407f/1xLEY9fttqWW5tnsAhKhP1Wag90CX+y7EbG
         lFoSgIZW0UchzzIm/VMfRqw5B4sE98KMJX52BeHl5EYXJrNwUE6UkZGSe6wAEhgorx9/
         ieaTwoZjhyPJb/R2dOaNK3ZwGsl7ZsYYnXdUQt8gnJNkXN4gmV+GdgYoBZqc8IcQ/tgh
         NvEQC7KcbjNilplcgLZ0sHF+vNUdVhjBdzMfIPZssi58l2KwbajLIZj1P3XZ8BJLuT4l
         +y98o1n6fs1Xzz45i9VNKfv9+MG1lmM4JMDnBVyb/h7kMa5N+n5/6TIkrQTWk0CZG8ux
         vLhw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=MjRijzr9;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.15.55 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kkk8TFFQ4yyy35ZE6XV/Lva2k+jlZo2+us88YPk7JbA=;
        b=MW3QO5ZV/d9lt4C6GihVme38E5jb7TFkLFLd2jc9h4Oj007rjH+d7VYin9wOcR7Y5F
         y5llFQlA4kzOG/RE8YOAmi6SJmzz41rsb9N03NbjyKyFrJj3jXndKgZiazfXutmcbaiQ
         R4snosX5m5E6sT0sPvvZHFSSmnnv3LrDEbVyLDMlkbiP3Mey/x7SuwxBrAuGJMs6KEu4
         PGSG79jOia8DtzQ4QklEJsjlfU6ZOAz+woqaoB0fyJS3ok8qv6Bcc0adypvz/g7QBCyo
         iG4yyIw1GOWcjeAtJjFJv9GpqQ1CAaQ6Num0PMBPMUFLhmeDUeZGMfds8PcMxVS2SGr7
         s2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kkk8TFFQ4yyy35ZE6XV/Lva2k+jlZo2+us88YPk7JbA=;
        b=NSA0P3YoWvH+1yn+bpOaKyM19e3cD/9ZllsUj74vr2hjcv2ueeQRrmfuEr6MtzZjlf
         yxeeOB9omMH2GGu9x43hvussWpGcw++vIprh7GKIQHYwso0zBMnrsrrHsH6yGf3yPnpI
         w0fIgVwcByPTO5A1VRAR2V5yTWwF7uUq5jsHPu3HksMl9NYbES/LTcBscXdYZNAVb843
         4e3QQRoqJy+nvGbrU+62DUZoBLmaWLMkxNuuJcchiFW7bxaxA9jJqUpMMBft8NUDZqA6
         o1LPwThyzSQWuVeviiEoNbeqLKanD6g2ZiKYlentDDILO2o1WppNMEB1viewdkpxGy0T
         4Gyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530oj+ptoDJNlSTmtNVaJxiGvPpRfNdooSdehJoVqpDzOxcin3i3
	RipD+rwJFDgFeG+gJ93Sl8E=
X-Google-Smtp-Source: ABdhPJwSNj3a5oH+i8/iBvHTp3Y4NTFfzQFAnyWLCgD95zxBO3khwwr9gwHi3cbgjTby2XESlFYIxg==
X-Received: by 2002:a19:30c:: with SMTP id 12mr19414293lfd.235.1617099945763;
        Tue, 30 Mar 2021 03:25:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3c10:: with SMTP id j16ls3767643lja.2.gmail; Tue, 30 Mar
 2021 03:25:44 -0700 (PDT)
X-Received: by 2002:a2e:9e44:: with SMTP id g4mr20866567ljk.430.1617099944874;
        Tue, 30 Mar 2021 03:25:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617099944; cv=pass;
        d=google.com; s=arc-20160816;
        b=EjTrTD9CVjg/hDQry2RR6PWfVAbqiVnSyEsVXaVEkl6ehPhq2ukl8fKBzM21ZaHxnV
         hYChMayHJCKuziZNfWIrSZnco/0Dd1evoWgkQ0dSgcZy82e2CmnwfHOgOsvCq8EPb38i
         d0GressuhhfjL9lzT86ZXkzrUASpiMDeWPgAoW0kkxONk0o93mJSX+3qJdZsmyRdY4rN
         g2i2o5GNNPFSLNxKJwFgRTurZenKUUQ3SzVXKGZr0TYEOyO1rtuFEF1P3c8tGG5KSMYy
         QYt8AxzEa0XkYWhlDf76QGYcE2ymaaB4spNvSIlgnxMQNqfB3pjDYSO/iiwPpNe44yJU
         NMxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ss4Z3ahX2UmXupzU56QWEvMUsLbziliRYrNxluFxzko=;
        b=L7FxTz6rZtDn9Tz9a1jt78jS6N5lvufkQb54ECe9QmZLkgSqJYVWTVqkKqeAbnXxMf
         U5p+XshjywzpIdJlU3vEjIb28atwKKj9y+NaaQF7LbbfQ2aq7CGC+kUFxGafaFwT0OaM
         taLJD6ZdAnrdnSoCSXervBAd1sfjvXx+91O+XFmD/dWY3z9rPOotb7o5OE78VuXWTb54
         oUayYwrCngr3iLuhwh9oWk5sLHb/xc8fQRC1Tj7pohR7/cBCSF82G2eMOFwG9c9kS+R+
         rePYKvz84YmhwwX6Ly87PeAlQCSzJEWYoDh6N2H3UDFXZKhVw7CkHRc1jqe7n40NKYni
         K+vQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=MjRijzr9;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.15.55 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150055.outbound.protection.outlook.com. [40.107.15.55])
        by gmr-mx.google.com with ESMTPS id v203si844015lfa.10.2021.03.30.03.25.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Mar 2021 03:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.15.55 as permitted sender) client-ip=40.107.15.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dM1Ky6tBwy4VIgcp6fcU9I5vQV3hPvyOa61Mg96r8OiDZntUYUKfXaJ53IPoLo53zmxcFbSyPRAX6BgYmTXYZAhEycZINVOjbtIXqcHhpwmSRRw9Tom77fMP0qGY1VcrPbfssEW3Fo1+zxpGWtX0xre0AxIMhUmPbUpOb9klQr9PT8w39WBp8elrQgMCE3w9EXl/ypBvct+4KTt7ocfIp9clc+5wQTUYv+K+gLQFUNvmI09kd5mdJnY4l5T4KvAjCk1ZCmqsvPFo3MDe5zxtsadoZCYzltiGwQuYr392g9dkhee7FpDFMXiSdlAsbSYmnp32QjPKF4ztr8cjX0UfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ss4Z3ahX2UmXupzU56QWEvMUsLbziliRYrNxluFxzko=;
 b=DrP77H1NDupNSlkmyqrzksyeu9i9xc2tgacBTiILWh7VuSdgJTnqj1eQQ+kFiPlP0Um+NoLTBzMLXxo4OImnsaczR2UOETvHo0LIvwyMs/N/aLaD46wRB9oxlj46hrxcTzGfqCIxaFzkC0syTy0IYxJR3UvkLaGmQETifcIJUueHmLAbYwKMiV8QSN/M+bcXq7LfConrBm2we7aQ2AbmvygSCVNPY2Rqm5435TPe1ilwSFGFFqDiZpekqmE30c/0rlJtB6tAdg2OsAu3oZW761fgqd23jvOZrQjM8M+9hJXnuB7tgS7R+889gEvq1jZpxyhV35JOEE1bdkbf6hftkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 10:25:43 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 10:25:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 3/4] imx8mp: support virtio console/block
Date: Tue, 30 Mar 2021 18:56:57 +0800
Message-Id: <20210330105658.16676-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210330105658.16676-1-peng.fan@oss.nxp.com>
References: <20210330105658.16676-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR04CA0076.apcprd04.prod.outlook.com
 (2603:1096:202:15::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by HK2PR04CA0076.apcprd04.prod.outlook.com (2603:1096:202:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Tue, 30 Mar 2021 10:25:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5b89962c-103d-4cf0-86cb-08d8f3662c42
X-MS-TrafficTypeDiagnostic: DB9PR04MB8377:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB837733EA9AED567C476A2275C97D9@DB9PR04MB8377.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vO9BizsdpeTZPklNvZHAomj8zhrS3wbMv1AmaBT1D6q33KAm3JMXgf/H2b+7ZEXCUdOM0vA0s9Yfe3u7OofZuRorDr5r5wymWKIRPKBG2T3cDt4WXckWO1eoOtOVmUXTNBQrfBHPs2iY5DxAaWY0l5N8Iev+i68h6Q/tdyy1PFYZw2fD8f3TEYSjrfECMp5rVNYXuon02IP6N/3JMTrvIwmMHgSitFdc+hsULkJEPS6uZdn+eiI+ftoZZ7Z1FmoKkbIU5UsE/782h/yVL2Ms7isapfsiEIV7Rt+eGvsvQMyGsJoLFq5do6txXxjcpl9SPf/d8u23ZlrjKP82AAOPMkRsdOIpm3l4wS3QYC8o1xgyqektFdWn2+o0mNM08lYkGfRaApclQjAnR9Nqk/Tbtm6jko9TgdrDdmxCQ8UoXpqkFb9eMiHWvVY8NiVxLM9k7BXpQMpXxQObP7tHjMl2vFi3iHP02Mo+IqKNhULd3jGjAV/KXJ4jOL1vMEtdPYNOzd9rUq4kH/IgxCAHS0tfnAAFnSWt/mZi/xHcK4N5SrUk0AhBPHyus2N7qNblNPM34QwATIxJqxkJ8EnTq91v8r3h1IiOSQsZibLcmA94YCENqJVVetVJ+8YFNoxPYaf30XVIL6FXMGFO0qZSF1gmwykkHoOBte6MiHPnVDxxtp61kWEd8Sip5lc5OlbPyExd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(2906002)(956004)(2616005)(4326008)(26005)(186003)(8676002)(52116002)(316002)(16526019)(5660300002)(478600001)(1076003)(6916009)(66476007)(66556008)(66946007)(6486002)(6512007)(38100700001)(8936002)(83380400001)(6666004)(6506007)(86362001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yqPvOOR6IRdkWWRA0Q6h7fHFOUGHPCgBnzbVWCGPXcrbSz+LiV/rEOKDwDj2?=
 =?us-ascii?Q?E7JstYTy8y+cqcAdEwhDiXfDArT4BMu3I0K4K/NiS55ZwiZQCpcgny7IOOUF?=
 =?us-ascii?Q?3IhWT8bvBNAqaatIOQ3oUztXI5quokEwehf3+xJ4OUhzg5diSYfssbPhudbw?=
 =?us-ascii?Q?M/BsGyBKJ3p2sylJTnWXiLUA3lpSQpKPuObyz9qHmHtqLXDXd77kaM9AvaMt?=
 =?us-ascii?Q?QWNvGZWXXwPvgImUEfJNC319AUvbi1lZoXRWW1t+Ly3sGKFaImBdOZLBVLk4?=
 =?us-ascii?Q?vD0DDYineeZxQq0LyhmeWzEEoTtV4NY0Eajy+bogoZXk8yjW/eo8KEWl+Wpq?=
 =?us-ascii?Q?SJe9j2An/gJfD2H0HNS9uQggVxBVid3RMCm4lZrfAwsnSwcM0igjnhZ7N99e?=
 =?us-ascii?Q?ZQpaFzS8rs7KV4DdGyJkwRwK9aF7CYJqCyLLVxGPghFhkSw3RYTBmevNf19k?=
 =?us-ascii?Q?o+HoKVvrckfivd2Gj1pshP9KVQswYeXHhT5P5MpR7sqQ1ZzKVrUnPg8eigsS?=
 =?us-ascii?Q?G2Lu2xSe8WV+Mwbe2tojbP2lx+QCkeANQ87Y86HZf0waSDRhIBmNaT3yRjfR?=
 =?us-ascii?Q?49RGOceUQLZE36qe6ERvTm/cmCrGak5yK0PtvMa3NqQSoXZ/a5yvAYDnTop0?=
 =?us-ascii?Q?XmtmsgNGLxTmBCnmxhsozJP+0ye+iY7+ZeYEzv4bmsnr3+W3YDqT/Lm5Ta/Q?=
 =?us-ascii?Q?jPsqvHQRUm4blHubryBZsiR3++FGB6z35ZFzk/XZblk2VKu9NehRFIgQfgwW?=
 =?us-ascii?Q?6oww9Y6S1PyHHRp/deE7k21SuRkqQOqnpKZF5xm01zBGFT3Pa7mRqQAOpHNG?=
 =?us-ascii?Q?aowJOVPFwQj9DeCQZF8NPS2X7crKN/bX5fHFG7LJwy7wwYCpIAwhHdr0cEoY?=
 =?us-ascii?Q?sjMpNHRUms/m4+SK1RDwlu7bryDJkoNM2mg3a12ZsAHcZsyug1zsPY1NBN9x?=
 =?us-ascii?Q?jmsXJ3ewh+fggKuWUs75lKpL7hsxop3hyIqYZ9FmiQFzwwHQ5HzSDWWxAi7g?=
 =?us-ascii?Q?zOGZDoulBJQauIzoKxr6wKLtMYJDEogkjdfL6Sl7zCavsyHAs39sQ9rCJXzV?=
 =?us-ascii?Q?D7JlkqtW5GDsJmtoDUvMK9qVBT/d1uuocvnGcbIuA8dSkyvJCDw30R7w4cqb?=
 =?us-ascii?Q?WHboqUuqkARW3hABA3BlC9HrOfjVpzkjFziz9YTY9ffsrq7O3csJUUTwTYfp?=
 =?us-ascii?Q?EoRigRIiLr7NESysogHVzc4Nt/Uv38x7z7s8MQVS3wgoQPqm7WgE4SjN47tr?=
 =?us-ascii?Q?8sQX44l2KZnQ1Kdsz2RNCqJLwLMV3H3sMfW6/vaZ/sakWqSL+MRBs0JzXiIO?=
 =?us-ascii?Q?id+ZZ0ljIXXmemg2OxyiPbVc+FsvhONNNouG7YETJJe4xw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b89962c-103d-4cf0-86cb-08d8f3662c42
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 10:25:43.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nOPq4jQS1WfFSF2FSOVSobjnMSJvYOdwNi2d1JUKbcQwdMRfXdll4uk9Ze+EAiQnVpGpbHsgiPJeYdc8lgLpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=MjRijzr9;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.15.55 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

From: Peng Fan <peng.fan@nxp.com>

Support virtio console/block, the reserved memory
has already been reserved in linux dts, we reserved 2MB when
initially support ivshmem which 1MB is not used at that time,
but now the left 1MB is well fit for virtio console/block.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 configs/arm64/imx8mp-linux-demo.c | 81 ++++++++++++++++++++++++++-----
 configs/arm64/imx8mp.c            | 80 ++++++++++++++++++++++++------
 2 files changed, 134 insertions(+), 27 deletions(-)

diff --git a/configs/arm64/imx8mp-linux-demo.c b/configs/arm64/imx8mp-linux-demo.c
index ff0cdffb..1e0a9f1c 100644
--- a/configs/arm64/imx8mp-linux-demo.c
+++ b/configs/arm64/imx8mp-linux-demo.c
@@ -21,9 +21,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[2];
-	struct jailhouse_pci_device pci_devices[2];
+	struct jailhouse_pci_device pci_devices[4];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -43,7 +43,8 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+		/* IVSHMEM shared memory region (virtio-blk front) */
+		{
 			.phys_start = 0xfd900000,
 			.virt_start = 0xfd900000,
 			.size = 0x1000,
@@ -52,25 +53,57 @@ struct {
 		{
 			.phys_start = 0xfd901000,
 			.virt_start = 0xfd901000,
+			.size = 0xdf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{ 0 },
+		{ 0 },
+		/* IVSHMEM shared memory region (virtio-con front) */
+		{
+			.phys_start = 0xfd9e0000,
+			.virt_start = 0xfd9e0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd9e1000,
+			.virt_start = 0xfd9e1000,
+			.size = 0xf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{ 0 },
+		{ 0 },
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/
+		{
+			.phys_start = 0xfd9f0000,
+			.virt_start = 0xfd9f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd9f1000,
+			.virt_start = 0xfd9f1000,
 			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0xfd90a000,
-			.virt_start = 0xfd90a000,
+			.phys_start = 0xfd9fa000,
+			.virt_start = 0xfd9fa000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0xfd90c000,
-			.virt_start = 0xfd90c000,
+			.phys_start = 0xfd9fc000,
+			.virt_start = 0xfd9fc000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0xfd90e000,
-			.virt_start = 0xfd90e000,
+			.phys_start = 0xfd9fe000,
+			.virt_start = 0xfd9fe000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
@@ -143,22 +176,44 @@ struct {
 	},
 
 	.pci_devices = {
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 2 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
+				VIRTIO_DEV_BLOCK,
+		},
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 3 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
+				VIRTIO_DEV_CONSOLE,
+		},
 		{ /* IVSHMEM 00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 0,
+			.shmem_regions_start = 8,
 			.shmem_dev_id = 2,
 			.shmem_peers = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
 		{ /* IVSHMEM 00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 5,
+			.shmem_regions_start = 13,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
index a1e221f9..3f758980 100644
--- a/configs/arm64/imx8mp.c
+++ b/configs/arm64/imx8mp.c
@@ -18,9 +18,9 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[3];
-	struct jailhouse_pci_device pci_devices[2];
+	struct jailhouse_pci_device pci_devices[4];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -42,7 +42,7 @@ struct {
 			.pci_mmconfig_base = 0xfd700000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
-			.pci_domain = 0,
+			.pci_domain = 1,
 
 			.arm = {
 				.gic_version = 3,
@@ -68,7 +68,8 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+		/* IVSHMEM shared memory region (virtio-blk back-end) */
+		{
 			.phys_start = 0xfd900000,
 			.virt_start = 0xfd900000,
 			.size = 0x1000,
@@ -77,24 +78,53 @@ struct {
 		{
 			.phys_start = 0xfd901000,
 			.virt_start = 0xfd901000,
+			.size = 0xdf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{ 0 },
+		{ 0 },
+		/* IVSHMEM shared memory region (virtio-con back-end) */
+		{
+			.phys_start = 0xfd9e0000,
+			.virt_start = 0xfd9e0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfd9e1000,
+			.virt_start = 0xfd9e1000,
+			.size = 0xf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{ 0 },
+		{ 0 },
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd9f0000,
+			.virt_start = 0xfd9f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfd9f1000,
+			.virt_start = 0xfd9f1000,
 			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
 		},
 		{
-			.phys_start = 0xfd90a000,
-			.virt_start = 0xfd90a000,
+			.phys_start = 0xfd9fa000,
+			.virt_start = 0xfd9fa000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
 		},
 		{
-			.phys_start = 0xfd90c000,
-			.virt_start = 0xfd90c000,
+			.phys_start = 0xfd9fc000,
+			.virt_start = 0xfd9fc000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ,
 		},
 		{
-			.phys_start = 0xfd90e000,
-			.virt_start = 0xfd90e000,
+			.phys_start = 0xfd9fe000,
+			.virt_start = 0xfd9fe000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ,
 		},
@@ -167,22 +197,44 @@ struct {
 	},
 
 	.pci_devices = {
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 2 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
+				VIRTIO_DEV_BLOCK,
+		},
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 3 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
+				VIRTIO_DEV_CONSOLE,
+		},
 		{ /* IVSHMEM 0000:00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 0,
+			.shmem_regions_start = 8,
 			.shmem_dev_id = 0,
 			.shmem_peers = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
 		{ /* IVSHMEM 0000:00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 5,
+			.shmem_regions_start = 13,
 			.shmem_dev_id = 0,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
-- 
2.30.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210330105658.16676-3-peng.fan%40oss.nxp.com.
