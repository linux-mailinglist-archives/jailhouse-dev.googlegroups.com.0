Return-Path: <jailhouse-dev+bncBC44VTVY2UERBEWSTWCQMGQEDLUKCAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F85038C134
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 10:02:27 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id z19-20020a2eb5330000b02900eeda415d13sf8480385ljm.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 01:02:27 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621584147; cv=pass;
        d=google.com; s=arc-20160816;
        b=zO/KoRydKrJd8YI4jGfeCdS+BX/ZP3qYgh7yFXzt7N6QlPp5jx6sH3C29VZc8koZ47
         hk6j6nVzHtavVT/dVeUPX6mHoTphvqM0beo/GIoZX602yTmXt0dW4F3KxnskqdGrw4BT
         fnXol4J/zAUjPS3vfa1llanohE2ESC3uT1uKJAnDtowy40xrf89nZ/rhGfWlwzOttwRw
         Pe4y62sqDvoCD/EpaUzTyvaapKUT5lEyxG/MzIZtahhWgdn4sbGlV/2HF3SHLrezPlKY
         /HOwFw1vZRkC9JxBm3fsdSKzc/30AmCATsBKaBAb0TfF43nUiUvHR22Q8pOoodPQcs0y
         RmIQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=eCNBaay7jmKClJZAeK5FmaJZFUoRCJtkRGxJI0KHlDs=;
        b=Nx+LcvwDnijStPtzZSnbMNWq5G4DVR5TorQAf9LI5YmN153jxL0tjTJiqMEmFCCSom
         dCz3HEC2vzh8DeO0ChAkcNpE88qVGXYwQd9BNnmGNjS1G0m0+csvv5o8oLgXovVh0xzZ
         Owa/LUU0ZtksRz5LVblaBpMcT+mX3AQBDnwLqrvebJCvoui5m/PJkFh7A1fMqIOXy5Ri
         VhRpcibSlWhd6c8leViBoVMwnXJrxoHG0xtSSxyW+ydwntBYoMPMJQ65AlcFDElWzYju
         arcOi5nSxapahlcj1J23JNGj3fcjT79iRegAU9gbbRPMaS6a8VI2hg04OfNE5Va3idFJ
         oeyg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=lqdPXNb7;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.41 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eCNBaay7jmKClJZAeK5FmaJZFUoRCJtkRGxJI0KHlDs=;
        b=SoUVtn/qviDVGvPx50HgihvOyfwhwTehvDIx/4eSGqjXImllwLGMlpaWaDiBaN0cjF
         AeXC6Hh31JcT2kKa40oj7Vqky1wM/ZiXh9n0VZvEkC7UurqYfVSsLG3QETdW6BAT9JM3
         X8q8h7UTR2FEPQ/0iLnVddYNkwoR77Or0p/tyDY2S59bZ7nGqy8opeAggMQfilia+R1C
         YQN6hUBc2r0gsMSlKbydnPxE01GqEVcmVybYishu8zzKoDn18E8pXg+LsGJ9OjFY7nNa
         zhrMncIZlXAbupb22Dg468xOx0fMKy+PWS54TxlzOFKjaQMTs+be+cVqFuNUZUCmYiyl
         tOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eCNBaay7jmKClJZAeK5FmaJZFUoRCJtkRGxJI0KHlDs=;
        b=D6wwss/CO/iBGE88pMgoxaX1Bvk/6SVpN0p0nayrRousmNdwYUkwdBxaY9hpaF4Xic
         voKugooKWZbxjkSWOr/usL3qofJL63Oip+8VEIaRoQXXe/xyjhKtW/eimpbF0zXS4LfS
         2NnlltHLaVtsnYQwjxcvtKjzzgixazd2Gs7ix957d6dJzV6LrGyWOj/Koy7IQtAFcEEz
         pDis6C7Tk23sOXH8ZARb7jdEOTy9sMIv8NIZMwFtAG1VRE9TAX34YnlAG7J3cBVRsXIT
         MKlgydyi6udmuRsqDANCwiaYveB7VNxzafDZR/kFqh/Gg32ijiq3WvRwFpU/kCQoeMqe
         Mqyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532oWaJGDiFcjaVmVjr8H2BJOLpPr67HJSmBFHCAlPW6kRZAio9B
	TwIEKz1IWlDHhaYH5s4/EkE=
