Return-Path: <jailhouse-dev+bncBC44VTVY2UERBNXHUGDAMGQERMNTUDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F8F3A7AAB
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 11:32:40 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id m12-20020a19520c0000b029030e4d9a1472sf3540990lfb.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 02:32:40 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623749558; cv=pass;
        d=google.com; s=arc-20160816;
        b=xFAwAS91aJcq9uwxxZDaPgolMhBmlRsv/ZzR7dSOw9bamjfH9tMdkOg6AtS1lMNqhn
         FXw5B4lMlUSj1nA6F6Ukwi8YmhM4hWQO0bKGyfS+HOI7ykEzmCl3etuOtR5OgQH3UyWR
         4HFRk1P06Cfj+fC3UBMZgc/J1/Ca0TDmTHWVsiss7si6I7sQV09SlnjZRCERBNBdp7of
         Y6RnQyEc9HzP80weJbrwfrd+dE4ycfRNxVPCxxIS2VTwKxFA+MjeoSwADa5eQbSS/lXp
         V/3q0RREsoMzRhTbClqN7ZbFDkwyvaARMMo82kbPRzGB0POdInaHH4OtgljJy+sDEceg
         A3QA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=1Hy+7JmpjczXsLcxJIfQavGyg/AexU6sj5D5QkFkvxg=;
        b=xwU59B1RIAFLJLTnYblVhXe6hp5NwXjHMR57c+rpWxj0fUUbZH+uSf/WblRk0rm0m3
         8Pvs3t/0UhKAQDw2IHca/NiepYkdFhswdviJye0PjM+vdvIYx2mNU27KXCmkBzPs5Qbn
         2F5Up0dG4bPW24+HgVoebgp9s5ct1vV+QM23UkjvCeW+Pwf3oEnyNKDvTeDbcXaTWwP/
         X/oUPIEaUVjylXquj9nLCmp5BdxOb6aAoJW+k4yW6fEGyo0fC2qrPbup8HIWSpZlzbfQ
         gF8+aPfYkWiOveteGexp5SEXCwZBadxoULC9Kk9tcRA5uhtD/7TLqUmlY2f0jEbvGgMD
         J7Ww==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=UcVG6fyI;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.51 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1Hy+7JmpjczXsLcxJIfQavGyg/AexU6sj5D5QkFkvxg=;
        b=YRWP3WSaavDhZ27X8STfFxfrpS6AZ6Nl9e+wbm4o00X5JnGVplxvPWLEPGe14UeP6c
         4U4qL0xCLI7N60UrFyci93mug1lsb6yqfQtg/XEW/4/Z7kt9kvGFwEYwtwzVRdwXSPlJ
         xX7a1SuU3JsUH6X50gw1CTVvCTKE/Vt8B2v3dlx6mjaB+RDnRZeb6jo1fJmyfED4675F
         yqg/rWF4a/BOBwsit/faa4VL8bdbcuCQaOh1dteLB3tXzWxxT03EDiQ9RIvijtk3rVxx
         Vq/0eqbXR3q1079928O1pxuzrlVSEJ6vzicjIjaLYcqieJiYahvGdWnIJdfD0nkHR63z
         LliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1Hy+7JmpjczXsLcxJIfQavGyg/AexU6sj5D5QkFkvxg=;
        b=feu/HYfxNNpLk25aGDRhXyAF0dmugJsKpLl8z/l+v2DIxDofnFcITzSsc0kj53g1bX
         SpEcr9BAlNc3H96lPcewWRqTR2cn6uuhi/VizlFRviyZRcFtA4UityIi0ljsRvfhuKE8
         vGYvNMy1GdRYoAkhbHI/qgH0S9fuCWnZqG4r6ecjIdEzfzbqe+KT/odVCc0v84h9JYXu
         WOhOs5J3vyNsVglxbSqy6dYxfhBnk2lMjMcp0YWlBHklZSIAjymSsfeJHEX5YpTWlkPs
         Lxj05ZJshRHJCtMj8Lf7y68reiMq3/6INXakc1CM1ihOeuut36MGLo4yoOqlRD79DX65
         chtA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530MDgdkOW7a5DUaL1t9Aa8S72ER4BQgs5mx5ABs9QocugfpZqYo
	Bq3uA+ey/EdOihKQn8Gd66w=
