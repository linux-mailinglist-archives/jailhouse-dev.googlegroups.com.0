Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLFJZCJQMGQEQX22NPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBBA51970F
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 May 2022 07:52:45 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id o11-20020adfca0b000000b0020adc114131sf45028wrh.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 May 2022 22:52:45 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1651643565; cv=pass;
        d=google.com; s=arc-20160816;
        b=gSC0EiWBmOIRWCTbR6W2qUzWUpDGR3YtuH9rTnvAeqMzu+QpITlfSQJzHQEovN1WIs
         3aM/EeKlU0qqsFTcCVLY/j7zWWz9t8sDdvtw/BpbdidZcQi3vnXfJhPg6m/YMvttWlmc
         ICgFFVSTv+vXOMqkXvxlFywuMw2z2Gr+A7ZrRNmwPjpQz5cq1cMXOfzxYtEIuqeAaMpJ
         krJHZHr3QFyrIIfvLCBlkDufaBfANRsSYIzTceGAyWJ1e7V1k/FJil1/2w/L60HRLME1
         +Ayf6rHt/MaUZjQKbR/yCIpaPKOCXvvI1GuMIjv+Z1lxfHa1ZXGxpwejjvHPhgwjTQve
         9ckA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=ngNHRECdISbCS9H+0ho4NerVU82eoLYXzQrNBHW9CbY=;
        b=UHYfgDBDM8OcNt6bMTfkvRHrRh8tPZnbgxnyeobALQoFIno8Bvcy2qmaDewCy4faWS
         aVfFfmRekQXLe1SQ6jYA/k8zS8jaiG7P8rRkqDwGcgRjW8Hr1qYtEbO8zQDHfEoaOGzR
         R+hIIJxqTMv0P7/m6iVe15EFkmnepHgxFAJIccO2+gzbafcu++EMqHQt6OPpzgmZpLHk
         haVGimWmXZYSfjkBLvqnz0pyXv8ViFjddLSc/fNVBQ6Tzdxd/fmmoohn2nTl0fsWqEFH
         6PT7/uu+YQBrITDHprVDTHHAxlo4sAQxGv3Zd0hmgJ9AOKE7rgrcRPyRLCzmChTA8UnJ
         zM1w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="lYqWh/vM";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::619 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ngNHRECdISbCS9H+0ho4NerVU82eoLYXzQrNBHW9CbY=;
        b=QncbbT+pTllH5f4pmJA1zc/8L90hOtgkQgoNMcEaFcHG/wPkgVHsU39wdk3RrRCIdD
         a+nQdNiP/bPZLTN3SukW8f1ejDTNxsK/WbTF/OQ6KW+Prf8Fml6oaxQSnXoUgg8HfUfr
         7ZJf3ao5m+ZJ/Cmn9YMDdBJyGl3CHbCOSbCY03KZkhNVYeqW8HzTsd3EOSpvsrPaEOom
         ml1+tkKs1T/Wqn1VjlbqFzo/AygskRr4x+G7o6EGgV9DtnPw7IAeIuyccDqp1Cg0UZPf
         BqlFHbO49cOLmXCqbM4Yrmdk6A1R28QBSOlDlv9Gk1Kg9BmpJ+SWyjR1JLMLGcF+EtKi
         TqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ngNHRECdISbCS9H+0ho4NerVU82eoLYXzQrNBHW9CbY=;
        b=7BYid+No3OfbqHCcJj3GXJDzQG8pMpseknya0C2RiGvQupoiBW6kP4JtUoAB1+ycfw
         tdstB1nOdJ3RL3xFs2F3GukCVVRhjjm3JUsoRezx8U5sfu4+wPFfrPFvoF/Dh2YeXlke
         EXd9I6SmLqy7p+5k2PrudKNfACMyxAdm0Sb2PFltZMaJKU3PRDdJgGRkoEdAjiZM10ZY
         PeC5XBRAAJQ7R63BLREfjBXAKEN/FwymVe8LeSKgkwsuYtw0NrLB8l+ReogxtUW/JyzY
         M0/IAnS4nMIeYLXTVj5mTv59BdvICuOKhafsn7Qf/zUTRlHIdk3HorpHJN8P67+y8d7c
         ppDQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530uDqXiXduXmFoVvVkmtMkSOExk+vd8UeqCdet7n8sombQQogre
	xj17xxa0IFHuSkhmf/67w0Y=
