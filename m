Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBZ476KIAMGQE4TJZ4JQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4764C654D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Feb 2022 10:03:36 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id y27-20020ac2447b000000b0044584328dc1sf1091517lfl.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Feb 2022 01:03:36 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1646039016; cv=pass;
        d=google.com; s=arc-20160816;
        b=dtnnmKPBoE8UKcH5Cfa5H5rrsrD8NhUcLcfqWDuj5MiG7q63j9SDgr1aheXEzdHfcQ
         F6D/5nEvR/PaC3iGZP53KsSNCuGrjs12QWlv6GZbvs99LvAxa27GvKzApJ3ymRo2eNcb
         TDmkqY3A8fNk5Z2KhnB93MNCl4zJLYR8qkTZiLS65v2kVOWG1jwPVIimXcBlhdviKrXs
         VHifZVv+lebWsV1FsHCaNFfn4VEhT2DR6CfyD+ybhAcXJebFxT5d5MsDAyiwPYVK4en9
         ukx+ZYxDdvhSWp08IWvjKqvBQ8wgf4c3R7RwZa/sTSTDfB+blkrNusfrjzskzjLQRFB3
         186w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=I8GLFR8lWLI6CjwOFya/vfltKk4W6zasoJe9MZGsvHE=;
        b=m2pBNEG1MCARUDHoZg/Wp25/wi7OBjm18GMCq1TqC/ioAoHREgpTdy879Oa6qjrf+R
         XRuZ0ey+fFxjVRPKUWyxJvuKepZgg0bL6xTuySLexA2GhPEXM62WUySJmZQgKZGbZbKv
         0wiZFj3AV83iFD9CuKu3LKAp3aX4i2xAlZ37ZKlf2XiXoXcUw1wCrKMDzc28AUGUA2W+
         H037pz847Oh3kYB9iyVtCcmGiLuGq2ltJfGwLYaAEkxIvFku1SnS+LDpQ1k3RJwM51lh
         Xg8eUcDE6uQE8b5mmSjgWV0V/NlZR0iah8742/MFhTHJn3I0TDWuZx9GNWVMwlT+LIdi
         ImvQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=EHoGSzVW;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0a::61c as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I8GLFR8lWLI6CjwOFya/vfltKk4W6zasoJe9MZGsvHE=;
        b=RWMw1BZxzRrrlGcB7owRJCpX3ikJFy/BmupsY6NQaHJlPwPOSHzbIKFo+vryg+sk1a
         dVlKrrSuac0BdlPE7ACKvDAvVI/3fA+7xy+7v6Kq/fSyZDGuWJP86JRB0GLzWPL2MWAn
         vwQ8inntPCxMRWdt387uBJtJu90i4y+o2jVdjS1bH0FpmUetRxbuHAdDJgpCWMkkNsMh
         ekg8ppQtERIzGOp+s0yY1FgLbPEVr5LFpZOlP3Klxtanlqcp9rORxSj4gkOSPw9f8gCg
         gHCglh2LFm4I9Qor7HMI0eICaWhzWR1aQ4eNvX5CknE2vI8T541tFHxNOa6a/n6ny8D3
         9bqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=I8GLFR8lWLI6CjwOFya/vfltKk4W6zasoJe9MZGsvHE=;
        b=PxbLFXu7W9lKFsuL19mPOBwDh77pjlQQId1NMA05lfzUu7CD6llDRiEzQqgPjxe6Yn
         tv00qfKUiDvN5Irmc+B7ALZ6w+dhoXM/8hGxY3vB/UDDfWQHi/r6rT4jE2JEuhPxJNV6
         vDf5WcbaUvs9nh6GroZ+DqE/OjdAq2q2LG/dkTlKCjCLPG1FgqwRqeKZ2GqEncTyamUJ
         J54w36EuXFOZ7Ok3wX5OA5MHTs2b5ZCP2HchJ0MeW+qEilsFI+hlGGdyMG1p8gssYaqy
         ZcjLBGJjUYuLrDUjlpgW3yMK05f5TPWRySMlCqCLuA1g1vxKxLYkVuWMPVz6feb6lD82
         bYQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532D/qibU0xKxanJhqVi+pBw3xvFaFEOBjTeqjzP8psOf6IfOthH
	vQkJBun6uTn4P+cIxYszVts=
