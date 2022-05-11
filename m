Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNFD56JQMGQEEL7VALQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 806AA5236B7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 17:09:41 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id m6-20020a2eb6c6000000b002509fdb1dbasf844674ljo.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 08:09:41 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652281781; cv=pass;
        d=google.com; s=arc-20160816;
        b=aTIOytXNPJAk1J0xv9ScWw9Z++I+GwMYKtfcGAu+Aq9aahwMuztaf0ZcCINU7muKF+
         kFFa9BymVMSFV0uyM8SvJ+h3040Y1LtdzlZAbhcmxFRZAimxqPAqAwu2n8du08BR4hS9
         kCcDoYvGVL0l892NRGvVZooctbPeX1E3haSImVouIHgPr9IHTHV63dWAHjY/AY/ZO5Kl
         O635rSO2SikEXeDRLygsG3uRFuFtQDPghZskvi64r6x+RlUc+/YjipJYLTnxafMzsVsJ
         QOq8nx56hOPUuY6zCqHbjUoSgEaAvnXwPaWqBTj/WHPDXhpMMVGY0wXi+P1yjBRvflVS
         gBQw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=qEpzNUpXNFf3w3vPXpcEQxudGqBjRDUAJWGEUzQEvzU=;
        b=DYfseC4lukdueIwIIjLATF1nER99NLeFr92UymrvUCAWkj4yahshSMmKgv75QPhPA6
         1ZYmpvAkF+bUdL8HY1/cPGhYvpi6GgNP9iCUN/xfIGufqQow4GDHD6XfZYP0Cub8uHhb
         nAYfVl22H5yZY2Ga2j79vbYtFoPAqjnucUIFIFn3K8AHBBc+mbh0RK6dNge/5PKM/KFa
         R+6gwDw3wZxIOpcvoQkD7yhOeAnGQZYLC1tH0C0jMBWzCXVbXpA7Dc3IHAoS2G1OG7V5
         dOS9IqpwfRkhjuVo04bdgIGrSDk9r0b4G19aRTBsNpA7fA5Hl0FM+tZmquMSxSGpKZIG
         VtiA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=g9PHoDER;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1a::60c as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qEpzNUpXNFf3w3vPXpcEQxudGqBjRDUAJWGEUzQEvzU=;
        b=g+KIZ+qacFcz1Jn9Ax0qLD3itfxPjqdPjxzi67IVrfqo8UkY9R0SyxE3Kw3vDgWw4j
         W56ThGVDVnMdM1vBR4I8tAQ1o8Wj01IE/7C1xGUg4vpiBXlpTi/I7ewU2hHsDTQ5d1ht
         rBC0JVBGjWR46bcWyL+z0WYQRkOb8tHTxt42Rt8wWqCiQB3Qm0sDiK+ZmBn++R8wApXu
         OGf+aWxe4sTafRhGAkkvhpuH3lWmsTikCfk2X4cVfpACJuHp+1s0nG7xOhO4l7Dc+EMO
         W4shQITtKk5GQqBnGKpFKNs8rh8CW9DLIfAQ7ZCt+ApP4gratu1yM+TQ/2HM22RFUVQh
         wlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qEpzNUpXNFf3w3vPXpcEQxudGqBjRDUAJWGEUzQEvzU=;
        b=hEQPaTQUmSNxJMDn9UcEeewK/8z+pAvymuCVKtZ7+0NIDDtpgb3IjHYe3cdVYBN38o
         1Eqm4F+COvsojOttemeLwzyHIvg1WcOFolSm7cLuSiPEMDazfaX3Qd7pEBH5kUjX9Yol
         Y4RHkkackDGlTbAI7SLGjfg9bk5ZaGBQNOAzFLGrlBj3uMKT7LL65f/VL4pqjzisKrob
         mOPcmXEdGOVYBTia7uEdyZ4QfujHhlP9sYnwd0H7ev6NRcNOO72cqI4xaNwEiXXJfbrB
         9uKl9akAaq7C3KnlD2lsCx8E2iOS3Dcwr7/jLVR0qDsq/TFjvMg/xnuTmqCFBZfIq71n
         YWXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531hx84+ojFyOJXGZ4GDkKHGGCqCSs08Wy2Fql7BxWCEtIJhF+ZN
	EtMxzzwBd6Ml20qiWyvLZ0E=
X-Google-Smtp-Source: ABdhPJxZr5pw9QeS5gnN3S6gJPppS9RBuC86CVS4cKYOwFC1I4LoKp+7MyFE2HxTXVdRY2k9k5gDxQ==
X-Received: by 2002:a2e:824b:0:b0:24d:c247:c928 with SMTP id j11-20020a2e824b000000b0024dc247c928mr17523171ljh.68.1652281781080;
        Wed, 11 May 2022 08:09:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1a20:b0:24f:4bdd:dc20 with SMTP id
 by32-20020a05651c1a2000b0024f4bdddc20ls444049ljb.5.gmail; Wed, 11 May 2022
 08:09:39 -0700 (PDT)
