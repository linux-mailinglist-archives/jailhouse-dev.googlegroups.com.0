Return-Path: <jailhouse-dev+bncBC44VTVY2UERBHGUTWCQMGQEK36WQLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 722E238C155
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 10:06:53 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id z1-20020a195e410000b0290229c07c3305sf4701871lfi.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 01:06:53 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621584413; cv=pass;
        d=google.com; s=arc-20160816;
        b=KK3tspBGUyEVDy5bzFYSdLeGkhMyA4tW4CbPnUwbIWhnK41tGhGilJxSHIcYKCJd3S
         3/XwjswRvirXyv+wbM6qULG4NAr7N9TYTZgIxsN0DK7vLFw6HqWIjm9DJ0fX22R+ggjo
         PvlE+pNDoOfkzKg/YKB+f/5rvLZmxW2dNk/Is1gP/MfpCPDPPeobcZx8sLpSGQYpPIwC
         ydU2XApK5P9U64xdzRHq253i7oYYSA866Beug0RRTXW7iAr0oSjY4luw1ZpqDJh9Oo2b
         GJdvp+NE9AtvclVHHhSQaTOtLCpdElE9iAEQBVcAqBqk2qFFyb2aayiSM2NqTLfXjdXx
         u81g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=iShWQtiMLQBYN9fZ0LxidrtXiCTCaoS0KnP9lZFBDGM=;
        b=Q2njF7X/puJf1qu73kNp2YVVFQi8zry0cstBqOjiQ0WKPXlG+YU3707ivUIUQRQdla
         4T6dgEZ25d3orisniQBEvzD6i5AcdzVcEf3OWs/jwL2Rm4zFyGrOfLDRp/CuHKvnWhHQ
         jYNDJamqk0MaRhDaF6CNdvqEW26VecqjhOmnhSPMCmieidmgKhYoNoRGKULKYrMyzuVk
         9YRq6qTsju9H2e10Kny2Hacdx0fu3NEPlh1d8xGKPJ0WlGGlpVJUBfrxOsSWdHiYs6GF
         MlshqQEEBv8qIa0y6VmEO3aX7xgiGwssy0YhwdlE875Bi2w2R1yFYyNHWHSjROW/z93I
         0KTg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=E4d0Vxy4;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.66 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iShWQtiMLQBYN9fZ0LxidrtXiCTCaoS0KnP9lZFBDGM=;
        b=Vp1bjQADR9ZVSsMxxQpmPBAVGh9fKJGpCwn8LVn0hnGPpa8fUr6xln5F/7vzjFSRhp
         AcS+uMyMcpSj7Ejz4PuUhyGwelH8aXMDw5ggOvh6iRcHkmvLmNt5kGe1bmwMSkb+Zdwg
         vur3gxrsD79WIOgiR9pQUmvIXi76X68q79DwLGzW9kNkgxwsY8aJhrEiB05KAHatbuxx
         c0w08TZIIvJQPoF+xmmnGIbgZf4ZqEWkY3tOFrzotu/4fCDERejabm1MvpvwbDMsoMwX
         o4GXoYZdWU5zcEmTLcxBZ4LmmISArpQj/WwQU9YTU0zZzmLZ9fpmNi7UPWQzBHFepLyA
         wOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iShWQtiMLQBYN9fZ0LxidrtXiCTCaoS0KnP9lZFBDGM=;
        b=d5OiOtiaO+43bERZrsFzxBACjs6MWnbcWw5QtBL2I4jkv2fPdxYjfhRISwC/eCgMLn
         uSjvs45FIlImhfgjP1+M587Z/Sny7oUKhDm4KoD8hbpEPOLYAW6NN85NgHv7kwAMejb1
         QgifvBkxRNhB7Hvlt/AnzTFG007BugH2spCfPtnX7E8L6NihkP7Y72grCMQlIL/acbix
         zIrXFrQOYWQdeqYLl8bJ2HrD/RvWVePzJsGkcRDkO0VqGuaNsoSwfCtwrG8ufL6zZZQk
         FKg1IoXfxB67hQJxPnEtDrCtizRL9talN+bHwuD+OpykBtrU8SIFkO5TnAh9kzHGLKl2
         HirQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530NC2HN9vlvmUPwQ0o6V07Z9/o4NwZ8Ct2oxLTP1f8w1H9EkEAz
	PrT5TkXaaI+UwC6sgSHyxUs=