X-Google-Smtp-Source: ABdhPJwMAkkcH8dZbyvxBgiJiN5tSpPyJZK5jC0/aXvMxFzjGrhiluz58mVGX65DXvfL3A9Wp13/yg==
X-Received: by 2002:a05:6512:287:b0:443:7f1d:e8ed with SMTP id j7-20020a056512028700b004437f1de8edmr12054027lfp.321.1646039015952;
        Mon, 28 Feb 2022 01:03:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a7c4:0:b0:246:3e9a:df6e with SMTP id x4-20020a2ea7c4000000b002463e9adf6els2161826ljp.6.gmail;
 Mon, 28 Feb 2022 01:03:34 -0800 (PST)
X-Received: by 2002:a05:651c:311:b0:23f:d9fc:9e89 with SMTP id a17-20020a05651c031100b0023fd9fc9e89mr13476275ljp.136.1646039014216;
        Mon, 28 Feb 2022 01:03:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646039014; cv=pass;
        d=google.com; s=arc-20160816;
        b=sQzqbUyQjAidLCM/+M9I7ECSXEt9L7Pir5zHHzFTvB/5mIaF2GXpiiExQpRz0HvgKQ
         eUwAywstWtQ2dIv3/EflqBQ3IAJ4iddjJnR/lrLZfQrzmSpKMgFx4H2MkfLAIquI+F0K
         TgwI46Ri42XwBvgFoN1cXdjJEdhscM5mWKRWfPA70J/zB6SIfLhwNyAwr01DedLLKZo3
         tvQyWayQv0EONMDrY8ALAvrOESa60L5BHlbONwyRDYp8PUSbTQRne7M4tIJ018AqRwHV
         M2R1GBC8F1MzODXoB5ZO2YHk7yQbgTikJOus8ZGfZGAtQnp0QmmqCY5b79K8LunSHgiN
         jVKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=5/BhwrqkMpUXsjNVdy/f+N0nDsEnF/KqmH/CIDk+9os=;
        b=rbv1pNZOR++ywllpZNrdCwNrf0ME6PDhvu+i+KuervQE7KGOhAFpk/BaVi2OYzs3XG
         RPtFNga4bepmWmk2M64yN+3pCn+c4dR46WVagZnN0AyM/YwswvWWL06vWSwvLgoLOtf9
         orR+GMMItxoISUJpDRhyru/gEDzom3FKL4y9dhYegNEPyUYh22+aI/9ShkQh5ekducpx
         KQSHVMoEf3Z6ZAfDZlFSsSgZR6wBd4dP4HxAQkj8BTkVmoa2BOCKNZsK51KVyr7NJNh6
         yq/e7XG8zVKTrWX0KW+/XFkcVDM/c2q6KAiXlxBJfokyQcOcdvIh4hiZJ9Lb28zm/Hih
         awaQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=EHoGSzVW;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0a::61c as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-db5eur03on061c.outbound.protection.outlook.com. [2a01:111:f400:fe0a::61c])
        by gmr-mx.google.com with ESMTPS id a14-20020a056512200e00b004435f3f66d0si423162lfb.0.2022.02.28.01.03.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Feb 2022 01:03:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0a::61c as permitted sender) client-ip=2a01:111:f400:fe0a::61c;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvIrL1ud32xSigxUZ14fVsV3zGYGVkSZ3Dcp6PG6RJyUNS+1MOFjIrqVvEdRGuUjDh6Lnpe387R/kAdphisfWhDW2l2VKmaSqMytZhhoOJ5YxigfICQprDabg3jN9DxfhM6Yh2jA/+J+FrSQ1KAKb6J/tzorA4C5E/JCcvktwpMG9rQFlXYCv3lB5gs3TPPEnl9+jg1VFvPFRhFCOdWPS7FqvMx9XE+UyY9sNdFdDJ1ThT4I5jt6dyAyKblnDCpH9uslhf1aQ6RXKVqTcp4VMz3UzYkJ0HMwJ0weTgDBRsRXvFYcqKv1Y/rJO6wwG9zWssI5CJISdCzY168Hb1ES8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/BhwrqkMpUXsjNVdy/f+N0nDsEnF/KqmH/CIDk+9os=;
 b=Vmw7Fsk1BXnZsEdfQ8OORctsdaW3Fx50sGMZT7KEug474IcmdvkcYmXC6T7AVMqm9Fat+ZnP1Qz6whvmSDaZX6xfiSxAOUnzHjQANmbThHuqTal6Bl7/36Pn7BlJ7RH2PA/Prfz0unasmR7L8tgDwtgTMuv0vO2nGFh9rVVLsrzE0HtW2yUiT7JoBJGxY/Q71nw9w/5YLRxRb3I3y2iQgSnM+EgeOLD/y5BTtwnSVKRWOWiddYQfNl+WRLukwOWbcLr+9JvE2iR8FdwBSm5NDNotfEeBc/uAZkp46O6+OS3cMAsIdLKJW22F8y+8nNmhw6uYmzF1c3LU8hgeF01V7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB3955.eurprd04.prod.outlook.com (2603:10a6:208:56::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 09:03:32 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc%4]) with mapi id 15.20.4995.018; Mon, 28 Feb 2022
 09:03:31 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Jan
 Kiszka <jan.kiszka@siemens.com>