X-Google-Smtp-Source: ABdhPJwOJ3UpjurRVEvczmAkhXZ+tYw3XOPS+s/+2HPv3dk5WjctRrcSQ3q0gnajV1U63qnwgCvE1A==
X-Received: by 2002:a2e:b5a3:: with SMTP id f3mr5945808ljn.96.1621584146763;
        Fri, 21 May 2021 01:02:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:592a:: with SMTP id v10ls19863lfi.2.gmail; Fri, 21 May
 2021 01:02:25 -0700 (PDT)
X-Received: by 2002:ac2:4886:: with SMTP id x6mr1390565lfc.658.1621584145762;
        Fri, 21 May 2021 01:02:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621584145; cv=pass;
        d=google.com; s=arc-20160816;
        b=c0hxNfBUChQv5MbAfsrl+Iu474/o8JRP2ytsHd4gG0+Qg6LJPhwVRAgMOvDAcF/zbx
         qNAthOHE1v6mP/Pw1l2eDf+oCspnfZiLSuP33IfWDDUoeMg8Y8DD7wsvNJ+gXShWiL2z
         cqf5UgX7FQJkn9NQwQZUJuKJSA5kF7VE45vZEAKxNyc4hGEITznx2V8dfauh6fGzDv5v
         z8fQ0aAtZw3LB6oM+AmpwMbl/8EZ4Gc8d2rs/0sEIKPIGE+920oFHlNUkUeaqp02ACDn
         J5Vp0oFqM/Zh4N4qzVwuJmXq5AOd/gGD4pHiz3Ndbge+4d5cVR833JiHxRjvjr02YPxM
         +kUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LcsOmshzvqTJIjUcKwxnFGS1x/QHaaDECtd9bELnQg8=;
        b=Nr1LWGqky83oVPWBaFOQOAyy81Gv25BXI52IO9oRQJpBQEt94KXAQ0IjV0SKNpYjIj
         RMqsr/R4FNwpShNEGzAL1IeACCuy0RMKFERECJ6gANoe4FwGW12uH0YAY6jha5MiG3AC
         s8E7pFFkWqEJiS/gZeaBxAdjJ+afwBZ9vEYgZc4tDrjVMeyOXfxmWkn6N3kaDiXHoKQM
         WbShvUUp7El7kYHVQ1e6cBB39ohaYUEHXbLXa0N6bUhDe64y27uOpysHyfh+KnbCxzFj
         TVtdjx7hi38w77RiNIuIWypJ1n1sYNrKGPOuiZSBNhXl8xaP8KVy9uw29jDF/nnOj6y4
         iB4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=lqdPXNb7;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.41 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80041.outbound.protection.outlook.com. [40.107.8.41])
        by gmr-mx.google.com with ESMTPS id e9si269008lfs.4.2021.05.21.01.02.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 01:02:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.41 as permitted sender) client-ip=40.107.8.41;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrI5v2T2ui/TZiLl/e8WLwOK1bNgtpXF4SgJP95gMylcOIxXkIEBYWxuEbkd0XfQ10wuX04SGcpA5x9D/7RuxfhX6QY/bXgi8JlALb4whGx1a0kZLMg1EdPXMRJ/qtetmbOv3+/k6mB7QGtpfkTCKRiTg0t6i6WK+Q5/gr/4RE6xF1UKmDUWctiBbVUXcZqfTnNHXnAaDejHDHGYf3oFb3LA+qeAZ9m/Y3y0o7qWF97nZTLIRkrATYvN2DWRF+UxwIlv+y7Ag1RU444rbR0CQyEn4e3R1JdgK3VX+YYfpswAFhCClfTUX0P1QOnf6evQk7ZzsZkqIi7311s8NdVzdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcsOmshzvqTJIjUcKwxnFGS1x/QHaaDECtd9bELnQg8=;
 b=E3NYTJ5ISGaE3wEv+5mS6qZtNTaqlPcFEPW/CFeeGVcL9fKe/QXg5+Y/h/m+KFLgrqN6NI1RK++fCJHTUWnX1iKtKDidc7KHSdAO3VPeHZjYukAtWNiOkQ5uK7Nnfa95yG0SGiYE6hfXf+3HvSItG/k26kdy3gfezUWMesffSmGHfWL4Sam0QFwH7BUgqeg29H9/Lzfsyk/GHlW3ejpmdlZmmiA947Sb0BACQfdcff2WTWMQ+vcR0GJOmOwxl/Jnslhq+mgRZUr2g6rdm+5qYdpeoLuDKnjSLyrUvnJvs9QkKV6cNtnescV7Qyn0sz1vNhv1EXKp4GG/yYj8sr0hQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB2418.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 08:02:24 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 08:02:24 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	henning.schild@siemens.com,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH 4/4] doc: Migrate setup instructions from python to python3