X-Google-Smtp-Source: ABdhPJxCSz8mbkUf8n1TdYSXK0FIYunL2kekWWW4zucWu3oBah8YLFHdCPWjJxs9wOLk6CG/ff8/rA==
X-Received: by 2002:a5d:6d83:0:b0:20c:7329:7c36 with SMTP id l3-20020a5d6d83000000b0020c73297c36mr5424169wrs.518.1651643565235;
        Tue, 03 May 2022 22:52:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1567:b0:20c:5e04:8d9e with SMTP id
 7-20020a056000156700b0020c5e048d9els1300674wrz.1.gmail; Tue, 03 May 2022
 22:52:43 -0700 (PDT)
X-Received: by 2002:a05:6000:1543:b0:20c:583d:e8ec with SMTP id 3-20020a056000154300b0020c583de8ecmr13224887wry.460.1651643563368;
        Tue, 03 May 2022 22:52:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651643563; cv=pass;
        d=google.com; s=arc-20160816;
        b=jY+BsIDGZlZOs28weEqbko37/EcOFYk1xlTe/GnyZVMZ4wIV2+zqRi8wwmE6zz8z+S
         SGuRfzIZOfKoNF8M16Id3DLiyVUanRYb+QyfortdcjoB2LO8D0pO31cbfQO1DfAB7y9T
         KTaX4ddcyShoSXv67QrE2QDhsfikpN/UVb9uEEXnYPYhj05BtWUskPos68AXRZTWkTPU
         dIhKWygNcZh90X25dvmDcBsZQzAGf466jfGdxny04k7QLTWQnWePT3lPLRUJ3QmuV8Yc
         vpDyT2NiUNDm+P4jioPeTkDuov7uKEF4i43P6jkMFfDV3CFjW3T/o0FYuzlfvULLC8FV
         xIKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NNgVz/duo6KtBVrb5GG7NBqsEnWwAZmKokAmUnUa4mM=;
        b=jvdy7+NLwefXzRaMkEaWh5V4zHgW8sDvVMqdYimnVSzDuos25zqGZ17VfRd2iYmArk
         SHcI6U/l+4qFTWUlE7KG9bVpV9hVX5Fiypj9nzAWo/vdV6zDs4TwWevNiOVy/A/8d8hD
         R/jDoWu2CLH2M6X5E5az8ifabvqprIoaLM330l05Dy9w2PdNgJepzTOrjK7RD5XsAszA
         zIO6bfpWtQ7mT/Dxn3jN6dTK3nQ4FqM5+zdhJisBIEtRK3UWKW7g3kCuP2h4cbBi8IcY
         Bg7oBcv3BLQQTe1Fvyr1yPbzl/ag5+yf5/0B+5fy1lZMq0Vcv6eyRpEWZ6BNuc0ubaxv
         wtBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="lYqWh/vM";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::619 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20619.outbound.protection.outlook.com. [2a01:111:f400:7d00::619])
        by gmr-mx.google.com with ESMTPS id a14-20020a056000188e00b0020c788b9364si120155wri.4.2022.05.03.22.52.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 May 2022 22:52:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::619 as permitted sender) client-ip=2a01:111:f400:7d00::619;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvSWyZ3iXk34XHWlmU3krjPFqCwxNiPTwBaGwg2cWlEm+BulZqnD98fjvJIEQ4QIW1TQy8rgQMS0rwHPM51aAv7vNM5VfifL9B9VPdJI59cYBIhjZ6nFBxfMFxyE0XW5PqcNYT+8CaP6KK02iJCRM5rJlMNtiUwGefc7RyC/L5zwKMSRldaKQGLQIcMWBa/zp25R87qEkwGjYUmbnvUW/kExprtEkM5T2VaJ8tF152L8QnuHEo2zTFqYu3mUBGVhEzPGICWkKKbqHc62aVpK52SNwLHcuJVgSFgmjymkm3fkFJRe39nEXIRqm/pSnVWozSFH9ezdhdPKaJEP+FjtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNgVz/duo6KtBVrb5GG7NBqsEnWwAZmKokAmUnUa4mM=;
 b=hMGo4PBvTy8mgAL/vWgnoxUvl35T8GlwanJecq3ZxBebYBFgbnW0B5MPZDXf0dj//jrx9tzz4iLERB97TSb8ZSK8n9DRkEytD1lqxnutA2iKn8ULL3hU8FqjYnFs2TV+FRi8KaqjL3wL+ydTZ1sYy2C/66jpnQP7GhGQQUPn+jKfPsOJH5+e+QkYfPrTc8TWPd2t2bnJtl853tSXx2ZiuthhGwZJKqYQxe2wl5usouzTAWoZaIpq+Q1KvIG6ttx29kX9IlaJYBvEv35bN4lAeNm7cNwEza0sS/xFlKc3RiCxFVAtu575JYGRZ7FEHmEjbXKumws2YQLekmcUC8bU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DB6PR0601CA0030.eurprd06.prod.outlook.com (2603:10a6:4:17::16)
 by HE1PR10MB1788.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:7:61::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 05:52:29 +0000