X-Google-Smtp-Source: ABdhPJwPjDs2KZIfXNva9hFhbeHl45YqPHmjrSTNZzii8rI2ERMSe+lZkx9QT4/FD5+VreGI0NT4+A==
X-Received: by 2002:a05:6512:1390:: with SMTP id p16mr1374416lfa.597.1621584413017;
        Fri, 21 May 2021 01:06:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7008:: with SMTP id l8ls1058176ljc.4.gmail; Fri, 21 May
 2021 01:06:51 -0700 (PDT)
X-Received: by 2002:a2e:8142:: with SMTP id t2mr6109081ljg.358.1621584411839;
        Fri, 21 May 2021 01:06:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621584411; cv=pass;
        d=google.com; s=arc-20160816;
        b=l0EqAOx2xfiGUp+oU/XU1RKULPUh5hLe6nzcJWyT28K+c46kX8qoc+5UqApXHuEwzb
         lFc7nEVpVD+eULPO1tVR7qrP0TThAQGdDqEp8v0cEqOjL8CrGL+1643oPQ567C68ZHNs
         1jNZn9cuGm3OIHS8DLUtlGrm5kVYDrdHNs+p+7eeN1o+Xaha21tJq7lYdP48l8UAtRtd
         V3PhvDTiUlgDVKYOErNP40iPi+LFXiXNojwjk3wnExZjT2Y9b8lY6j5PednOgDTg/M97
         xSHJ7rYKi6JrmcisE/03yjQ9sSrOZG8ZsdFU9Ls1JFxRLIIw/R6b0CQ7W9CqxF0jfKBZ
         3d3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nevTI/+3mWO6ddpi0J22ObKzVcfXFdiLjKdRV+ZT6RE=;
        b=ZR6WY/7Q8LZZberRiHdZp9NC7cV+w74IjLYLSGsWDPV2CwH8r2ZkR4zUEhOPi6C5x9
         bLNPggmZ7WgTWkaJ5GQu4KccwgyTKw5EHorhGiVj6pMkWC1dl5IzMHUZER0JxnJ/pofc
         eIDg5jXfJSYRdFmf43UAN8YxaXDedcQ8rAMNZQrxAgnk84UwSjObuQf1aMRPrrR9KZzi
         TGEU06ZEV8JX6KEjCL0kjHC/rXQHWZotR5MgkrgaNa3/xPxlgo0ZEBf4j6Z6Uo6zXPFb
         tzeQ0ePeGxGV/U8FmEXNFU4GTNW3yWRvV8gDqUaSenxcV6xvTcgHKMN3YIeRBMgdbu1N
         Qblg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=E4d0Vxy4;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.66 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com. [40.107.20.66])
        by gmr-mx.google.com with ESMTPS id j2si258325lfe.8.2021.05.21.01.06.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 01:06:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.66 as permitted sender) client-ip=40.107.20.66;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhjD6ZuvGbVHfImg5lAQH8sLjLSZAj/QqPA4qjfjLS28Obzd2UiVpPKrnpUU1AlT4vAO3LTzwTg8Cmzhu75pMg4CnDeGLq/WDaYKFra1GyOohKcbpP/dmz/NgN88to71NEypOAOCWfOdGgwj4hS9s+8o+iw7wkiwlJDOedJnEORv1mJvBIl8f+XS3+Lca656bFna77cyM7Pet9P/yxxF5POzphI4GLqAy96vuOavTAyGLBxJrZxt+IlrDBYUbDWoCHXQc7cJISyf3B1wLCmCrZZETmoZ19v+eJdpPhAvYNcZeMxSdmBIVbeBIUTm9Qxe5gaRQm4PE+8GkZiaktur0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nevTI/+3mWO6ddpi0J22ObKzVcfXFdiLjKdRV+ZT6RE=;
 b=f9nmNmrkPuJJKGmSmvofdjIYCLXd0RPe7plQOLbkM3NrCugB7Mne/Gx0G4p0DNBVhpvS12HVi+dfBGd9ZJKEDdYYKa9td1nlPavjyyYblQTb19AxhNe4deZdmUvO8cQgetyBh7HnImzW2UKWICUEMw1GZnwxWfhH5HNHTl7o3nCKucPu3WzdWKlZSQnjcsSteAW5fK4Ug2mVUvmvX2RpPhgKqbZGJ/5Ja38vjhgYL66yNykfLeh13UqSFgdksmBQUNxU/ne55DR9oYTZszp1q4FPKhIVJ2sAlgOtjc11Wo8r/eDSNPsS4DHrB2WvRUAD2ApG7HPSxWWbtSWS928gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4870.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:419::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 08:06:50 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 08:06:50 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	henning.schild@siemens.com,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [jailhouse-images][PATCH 1/4] jailhouse: Update debianization to be ready for Debian 11