Date: Fri, 21 May 2021 10:02:11 +0200
Message-Id: <20210521080211.487380-5-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521080211.487380-1-florian.bezdeka@siemens.com>
References: <20210521080211.487380-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:e180:2248:7590:2b4d]
X-ClientProxiedBy: VI1PR04CA0109.eurprd04.prod.outlook.com
 (2603:10a6:803:64::44) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:e180:2248:7590:2b4d) by VI1PR04CA0109.eurprd04.prod.outlook.com (2603:10a6:803:64::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 08:02:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 594f9901-9489-4296-dc12-08d91c2ec4ab
X-MS-TrafficTypeDiagnostic: AM0PR10MB2418:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB2418AE0169C0DC317F745118F6299@AM0PR10MB2418.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kX8EYw0lpE5A2/4mDIRFgQ4ZuG78OcCxjXmrUNfZIQR7pSIyGYf9UacgRszCKSL1bBQLpC/dvmTyM7thAGC4Cyq1QvZJQ0fbVBhVQUhiEBaXrS20+n470tGpJjgVIBYNXEyE+w7lsRhl/2dL0cChKAjAhiR6e1RnMj4L8/HJfR9+jMg41GGI3z0scmB5r9OauSBgqRCERuSkZoBLZ0kj9NHBNH7nV3WRHJru0E2Wu/ISdmr8nRsKL811AvghCUtdeBDAtLb+Pjf5gMvMJnPo84ePX5JOIqtNYVr4pbJKYOX3y0H9P47QU+1N/j5r//FeyNTi/pr2chZCcY/LfUrVbbSZTd3FuksdiKpX4SDiUqnSVmMOXcKYzK6+zkyrt4XuuxUbDbcuxgcHMAx4+2gGc93Ym+VYfYwl5xdYZZmpmZz6/DOgTi+ry9IOn9z3S/VBNPcVLKCmeK6FDtGkuk+E/5sUI/GJdh2Q93a4xM8hJGWDMoI54eV3HpqW2iwE2r2QXizbtGw7/TVeC5sldBaR3JtiDCqNONy2d5spFZl3YUYJj9JapVqMnuMXreUtokPUrruJnW39GGq5Yl7DjtjEVpQjTQM/9BP0ReSODG9Jx0tYpng1VrUr9qmN/Z6WpFSfo60po5GpGD5OoQbdJdlaEj+QBSvQYpE2u3No0lWH1ci+8IYARtQd2r1or9Oryr3uoUjKSUGEYRqRCUXGtx1FqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(1076003)(44832011)(66476007)(66946007)(6916009)(5660300002)(8936002)(6496006)(107886003)(966005)(16526019)(6666004)(2616005)(316002)(478600001)(2906002)(66556008)(186003)(4744005)(8676002)(4326008)(86362001)(38100700002)(36756003)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3/0s9SUMtmP76IQjL6pixGHc6Q8c40X/cjiz8e6HSTPO2Fc9mL1EJQNZn2i/?=
 =?us-ascii?Q?80zKXuC6S8R5tUac2HeOggGFux6jSJuWxymgQhwz0wjUlv3p5JK3Kdxh8+0U?=
 =?us-ascii?Q?Ex+VwBBeOV2AM9YI8TZx9zv1UY+fE2icPYjt/LxZ5ayrS2dxwXHQn8oOJL4F?=
 =?us-ascii?Q?ogJsgFE/pwBJh7X+0rgNoPoMxJk0dyVhj6ItK6RTFKMcAQYS/MQPjHd/u4WU?=
 =?us-ascii?Q?lIFoaIYQGsa1pBzaQW1FrggNAHy0pzUPT5gWSSGrxUEMnkAO6/cm4LGKnrJm?=
 =?us-ascii?Q?dMsP7hc+ePMmsBjlFaZ0u7WHgieiwi1SaRgsK4H9Uv3aDGIg7XdBOcRY4gXR?=
 =?us-ascii?Q?Pu5AKEzIw8uDQl+jxhT+w8/ZUaFNaO1CiVa63HBtQ8ni/e0V6USN6PUCn/nL?=
 =?us-ascii?Q?uHEIIukXriTPjH8393SxCNN7+YEzDGdppbS71bwql3Jqc2L80T38CbmizKc1?=
 =?us-ascii?Q?Iu4e/ZcOF1FeFYsAShzDOXN6mCRrcbzKNgpLq8iRqzN53f/+ufdYX0b3hdlS?=
 =?us-ascii?Q?Eq/WkPE0w7I6P+KoEiPfUVIfNoivu0BNCdgwiqHE+c8OrvWATXqPqpqacBeS?=
 =?us-ascii?Q?0F7uoAlyyBfu9C1TPjvdQstJ1rbaOXIS4v07JCLe0bwjfPlmZI26c9Hq/X+W?=
 =?us-ascii?Q?Cvf5X7oJ/OPFg/pSCh2sJqbjvqlLgsNBxPRfgJalMBUT/IfTclUyNdsHzR5C?=
 =?us-ascii?Q?BgsKKRkVOC9P+CGC6FkOAqW6B36e9dIHb1XwlVr4VCrWTK/l3v2eouhiXvUi?=
 =?us-ascii?Q?RTjza4Pj66OIb5SxyHH1t4muJuzm3TleDKytkTCd0wgpJmQs5fCvjQ50eWse?=
 =?us-ascii?Q?g6v+jv1aJzsi2ABct2UuGq+oHoshT/HfHzf82kUxNhSF9USnAUO4LmND+Cw3?=
 =?us-ascii?Q?zzpdhDd15KSizPqbEypFFJYE8nsxcVmY/CNFGGgCS848yo0VD6oJ0cUiJ/nK?=
 =?us-ascii?Q?qBjKyLduT5t0Irda1kq9HOg1oLIa3+/lTroOXFpvbjsSjcnKrIt8sG8wi9o8?=
 =?us-ascii?Q?gXRNWP5XAqoss6pV+YFbOQI2a6//pB9S7fp4ZIQInX2t1cK66jD+54IngdAV?=
 =?us-ascii?Q?NYOC+pCWtyn5h2TGFDb7sbCFFdDi561+Zija1z1MjkzIGX0X63G8Uw6x27zL?=
 =?us-ascii?Q?kWz2VwbgxHqMF3C5k+DqwsTmZD1xIYIIRPD9xYtP+JgdoqPvoxlP0JU6e83O?=
 =?us-ascii?Q?gdV+P2IEaZS9RlNMxaK1cFxeU9Mq+uIuXCHsuPuCZTJdyyIBge83Xtamo6zD?=
 =?us-ascii?Q?0xOx8VKOOq+CgFFfEdKwZUPomoX/UeAzk2li7cm1eZS6z/4RiFUT2nQEDZct?=
 =?us-ascii?Q?0hnyPTrYhP0RYiTl2EP5DY2tjLWB5z+gM6+y4Hyh4oTlxAKKYQJXa8nsJc+X?=
 =?us-ascii?Q?15RS41GHIfmc+H1RGipLtepCtEFk?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594f9901-9489-4296-dc12-08d91c2ec4ab
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:02:24.4785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pt0TsCxxeGjpdd6vV7/+rCJGXCrpTf/ESlZJ0L2RP+XczRyCY0Rz5URxi2zu2Wy4xW+WZ5Qo/zZRzgYeff5cNgeNvtj5ZBN0NF9A6YijJ7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2418
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=lqdPXNb7;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.8.41 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 Documentation/setup-on-banana-pi-arm-board.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/setup-on-banana-pi-arm-board.md b/Documentation/setup-on-banana-pi-arm-board.md
index 115ff66d..32f6c949 100644
--- a/Documentation/setup-on-banana-pi-arm-board.md
+++ b/Documentation/setup-on-banana-pi-arm-board.md
@@ -228,7 +228,7 @@ $ sudo checkinstall make install
 * Building Jailhouse (mainly for FreeRTOR as a cell)
 ```bash
 #On Compiling Machine,
-$ sudo apt-get update && sudo apt-get install -y python-mako device-tree-compiler
+$ sudo apt-get update && sudo apt-get install -y python3-mako device-tree-compiler
 $ cd ~
 $ git clone https://github.com/siemens/freertos-cell
 $ cp -av ~/freertos-cell/jailhouse-configs/bananapi.c ~/jailhouse/configs/arm/bananapi.c
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210521080211.487380-5-florian.bezdeka%40siemens.com.