Received: from DB5EUR01FT060.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::fc) by DB6PR0601CA0030.outlook.office365.com
 (2603:10a6:4:17::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Wed, 4 May 2022 05:52:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 DB5EUR01FT060.mail.protection.outlook.com (10.152.5.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 05:52:28 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 4 May 2022 07:52:28 +0200
Received: from [167.87.72.60] (167.87.72.60) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 07:52:27 +0200
Message-ID: <e4e83117-c094-0bec-40f6-627ab1dcd776@siemens.com>
Date: Wed, 4 May 2022 07:52:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Linux and u-boot requirements
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>, Chris Paterson
	<Chris.Paterson2@renesas.com>
References: <400480ed-70db-467a-b47d-b4c3f3641777n@googlegroups.com>
 <b7c5f1aa-e91c-3a9b-b74c-2255184d66a5@siemens.com>
 <CA+V-a8vGiT237W59_OMqxLuFSAsPYYVCGZW3mn5vaGnUhDCK+Q@mail.gmail.com>
 <aebdee8e-4074-b223-2cbe-42564624e7f6@siemens.com>
 <CA+V-a8vpx00x21N12bRQ9eGPHH3TnWr96HmxUPpJUgtHyMy-LA@mail.gmail.com>
 <CA+V-a8u0bPPZBk49twr9xuLNCPKV8isdSGTt+Pj6mYV=Dkh2OA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8u0bPPZBk49twr9xuLNCPKV8isdSGTt+Pj6mYV=Dkh2OA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.72.60]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--14.902700-8.000000
X-TMASE-MatchedRID: OMk5Q+H0IT45QaOxwNGfvo9bHfxDWoibUlQrLabIzZNFM72aEhcbjRwO
	cB9/9tcR31GU/N5W5BB+Nx1ftYxL8ON+5GlMXaHaKTY9WI32fF7tt0HEL3BUV/9N7e3lwkwbT5y
	sQDj6eFljjMm9SMavFUOcZvtoHDbzlZ0sk4gt6l/cVWmwGGP0Yqn7cUty5471/sUSFaCjTLyByx
	Vkfd04JLcIt210bWgIXZ2zEJFu6gESsbgEIazmdj8SXIwpQbUb3v8Kcj7t7rFIcJTn2HkqsbqoF
	akaELIg1R/ptYWR8C6xCOv1qt1aObZ2gs6F0/3A3i/nRgyxNUoUh606rb6lUArcxrzwsv5u4NNi
	N6MhlPCwuKAMD8Wm9TblER2H1U0/rUMmN5Cq+5XEbDGPUHA/xf36sqVF/VZoynaq9UJcJkFfqgA
	Mtax3Q4Ajsy+r+wvn0/6Rc2rmS5kr/T4CdMoG6C0xYo1AW+JXNZgeA8Gk1db0hv/rD7WVZPaS52
	LUPfcSWcVk1+PpebZgbfZku6SlU3qKlbNWS67wVqoEWlQFr1XlRxm3A2wKujl/1fD/GopdnCGS1
	WQEGtCduxHPxofvNqu6xVHLhqfxIAcCikR3vq9DUch1Phvq8/YEScdvNp4BbuVo9ORZPbtoeUP2
	XoMnLJGqMXebQE2r
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.902700-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: E92916CC24E06EB152AD9D48C78CB40F785103DFF27169073F9FFA228BE387DA2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f393ba5-4d0d-4edb-6519-08da2d924616
X-MS-TrafficTypeDiagnostic: HE1PR10MB1788:EE_
X-Microsoft-Antispam-PRVS: <HE1PR10MB17883EBC8FCD3405765A556F95C39@HE1PR10MB1788.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eAZZlgDEBufgYv7ic6YOzHXio6rv4cz26xiJuSFUUflsybP6H9v3I9Hng5bDUcDzevZDoDkrr/ds8LFm9vaNTOjRimy63TKGqUeTvwvYF2r6Lc8wNb3Mg6au/TXNUXBbgc+R7orCEfjtNb7+ZQ6hzGknAALwrLZEwCWDV7tZAN9kUShmALKRZ7kksfiY28Heh4iVxSAcA019wfu7d0P7QnUBi0uXyzrd58WOOKNiXxM54Gso2vxaiJb5J6mbmSvHyaQLXQ1LmFUxNQ0+XUo20HcNOGVShxcCAHRIv/PFZITR1EWSJhk9X09twi5WN392Fdesy86SDmTganRIa/Tw178OEuVUtafsS/G7kZjXRauNxX1HLAWyYk2OfDCu2R5HavA+SZcLnRlQFdekkBoWAxtlMA3PtLmjeTCwRoQVQRohWofG70LYP9bokq1wCmp/KcqWERzIRDOi6LXwaMn/G7Modl8cJ+MLJu57mIRmdmSwXEI4wq9D8DxksIRmqrOecgi3nZJCu3pae283vMhhcVuLDl8iPV9toY/KBpvlTxqqju4MapbNmaNNaZXhMAzZPJ49T6LdUHN9cdtU7txuyEIhAnGxFDSAY8NVLsYa5W8Tqzg0eamcFEAzlT/YqMnRsOydai7q+q0z4bcz/2pqmABxfJJk7o16oGhJiBK4jYtp1Z+BxmwMKrQNCY71NIO9DXsFEfceUjQC15+HGzIFt136FZtbbtvN+BwCaDXQH6JAPVSP1cAzVKPRXZgR7kEm507pb1H55/N/jyCppLNf4e5KWFs7tQiq0nVqteFYpzzCqY9rSJxbKAiiINV3bHTVw1OtYT7D/hqggGjeWDBf1xSg/RDjUuGkbPHcsMDLfcNfFs5fDhBSDK61N/NFcVohmRiKOT6F+O0ENcnKqmZsuw==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6706004)(54906003)(6916009)(16576012)(44832011)(356005)(82960400001)(5660300002)(316002)(8936002)(508600001)(966005)(336012)(47076005)(36756003)(86362001)(26005)(186003)(16526019)(31696002)(53546011)(2906002)(40460700003)(83380400001)(70206006)(70586007)(82310400005)(36860700001)(956004)(3480700007)(31686004)(4326008)(8676002)(81166007)(2616005)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 05:52:28.9913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f393ba5-4d0d-4edb-6519-08da2d924616
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT060.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR10MB1788
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="lYqWh/vM";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7d00::619 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 03.05.22 20:42, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Tue, May 3, 2022 at 11:47 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>>
>> Hi Jan,
>>
>> On Mon, May 2, 2022 at 9:30 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>
>>> Hi Prabhakar, hi Chris,
>>>
>>> ok, now I understand your question last Thursday, Chris... ;)
>>>
>>> On 02.05.22 21:37, Lad, Prabhakar wrote:
>>>> Hi Jan,
>>>>
>>>> On Mon, May 2, 2022 at 5:13 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>
>>>>> On 27.04.22 15:19, Prabhakar Lad wrote:
>>>>>> Hi All,
>>>>>>
>>>>>> I recently tried to build the v0.12 tag with the upstream kernel
>>>>>> (v5.18-rc4) for emconrzg1h, but the build failed due to api changes
>>>>>> (cpu_up/cpu_down mainly).
>>>>>
>>>>> You want to use master or even next for very recent kernels. I haven't
>>>>> done a release in a too-long-while, so patches to account for kernel
>>>>> changes can only be found there.
>>>>>
>>>> I see. I came across the linux [0] tree which has
>>>> jailhouse-enabling/x.x branches. Is this a good starting point for
>>>> Linux? These branches merge Linux releases into the jailhouse kernel
>>>> which makes it a bit difficult to track the changes specifically made
>>>> to jailhouse. For example, for the 4.19 branch it's currently on
>>>> v4.19.81 whereas I plan to work on 4.19.198 which makes porting things
>>>> a bit difficult.
>>>
>>> Not at all:
>>>
>>> git log --no-merges --oneline v4.19.81..jailhouse-enabling/4.19
>>>
>> Thanks for the hint.
>>
>>> The 4.19 branch was retired a while ago, so rebasing over latest stable
>>> or merging that in would definitely be recommended. Actually, you likely
>>> want to check the latest enabling branch or [1] for updates since 4.19
>>> was retired.
>>>
>> Great, I'll start with the latest enabling branch which you pointed to
>> and use it with the v0.12 release (I'll have to port my platform to
>> this though). And then later I consider either 5.10/4.19 kernel.
>>
>>>>
>>>>>>
>>>>>> So I wanted to check what are the strict requirements for Linux and
>>>>>> u-boot as I plan to add new arm64 platform.
>>>>>>
>>>>>> Also is there any document/link that I can refer to porting on new platform?
>>>>>
>>>>> No written documents, but if you follow the commit history of
>>>>> https://github.com/siemens/jailhouse-images you can see how new targets
>>>>> were hooked up there (mostly Jailhouse-unrelated integration work).
>>>>> Jailhouse also does not depend on U-Boot, first of all only a working
>>>>> Linux / firmware integration, ideally from upstream.
>>>>>
> I followed the jailhouse-images repo with the master branch and
> started with Linux first. For Linux it uses the
> jailhouse-enabling/5.10 branch [1] (commit id:
> eb6927f7eea77f823b96c0c22ad9d4a2d7ffdfce). In this kernel version the
> cpu_up/down api are static [2] due to which the build of jailhouse
> 0.12 is failing ( I tried to build for zynq platform just wanted to
> make sure build passes before porting my platform)
> 
> I looked at the kernel recipe and there aren't any patches which
> exports cpu_up/down api and nor do I see any patch in
> jailhouse_0.12.bb [3] which drops cpu_up/down api. Is there anything
> I'm missing here?
> 

https://github.com/siemens/jailhouse-images/commit/64c102a9df6f713170129ac0e8f7c94927a8592e

Jan

> [0] https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linux/linux-jailhouse_5.10.inc#L17
> [1] https://github.com/siemens/linux/tree/jailhouse-enabling/5.10
> [2] https://github.com/siemens/linux/blob/jailhouse-enabling/5.10/kernel/cpu.c#L1253
> [3] https://github.com/siemens/jailhouse-images/blob/master/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
> 
> 
> Cheers,
> Prabhakar

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e4e83117-c094-0bec-40f6-627ab1dcd776%40siemens.com.