X-Google-Smtp-Source: ABdhPJy5EyqJuUw87O2jtxojifpG1z2C8XZ7ZB37MVWSVb4/0DFTg8G96+mj42/zbng/4czPW9QDYg==
X-Received: by 2002:a2e:3510:: with SMTP id z16mr16482374ljz.281.1623749558499;
        Tue, 15 Jun 2021 02:32:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3b99:: with SMTP id g25ls6091634lfv.2.gmail; Tue,
 15 Jun 2021 02:32:37 -0700 (PDT)
X-Received: by 2002:a19:ad06:: with SMTP id t6mr14839786lfc.424.1623749557448;
        Tue, 15 Jun 2021 02:32:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623749557; cv=pass;
        d=google.com; s=arc-20160816;
        b=nd6jN2uaR9wgDPeOwtYdPUMCQWYnlGFf/CGgTa/O/EdbJ/p89zPgO45BN1o9gcEBl+
         i4T59yDT7ck93VAIe7qM8KYHSnuqsxT5xDnUKO2n9hxQ8wz+K8gXtvZ7FAAE0mzTO2Ie
         CVXSv5ryHM3Frzw28+2eNpqeDQ4bPkgTRYAcz7I6pnBqUQjM5oRQTzbDE9igZNcKneoO
         VBPM7Z2ch5Jh9LeqFl5G3AyBH+7V2Oz5h8OKAIjKc7ODRFO8i2dIVSOeVmLUHYU8qXPj
         xlLXcH54azMahPEB9R8gty6uoG7/wcdPMkLw50c11xPl+70YYACnQBBJi5ijN23B2FtO
         ZqfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uVt4wCK8qHK5lZM8nY1yF8Mvm54LS6Z/qMmClRIw7Wk=;
        b=Gq6KFfQIwUstYDO4MUE9d2NWxE1RpVhQHHvwVSJiagGXVegsiosG43ummKcJWO9qHl
         tLIvkQ1D34OQyYorxijigFHHpdqBS56pyWf3LDADwhyoqwzBpQHa6pEqZBlEeC+hY68/
         MB3FOhpoNDzl+1bgkLVJZ2ZjUfIyZay9fiDCRK66hvUa1aV7LWLxCu6H0rfy442OxdAS
         mox8jPOpLy4CGTf7liDh+M/xi5ceVY7i0ytMMH3jRI0tDUtMXwAE9e2vWF0YpcXFSQdN
         Ejzi9ASpbrcHHsIfs+H01ForKNVKls4/Y0dtAx/1rLPQlUZQS+rmpEnNehL/XFU+QIra
         gfjg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=UcVG6fyI;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.51 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2051.outbound.protection.outlook.com. [40.107.20.51])
        by gmr-mx.google.com with ESMTPS id f17si100756lfl.4.2021.06.15.02.32.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 02:32:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.51 as permitted sender) client-ip=40.107.20.51;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lymaf4cpiBEF5wytMI/M93y8Tj2UtYRkJ5cJUTZc9veJSUmPTmhI4mP/frH7J8NMnzgQl/7bGb2gBTCwuB+1kDHWvCX5vIlPlvTZd/LlzwpiTe27zQGfz0E5RCStAY1yzWUERLFGqgAGOxtloV2WIG+KD30fM8eKGAAv98WTdn6aO0lN1eH5LmijtyYCVhCcjXYLonqeilQQMKha4NwIlyFNrzNypxMBliBnJ7YXLfbBjdZH9GXA736XlH50j5z4edj+kCqZlpKorNTTACvAfGHghou9ZDrW/X7s+ILdPwCYy9UrYo53CU4Exptq6isNGukkFrCv0H3eGWSJo6pz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVt4wCK8qHK5lZM8nY1yF8Mvm54LS6Z/qMmClRIw7Wk=;
 b=SdbwxID72m7MOofYwcZhmpYLYDlozNS5GRrX7WQ82E01OCzmQ+r0sGNLx6FSNCHgpwIy8SvXujybRHWX+kWnZk+EcwMdYAClBoNAMda16LJ2Wfar8+87/wSLhsG35mkGnAKa7ojD8E91/zPICmEwx7XK868sC1rOdrBRg3MmNrEeNo7n3r05N8UNW32VTi1rLsMBWCxTaudGhokYyTVHdcAGune/5dFhY6eKKkemLrP/ONM9CA9lF8nNKb+Fb0wrts5RjTdsjIJgEkK+yUL9EQAkcuYH5hXhPydccVzBQ7cHhjKtai458S+yyihyEeukNj5jA5VedkXDfbPyUOyqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4216.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Tue, 15 Jun
 2021 09:32:36 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4219.024; Tue, 15 Jun 2021
 09:32:36 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v2 4/4] doc: Migrate docs from python 2 to python 3