X-Received: by 2002:a2e:9c93:0:b0:24f:32af:120b with SMTP id x19-20020a2e9c93000000b0024f32af120bmr17041222lji.324.1652281779153;
        Wed, 11 May 2022 08:09:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652281779; cv=pass;
        d=google.com; s=arc-20160816;
        b=PkkUIp3/a8FXzhTUdNGrkETeOWFrCFE77eVzYgPMHdA6KhYSuKoFiPdeMwAO70TE3y
         99Y+5obGYLBBfJDeEWcBy4n/bS+fybMKHfBOHwjjvpRmFTyIsQ0NlQHClACtjjCA/ITV
         Tuoh9RP2RtUNEl6YVI932tJ7wC30bSB15IGLD48BTPWZNA2zN1KyDbRRIuVH5PM0uUJZ
         TZuVY3hT/57OfVdqDRBoNUYZFsKgUSEr7IrgQ2WL6HmGvDalNHvSH+FvO61J9SJmTFmX
         bBHThT/WIkmVu1pTlk+PtMMpj+7dDddoqe5aQbcVN/aN2FwptgNu/2WHWV06fPTJyKXh
         5U9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SF9t2nzR9srvx7KDsTSbxv9lEuqXf8gOw4233E5XnfI=;
        b=LCvOMcbrERGDKEioA4eDtA8T7QtN/xKFwf7uvQcbIedmWOIQdGe3oIwIVs0JkArLpK
         OYUabwspa5SYQx02TVKH9i8U6Onr8+s05ITIcxNAo3XL1XcDUCYymRlbOuFgZiE5SFqy
         q11IicwsCQO7tJRdagmHrmSQhqIMQUwM/7R0IK/h5HNXY3HN+a+jxGBIrV9kJj51ICGP
         qvtFGhMFnCwJf0hcTRzw9Vvoftn7ADkxUorBZjqOpKgnL40QJZqQH4RLAis8qrbNbCqx
         EXh1rwVv66gbxqr3D6ivLVtLSthA+aGVI1ubJKYBbysGUscqpUgHG75cC+OTrYdnYGjP
         BrTQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=g9PHoDER;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1a::60c as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2060c.outbound.protection.outlook.com. [2a01:111:f400:fe1a::60c])
        by gmr-mx.google.com with ESMTPS id w7-20020a2e3007000000b0024da01a8c6dsi147536ljw.1.2022.05.11.08.09.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 May 2022 08:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1a::60c as permitted sender) client-ip=2a01:111:f400:fe1a::60c;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6O0o2urtxeAOZXotVPt6wjj5ODG4nYxYgO16gFycc2Xq+pWrVARwtaBTB0vVkix1BdWTbVhL6nOkE6Rl9MywkbbNU0GCw+QI1BUPCCMbRIXcGbdGO8OK3Dr3Jr31WbB+7f9ZRKpiO0sppYFm3diVH8XZ5M6LqspYF4/44bfZHDww7xNzYm6VhmzYd1Tlo/eV8kMQ0Mjy4Qy8xfbOT5442YbCjAUQ+undJwkXlr86Kl5zhyglI7cg6G3kQSdxk/jolPsPB2RhG9Z+6DIpyKEXvFpepRNooBfBgrStSHWQ7cvlqHISwVF4uxwc2ikitQmv0y6uKEKrB33LOOrv2hfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SF9t2nzR9srvx7KDsTSbxv9lEuqXf8gOw4233E5XnfI=;
 b=ST88MWNZJQQu5pBy3Q9En5y3WvVH/V4aeIgyVh6plhFQ8VtdHWuRsVhMLHFiWaNbItVOlXbVG22R1qNDowppV78oDL2aMr1IIIN5XmNYJHaO+zZD4m62xZYIcNrKnaKEvW+nU5NL3T6L6JzNPtCoP2+GF/n4uYgo9dzmAIKjkQTHMfsUjnj8ScBasSGyjnOERiEd2cdZZYkCbdbghVEh0OLcK/HVsGe2Am3CU04i8gj/EcuEv4+o1mzEFUc5+9ZsyjDt9+FHHWSeZTep4bdzyt6BSboPDz19RGJnym7hnzo4TsY7CMAuKiNZ0EtKriVWWsbHTYpdVwRPq6t7bETv5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AS8PR07CA0008.eurprd07.prod.outlook.com (2603:10a6:20b:451::20)
 by AM9PR10MB4321.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:269::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 15:09:37 +0000