Subject: qemu arm64 question
Thread-Topic: qemu arm64 question
Thread-Index: AdgsgeF0MBxawNBISdeukrlmtotnDw==
Date: Mon, 28 Feb 2022 09:03:31 +0000
Message-ID: <DU0PR04MB941706295948C00D9D24F4E588019@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3cfc29b-3685-4b3b-d2c4-08d9fa99319b
x-ms-traffictypediagnostic: AM0PR04MB3955:EE_
x-microsoft-antispam-prvs: <AM0PR04MB3955FAB68B80BE5AAA6D3B2288019@AM0PR04MB3955.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y1Vf2p0UkaLeu9QV6426nzjTxshPAxKLpf9yPwIhAvRIcGYwyrSaTxpZbGl4DcGweYTmoKKXdv71WuwDij32u6WgwEOqTe23N1nV1T7ydMqFfIsX/DRcoaS1s4/CQAURDpbKgE4/eS3bvmnfsFW4EQkXIRJmVvqHc2MSlr9mjxodTM/Ff1/Od5L6c42cDI/tWiwL2GCZ385mNW/YSs8ptCTRxWr6TOMKRZ51jA5UtcWB5EtJKiTy7PInCk9TW4HmB8tpywjv3YXXGPbRorfL/JVQgHPw/UJpJRoWKg/fLCoYr2Y7pszqsOXW124W4vZlNobTygXzLIZczIfsKL2NlRtFNLrGkx+byEi9p8yALwVoysxsNpgMj6CGziDC2Sp74BndXtCK4zmv1YME+UiFRvz+t2kACE2v35e2lGw7o4fC+Io+kOcdMoe/myrM+M92lR9TZWP0ZqtZoTFMYQOP0qCGUpkXYJRHNjLc6IhZE/fjma19iN7jDD/8mmcVfZut3Mma3Xr3aRNi9SJztTXAva4wVBTvxrO1pyIkO8AK4+bPK+xH1JrZaG7zyCDaZTwyX30iTedR8aXAPwG10zBYd2f4Mi7ird8nptllVjWfCkspinmOsaeuBy/VrQe5UlusCH607hkgf7e44T6KArQ2r327LEv7+23r26GfYnxgab8eqlCZco1K/boMxrckTceInWCcdC0V+v0tALA8kZKeTQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(5660300002)(44832011)(8936002)(122000001)(2906002)(7116003)(66476007)(8676002)(64756008)(76116006)(66946007)(66556008)(66446008)(55016003)(86362001)(38070700005)(558084003)(33656002)(38100700002)(316002)(186003)(26005)(508600001)(110136005)(9686003)(6506007)(7696005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I5eVzmw1UdCXVXaAZtJvJTQbUUqiMvKCEMQQ1hYFIJJoH21ia75KRLa01jO3?=
 =?us-ascii?Q?+n2O8myprQ8npUVGLWBJ6ZImHQx3loSWRrVhxu/gZ3xRI+ybanw/1fpJk+Pq?=
 =?us-ascii?Q?aknGwmglX743w8TBTUdwUcIEvGpM/PvVGPJGe/0Au+LFP3CEqwkISpH9EKyU?=
 =?us-ascii?Q?8NUyfAYQIUtras7TQhdp8zp4WsYNKsxFX5j/ZoJOruCHwTr8IT9HZpXX67cQ?=
 =?us-ascii?Q?OrV8FIx9FFV/tacAnv2FD5lMR+5XiBmZti8OhVpSEJR/UhbPhMqPeoKiWm0u?=
 =?us-ascii?Q?yTXe0RBZsBPrZi6b5VIZdk4ZMK/ZoBtGaQIMSP1EhIiwnxeDkdJlvJRNpPQQ?=
 =?us-ascii?Q?l5DmhPujW2ntLFy5vBZPoMY141D/qahh25TUQ+4hcku4fIwPSZ6qtqkgoYeD?=
 =?us-ascii?Q?JGiWg9QFSYK47pY8oChX9+vr+D+kmJWtTD7QtCtuwN6VfdzGlQORv7t9IFvh?=
 =?us-ascii?Q?s0Wxmzzu9JEB/Uy0KQPCqXu5zdoNpo1p99C7GvL7yJeFEL5xUlqwq7SRR8DV?=
 =?us-ascii?Q?aLlajLSnR50SXaE7ukeHfSll4v23BnZQGtvwI8t+O6meWutKaPZJd+A9rzLF?=
 =?us-ascii?Q?fRWESACQ5InPQdyu4u3ryddNaw7OJli5tiLP3urrfUHnZkGKvOaZlWB2pa7/?=
 =?us-ascii?Q?sRuGtJPraUSaUHkrxPkTKNRsI124qq1WTJoFNeRnGiR4j4/S2LalX/bSKIGW?=
 =?us-ascii?Q?skhssIIIZoX+ySebpy5Q9iTN5jFLNppjsNJcqYyZ8nEyvw17a7+LjngXHPfN?=
 =?us-ascii?Q?BXtEi0R4jJcYoNl9WzTbd0Z4qjJ3xE8HPkPMK5OF+P1v19EVuZ36+nTIOV68?=
 =?us-ascii?Q?rfte60cg10ViDzc+ODkv+FRPDDwtzDgL4f9hcDhX6uya3xmYQMU4He+Ullx0?=
 =?us-ascii?Q?wcqmrozU6IcutdL3FsDeltShLWx6LEtKVgN691bhXnmXP0qupwg2Mh+hhBP+?=
 =?us-ascii?Q?qyIzHoY6RTwFiMi/FoiktwhEfZvs4ep4j3cCeMG9wpo+bZ8M5pdBpj9ty38b?=
 =?us-ascii?Q?Xw6hA9ARQukme4BvEJftctE2/WWrynzWZ54ZTRWoLyZJf+D6w1YkTOBNcixx?=
 =?us-ascii?Q?Cc6NJtozRtQNPOksCbaJoipojhfCuRFle+WgWl0BRNWvGVxup5ZqLYp2u7qI?=
 =?us-ascii?Q?krpAd6dzgnv8J5trtT7r+3FmNySw6wxngIyTRwshfyh8prZyx5U44e90TmYM?=
 =?us-ascii?Q?vTg3dJ3tyM4gpYc37DBJsNXUXKrr1dCHZ35OtaMkDBH+429YialT/J1KGrK/?=
 =?us-ascii?Q?3X909gWubaQ5pB1w/5DFzBsZeS9ngrmjUXyMIB0NrE7TswzwnP5easmX3W1v?=
 =?us-ascii?Q?NqdXKFMxuIwrB7fFgsX6HLNZzqe/3TsOYHHpTr4ChjJ1aXbfeBSMidkI9Ugo?=
 =?us-ascii?Q?Ac18mwVpxh8QVZCmyB43cGLVUTMTgI8u2O4ZeuOSi9OTY2MMzMjKY/CP0Lku?=
 =?us-ascii?Q?vKCPXJ9KiIo5hsbYK5m5eRr6tFXzTDUXh+oMBYG5UOhk2GnfAhb6ECtZqRiM?=
 =?us-ascii?Q?01gDr4gsVCG4T4EiBQ8d3bOhOJxdYk5rLQhNyEsYqMMTle/Vh5iR4xD4DZKs?=
 =?us-ascii?Q?1Lq0JVAqVPyCL8B5QfwPLvrT4tXhh0XVhx41KAla1ves35JyupSBkvwr1AYG?=
 =?us-ascii?Q?+p0QRPF0JzY+tI7uSfq6wKs=3D?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cfc29b-3685-4b3b-d2c4-08d9fa99319b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 09:03:31.7778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o1/1O1wRkmyUcICAPzpKpUTSsZVWAQA+oL68y63WBi1NUJUFOGmjaJuIGeAxiJ5r3ImVqwsIoQyTQ4CM/2bjxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB3955
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=EHoGSzVW;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f400:fe0a::61c as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Hi Jan, all

Qemu arm64 inmate linux and root cell linux share one hardware uart, right?
If right, how both linux share one uart, could you help explain more?

Thanks,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DU0PR04MB941706295948C00D9D24F4E588019%40DU0PR04MB9417.eurprd04.prod.outlook.com.