Date: Tue, 15 Jun 2021 11:32:25 +0200
Message-Id: <20210615093225.162909-5-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615093225.162909-1-florian.bezdeka@siemens.com>
References: <20210615093225.162909-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [178.27.125.62]
X-ClientProxiedBy: VI1PR0102CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::33) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (178.27.125.62) by VI1PR0102CA0056.eurprd01.prod.exchangelabs.com (2603:10a6:803::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend Transport; Tue, 15 Jun 2021 09:32:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7017e8f0-2617-49d3-6b34-08d92fe082a3
X-MS-TrafficTypeDiagnostic: AM9PR10MB4216:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR10MB4216914C6D64537BD6F5F634F6309@AM9PR10MB4216.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5n8otu+3Px74XdgMMbEOdHkhej+8QpXp8DhLVlTI8LywZmEJj6cpyPYrHNZapfzHoK5qVr+Nd96SW0tnyM67gnl2ZMLAVdlALqXs2i7G/uMxLApNTjX/AH+reH8tvZggF54BLMBK/1FoAamhuIaFD7ao3eYog23tvzl9PIBriFOpdKC2FHEPLqmcnFynRSiGL/Kzsj5LF6FN1fnxHMPQwaAFMltmckbwEjmhrbzECKtOTvgios0f6UX1suf+iuNooP4FTKhkOoeVcaAziNc5qwDrrra8T2eKqgE4kKyD0KfPjw1ZLVbfQZKG/srDKzrfnpP+WRW+qnCbZBb4/6DtM6WT1BuecGe3Zt+ejrF7RzUCBK7bAoWMxwBfV7KViCBdcUZFF2bvo9v36a99HbEWvQeEZHul+Cba8EoUiosnUCsayhCdoY5XuinUQsN0twULvXrYU7naCirbzZ+dpw1G7j6PUc32X7nLDBT/h8JM66aRV/dTVOV/gz8UgshZdETeIMer7DTNjcQmm+kIJbncMqxNkcHuGs3FygTN7xIMrykt5tfl5c58m/iSUvYjgkm/rg5lhPA2+xPS7Z7DMEs54NKM5dH54KeX9SluHeDBmuz6PGW3z596YCs/r7Vq35AEyuvtdfiZJtLfMV+LFb9kpVT9TcI9PkY3f8blQ6a384pubAIFqkJa5deQI7qSCdSoX9Ee4HNt3hmVK9EA027Y/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(44832011)(6496006)(478600001)(36756003)(16526019)(186003)(86362001)(38100700002)(6486002)(8676002)(2906002)(8936002)(5660300002)(6666004)(66946007)(83380400001)(966005)(54906003)(6916009)(107886003)(66556008)(66476007)(1076003)(956004)(26005)(316002)(2616005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sysMaXEt3VU5QEjQYNR4MCUOT2IGxmYZa7fPloQNLmhqExrDyoJQpd1x7/lv?=
 =?us-ascii?Q?1T6bmE0e1q0v2AJ5DXz/KYZazfmcotyPP2m0y92wZkDBkQg2Yf4Edi2066yK?=
 =?us-ascii?Q?xqEeQQuv0MJQysQam6P/0GBXspwM3DFF/Ly2/5iVtT1IEHEenZG1COAHi3cC?=
 =?us-ascii?Q?UFRUVBIrLsfgYtC+YxQfvT43el42pnCErjZHO27NTz2HpN7xBVQluL5zcAbP?=
 =?us-ascii?Q?YbbvzgR7tHsHqz8pLxnzDrSJlyKE3N3n8FtXCnk576i8xKNP0/bLbU1Y6NcB?=
 =?us-ascii?Q?8Ju+vN1H082898N18DAioyT3mSSqK3h2r+qQ3bvPCbH7PrTY8HA/sraAy74b?=
 =?us-ascii?Q?LTUS8rJ/KEsQpnXG703dIxOKa9aL+RCnkL9Wlbm6SuIwYXYy2W39Mfb0jnEA?=
 =?us-ascii?Q?OR79LqcxHPASvi96/KTgl6h48m5YLAO7rxfoHabrr57c1O38f8KgI6FIuqh7?=
 =?us-ascii?Q?UcEXBy5V2/Kh9KyhbVzl2sOj9gd0NcYPMMBsnCCX9y/L/0AayaGXuXgcNRY8?=
 =?us-ascii?Q?BDl1CqtgKHcr/7Ez85fPI++hNuubmJfQawksN8wukDrITaSZmvy+JnEcwxpI?=
 =?us-ascii?Q?bnZbqCp8XGBbrW2EX3xtHHriUcVdsivKKogeowr23uSBjoMy/fr/Wu60Ul84?=
 =?us-ascii?Q?YNuWZfSGohd8sDp9BU6sxDE+D64Y9K1Hehl9YE53UqV4oXb236v514+5O+Tx?=
 =?us-ascii?Q?KaJuLa+pAek3sCnhIdKZor0BWAKzhiKZiPacGqMPJkskxORqVMH9iC/jDI8w?=
 =?us-ascii?Q?yRwblkVt3b+gOpK8Oy2CbbqZ9jIPEVSKVpPgLhQ0E8dQ+DF8NbRlLZlcmEo3?=
 =?us-ascii?Q?WFZPUfmPxVWgbB8fdr2V/aAVLtzT5bjApGiBsMNyLy5c6Xe30FZ9d+L+Ms6X?=
 =?us-ascii?Q?7zqjqh23ex0jaPLwXWaTRtwTBzZlkbbEmR070asBUt8Vggvvzy8X259sSRq5?=
 =?us-ascii?Q?DoA07Rnrh8ulr9pNBuBw/p90UbFycmVhVLQW7UjEqA9HWHIn51LogCpK22G5?=
 =?us-ascii?Q?6qXFMWcWEaX0AAyja058l1scr2INpSRDffaI/kmaUtNhhTtoVWV0A8sCETTr?=
 =?us-ascii?Q?oFnOgX7fNKLGPR4VUxtjwNDjt+TQrSxLr3Inv949VuohBsRweaj7+SJg9Vof?=
 =?us-ascii?Q?YVexYrNzgpfS6fpnEYzS/5yU9nE/nPmvXc2YJWI5kFx2V4D8+fdopMg3JPGZ?=
 =?us-ascii?Q?bDR978PzSK5iWo5896cchApK0wS6UZ5AdLbONksKrgEr13VcBjPvseLuPz5V?=
 =?us-ascii?Q?QYt6sIgA6mb5pw9hX/BvRhoe/cIor1FLlC3z1cMOYxBAbUZxWAN+HakWvsmL?=
 =?us-ascii?Q?hZ89JcLwn+YcmFT0MW3i03Le?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7017e8f0-2617-49d3-6b34-08d92fe082a3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 09:32:36.1253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3vItltKjTjyO76GgfIEIJvySAMU5hK2fjROQOn+0Sttt8PVTgWzwBUMj8vDe6dYrmRQWlHfwNVBt8wOcwQ250TOfAJsTfRdiiJ7mx+ROto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4216
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=UcVG6fyI;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.20.51 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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
 CONTRIBUTING.md                               | 2 +-
 Documentation/setup-on-banana-pi-arm-board.md | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 249618df..dc4d9785 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -34,7 +34,7 @@ Contribution Checklist
     - seemingly unaffected architectures still build (use Travis CI e.g.)
     - static code analyzer finds no new defects (register a github fork with
       Travis CI and Coverity for free scanning) [*recommended*]
-    - python code shall be tested with python 2 and 3 [**required**]
+    - python code shall be tested with python 3 [**required**]
     - the world is still spinning
 
 - add signed-off to all patches [**required**]
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210615093225.162909-5-florian.bezdeka%40siemens.com.