Date: Fri, 21 May 2021 10:06:43 +0200
Message-Id: <20210521080646.488836-2-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521080646.488836-1-florian.bezdeka@siemens.com>
References: <20210521080646.488836-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:e180:2248:7590:2b4d]
X-ClientProxiedBy: VI1PR0701CA0047.eurprd07.prod.outlook.com
 (2603:10a6:800:90::33) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:e180:2248:7590:2b4d) by VI1PR0701CA0047.eurprd07.prod.outlook.com (2603:10a6:800:90::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend Transport; Fri, 21 May 2021 08:06:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0e87749-8d6b-4e03-4b9f-08d91c2f636a
X-MS-TrafficTypeDiagnostic: AM9PR10MB4870:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR10MB48702EC54DFD8FD59570F066F6299@AM9PR10MB4870.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /kggNC9L7KUVJaoVvRPXj+uUsDBL0h4qhJWDKweQ/kZdcHecmJjYdtQRJr/IkOrn/snZ0pQCjXPVN1yQXoVWxkmTl3BiQEoDsCelnGgIQfzutjkV/S9HITyM0HZH2EF3ils7y5yo+Eqwmln7WZpsfLa20+jShh3glfruP2lXIVvcXBRWU7qEj/zqc8SWp+ZQSTG2pttIjy1Jr5wQpT0tKJ9TGb5gupLds/ECYlQ/uDNfuFf1A9hlCkaXA/UfJpHAnUXNb1SVlqHgLNrftsaQYddJ0zS9/+d6LQrKvoRmT1wfVBRce37PZkwEmHpc+WVM5qXCfYz/G5oki4z/TZkOjDVAJrgAplayYYewRBKzwYsu4VCq8/8AbbdwXV1I2c2UqTzBO+rBXpASySlPVfD77oE8cxE4bUE80ZrUgNzMxnGhA/5A6CrtyGaRg2cjB1T7MuheCAlnbc5HHYYvTYE0huQd7ahYp7QqW8D7OzpJ2+WCBVs7I+olq8/l5uL/NDr8W5YlrlhQgLjpLPhY/SctiZYn7GWZxP0YxgU0ZIAkN+58Z3RqgidWyTCXXAqmRBLGblsZ6QcnVkNzZCJZ3VrYU2vLpVPPts4vBHzCgUvUUOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(16526019)(1076003)(478600001)(8676002)(2906002)(6486002)(107886003)(66946007)(36756003)(186003)(2616005)(44832011)(86362001)(15650500001)(66556008)(6916009)(38100700002)(66476007)(6666004)(6496006)(316002)(83380400001)(4326008)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mIfkoFRHNsZo/lnLuaobG0cephXEd2sn9BcQ0oXfX0kKkPuIQHA7vCiD+25v?=
 =?us-ascii?Q?yTl6OZgg4LDKfMhpaBeBZvLuRB7OpBW1oO2UrK7LiTrT9Z6LqMYwVcPhEvlp?=
 =?us-ascii?Q?BP8O/IVyMYSTaLWX8uVkmVCLTH/+3yAXggXAKxUywlcxsWYsu+savprxotU9?=
 =?us-ascii?Q?ZoUipxpQZ/zFj0udK8YHq88f1Io5dGUiXyi6IveWHNIJ+XPqpwftx0qBJ9+N?=
 =?us-ascii?Q?RJ1sGMTNlrvvNi/prvVycZVqUZs65ZFR3IFI82ZTBm7OAiX2KtnqURvjKz3V?=
 =?us-ascii?Q?0HRpTGLBty6JcDvnRgpGTb5C3yOnrPBrNLU+kysOUneJ5Y8jYmo0w/HPvisW?=
 =?us-ascii?Q?ciL8yGPz3XtRJMe06gROV2i0XlgKnEYrkIcTbBpDWi79t8+Z36OvmaP1tfNy?=
 =?us-ascii?Q?dJSh6ZgU+Dhn7xxosvzcqtCVsYq+6wveFz4RMCCg5m8inMW5r/J+MPp3n0Qi?=
 =?us-ascii?Q?JmbyeLHvV4VR4bXgercDYtzVpkYoLFrnUIQ14YRcXoYH+Et3+sNI5tSgFH2G?=
 =?us-ascii?Q?4bBhJzrjcnOg9JWeisJwgCW0SGC/4AGLTB651E6GW5XyjImAUjTAZH7QLaI5?=
 =?us-ascii?Q?3wbe8PlZftxcVVup5xX9HPfgTOD9D3VtJHKLwWZdBqcLCoebUdpp4Tw17ZjF?=
 =?us-ascii?Q?fSo98StbUhEqq7bPXMhtg+/6hRgiCQRVsOQ/vaSWzRwdnX3f/kyolkAsuAUg?=
 =?us-ascii?Q?kRwAMKRJwurarSX7Pg299LOSCrMRi+6bSkJN5WbacCpcorpOp4N6psGJccpL?=
 =?us-ascii?Q?j2VHUT4RjaH9stf0nE4gSPpVnoUvDsnv5L2lcOj0wUCjK+nSdGh3LMr94HpG?=
 =?us-ascii?Q?A9uEkd7c9O3PXkhxcQ/0y1rscNLYMu+GyF24mdWw37fzFf/zQ1v52foVYU1A?=
 =?us-ascii?Q?pEXYAWQrtUTqNuFWvclSYEh41owT7YYGXu8VRthM9yqiC9WygxLxQbXoB6GX?=
 =?us-ascii?Q?j9a7u65mIAvEhJFrd27NxvzXKFMR8MTdF0sgRbjZsfl8zf2jhMCx7wd/rG6B?=
 =?us-ascii?Q?B28TKZgv9dIfRHuxf2wAGVvdQ9Dn/uS6RZcZBLTJe128Bci7FUBqM1OV+e+k?=
 =?us-ascii?Q?vpSODrKAHqKTe0fjtGP2tET4oYSv0qEhw8u/gzGuyqPXXAPL1Bj7CWzCC/sk?=
 =?us-ascii?Q?wByUc3yT2Tx5kSKfN0PPAkcujtA1llXIZL72NozCuwmg2f2sfbyTh7Fr3iqJ?=
 =?us-ascii?Q?qKYgaP+D238xqx+fAFUqK5YoLVgMiUNjS6yQmJup/KI4nrCoyjm6bqvrWgqr?=
 =?us-ascii?Q?7iEBOsSt3DFR1jvEUW6HVzbvCyWgBeISqbDtZ21oFW253xQTcvkjEHJZ8tBC?=
 =?us-ascii?Q?r5VXIv3Rr8r1rScjBhJdw6JcHRlP14wpvD2VQIRUdGz2XBgkL0m33HMSQU7Z?=
 =?us-ascii?Q?FlDXHN9rAWlsbb+67r3Nhd05yweP?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e87749-8d6b-4e03-4b9f-08d91c2f636a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:06:50.7596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asZ1wdzDPZ09Vsdq81YO1897AfG8HJZZxazzchLYIZfUEp9G75JM7Jc2Sqmoj8WyEPh96U1qkl8KPtGUP81kUb4+MboET0u/qITxjGz89Mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4870
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=E4d0Vxy4;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.20.66 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

Debian 11 removed python2 support, so we need to update the (build-)
dependencies to python3. As python3 is already provided by Debian 10,
there is no breaking change.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 recipes-core/non-root-initramfs/files/debian/control  | 2 +-
 recipes-jailhouse/jailhouse/files/debian/compat       | 2 +-
 recipes-jailhouse/jailhouse/files/debian/control.tmpl | 4 ++--
 recipes-jailhouse/jailhouse/files/debian/rules        | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-core/non-root-initramfs/files/debian/control b/recipes-core/non-root-initramfs/files/debian/control
index 5ff2c5c..0ae9a97 100644
--- a/recipes-core/non-root-initramfs/files/debian/control
+++ b/recipes-core/non-root-initramfs/files/debian/control
@@ -2,7 +2,7 @@ Source: non-root-initramfs
 Section: misc
 Priority: optional
 Standards-Version: 4.3.0
-Build-Depends: wget, cpio, unzip, rsync, python:native, bc
+Build-Depends: wget, cpio, unzip, rsync, python3:native, bc
 Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
 Rules-Requires-Root: no
 
diff --git a/recipes-jailhouse/jailhouse/files/debian/compat b/recipes-jailhouse/jailhouse/files/debian/compat
index ec63514..f599e28 100644
--- a/recipes-jailhouse/jailhouse/files/debian/compat
+++ b/recipes-jailhouse/jailhouse/files/debian/compat
@@ -1 +1 @@
-9
+10
diff --git a/recipes-jailhouse/jailhouse/files/debian/control.tmpl b/recipes-jailhouse/jailhouse/files/debian/control.tmpl
index c8e625f..8caee4c 100644
--- a/recipes-jailhouse/jailhouse/files/debian/control.tmpl
+++ b/recipes-jailhouse/jailhouse/files/debian/control.tmpl
@@ -3,11 +3,11 @@ Section: misc
 Priority: optional
 Standards-Version: 3.9.6
 Build-Depends: linux-headers-${KERNEL_NAME}, git,
-               dh-python, python-pip:native, python-setuptools, python-mako:native
+               dh-python, python3-pip:native, python3-setuptools, python3-mako:native
 Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
 X-Python-Version: >= 2.7
 
 Package: ${PN}
 Architecture: any
-Depends: ${shlibs:Depends}, ${python:Depends}, linux-image-${KERNEL_NAME}, python-mako
+Depends: ${shlibs:Depends}, ${python3:Depends}, linux-image-${KERNEL_NAME}, python3-mako
 Description: ${DESCRIPTION}
diff --git a/recipes-jailhouse/jailhouse/files/debian/rules b/recipes-jailhouse/jailhouse/files/debian/rules
index 0b53ade..8b14792 100755
--- a/recipes-jailhouse/jailhouse/files/debian/rules
+++ b/recipes-jailhouse/jailhouse/files/debian/rules
@@ -27,4 +27,4 @@ export ARCH=x86
 endif
 
 %:
-	CFLAGS= LDFLAGS= dh $@ --parallel --with python2
+	CFLAGS= LDFLAGS= dh $@ --parallel --with python3
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210521080646.488836-2-florian.bezdeka%40siemens.com.