Received: from VE1EUR01FT007.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::29) by AS8PR07CA0008.outlook.office365.com
 (2603:10a6:20b:451::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 15:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 VE1EUR01FT007.mail.protection.outlook.com (10.152.2.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 15:09:36 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 11 May 2022 17:09:36 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 17:09:36 +0200
Message-ID: <e4196998-4979-c4f8-bc45-52f0499a8033@siemens.com>
Date: Wed, 11 May 2022 17:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Jailhouse 0.12 on i.MX8MQ EVK
Content-Language: en-US
To: "vsun...@gmail.com" <vsuneja63@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Peng Fan <peng.fan@nxp.com>
References: <ab9f5a7b-d479-44a1-8ae6-a2ad564fe1b1n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <ab9f5a7b-d479-44a1-8ae6-a2ad564fe1b1n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.959100-8.000000
X-TMASE-MatchedRID: dzgRF5KJYaPqP2NggtT7nd0fX+NEDQfGPg9yfk4YC0ZswYo64ufkVQEP
	JrYlsf/6BBqKJYqyLMPP8r/5eWavVr1/tzoqsVtZ6vmREl4dbgtzfeCSt9MtiB3EEAbn+GRbLoz
	I+rhNYbm2zFWqrVN4BZIu8BCNfKQKQY9ube1qTn5ftuJwrFEhTaNeZCXBE695avP8b9lJtWr6C0
	ePs7A07YnxgmBGuBcXwOam7VrbipKT2vYDWwDVKNByaeIak2TI9JZyJfDoRnw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.959100-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 6294B3A8C77CF2A374E0959300EC9DB4C15DFFEC082649EFC3182426C2793FBD2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cce03324-d956-4d5b-3a53-08da3360437e
X-MS-TrafficTypeDiagnostic: AM9PR10MB4321:EE_
X-Microsoft-Antispam-PRVS: <AM9PR10MB43213B27351A99AE3795409495C89@AM9PR10MB4321.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DQ2FdXj1ERxSoaGJlrVzkbpcaBq6wJpNnanwYDtplRqEiwT8CYBc5nYvER1WYPk7ctw9fQGnttTK2BxkIYbTa15LWurUpbpjwVRTl0pFLSMJOYw1BHFq4y+DfUNcRsMf/e39yub8CGXHBAOG0eJxVE897KT2pjc1xySML5DKyOU9DvsyV4/Z1mxndYPR69gwoEugRL+Ngfky7otAY2i0LdS5R0B3JYh2tcXSSdeHTGLdKn+5aWANPOrWg+y4gd3M+80E0ctPEjJLnYycwpQzsYbpjGBfLVoUvra24PLcCuoQ+LFVYq3T7yJohPuaNcD4gElnwAfs2Is397zOH3qydawzmuseKLb4hk/N06xUIwp3/PUUl3F+GYBxGWpYTW1jjluBKzTochR4rhD4IsIVj8K5A9F78ecJbKvsy/iDSBZh9xJUOqKt5X24JD5wVpSJgRzn90s54gGxf9aU0zw3QTjrkTu80YG7gZd9DW2WCHT34HFnRL1O0XWqPvENpVTs81dSfKtfYncO2IPAln0WoR4ED/F0/c9smr08NLYZMSmDBp3Q3PKS3BCIN9Z7gmjv+/4gVRxpLj5dybgPfgPP135CNGj56aMAt+0CblBcbwVI8HbXxSjdE2+nYian07QGv03hdvajKxdedLcrcZ0Mhne/89gtWTWWn3f8AUxaBjbsqfHD/MtId9FUM5vah2vM7g0nMnC1T3cNdMdIiE9noePiPMD9+XDWQSBKWu2VZZwb8gMqbxip47+1dBUfkvMI3qory08NDZaiik8iB2t0bX6yBTk6xMwgslUWKIWDLDg=
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(956004)(316002)(110136005)(6706004)(70206006)(70586007)(31696002)(8936002)(2906002)(2616005)(16576012)(86362001)(8676002)(356005)(53546011)(82960400001)(26005)(81166007)(508600001)(40460700003)(36860700001)(336012)(47076005)(36756003)(31686004)(82310400005)(16526019)(44832011)(5660300002)(186003)(4744005)(3940600001)(491001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 15:09:36.8100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cce03324-d956-4d5b-3a53-08da3360437e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT007.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4321
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=g9PHoDER;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe1a::60c as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 11.05.22 09:16, vsun...@gmail.com wrote:
> Hi All,
>=20
> I am building jailhouse 0.12 on kernel 5.4.147 i.MX8, but its failing
> with below logs. I could successfully build jailhouse 0.11 on the same
> kernel. Any suggestions on this, does 0.12 version support i.MX8?
>=20
> =C2=A0/*vipulkumar@A812DBLR:~/platform/AGL_lamprey/build$ bitbake -k
> agl-demo-platform*/
>=20

Are you using an AGL-provided integration here?

Anyway, maybe Peng can provide guidance here.

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
jailhouse-dev/e4196998-4979-c4f8-bc45-52f0499a8033%40siemens.com.
