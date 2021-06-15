Return-Path: <jailhouse-dev+bncBC44VTVY2UERBLXHUGDAMGQEYVFZI7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ECF3A7AA9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 11:32:31 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id d9-20020adffbc90000b029011a3b249b10sf5075779wrs.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 02:32:31 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623749551; cv=pass;
        d=google.com; s=arc-20160816;
        b=d95OxvXqeCl2a0SYifdwahu+vWrmrPq7om0Ha5LX0JxgIKLG31u8XjQeEpxv8fm3bu
         YkXa0ZcOS26Eu80cd1HSE0qPO3xTsNxBsXzWlkGlq+x1g3xOUzorgG4/Qwq/tk1NCz1S
         MTLHjNoFrHUPSeBA7vzcSNZF6RwEJ0P/xAzyFBdLzbXR7AocqtGyRIdi/QnNGg+IwJW1
         HcJdCECOHGSzYBlnbab5ZwS2BWejNwv5dj8rCTKoIag5PbHmQbfa/WASpMdETrLkw/p4
         b87THwVHpokK/6799SUrlRV6D8zBXYHEz5OdMg4ot8BlPvg8hk6GzEkvaNTDEwcppI7k
         lziQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=SwTWq2WQQHvTM946Bqm/VirkA1XIi2rgymsCMk5wtos=;
        b=g78iZXqUVZuYvl+NNyNSNXQXEFHX+D65B7WeIrBsChFe3CGf/XrxT+vB6J9dKS/93V
         P1rUqF8vEcdSmyEbzymq4y4wd0FmcbqeWEPZYjPD1unw9uxtzwan6rbI4qv91vPUST7L
         v+Ylvpye/ZXWRGgxFAaURIRNhlTAnXZR+nkCOipTy7VwulIDJbzVPI5f13JEL9FVUnKI
         Z14K0/kO2V2S6ReDY3b49NDOxK9QKzd8YkXd97Oata47MAEQpclZyXJ5E602HoQgdtin
         9/tE5HU9Gh0KO3e7WsHWNIKysVr5j3gUZWZ7o8bDnPHp+ga6TDitIEY1Rnxvp8i8WHK/
         KaAg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=kUbMsMr9;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.66 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SwTWq2WQQHvTM946Bqm/VirkA1XIi2rgymsCMk5wtos=;
        b=hCcA1JWn90W4ugKmpkyuTf8dQmHiVdfU0rEmf9bVlCUc5wtYCLq9J0uVioni6QKCiS
         u9e1hE1Ci6WqhG3we1M1uoPHfv1/2FYUu1OxAJIG/HaZZk0Qkjh2axSP/9OtPDQz2Xyp
         0tNnCszGWMJxZ5toFRCVkY9lIJT6p1o8vN58BMlTEEwnoEK2DoGuPRwpHd38Vy6gJ+X0
         27sgiczCJe8HPgC6yPxovrHpvWmfZb8RaxcbtSkuv7Jaoy1pFQMVrXsRj2AYGQBmYzBJ
         YBtzBVBzCNrv/Pe12VQhCFPKHCfuu2eXPJyZEtiM+c21iyaNg5PxG4HZZE+nQXbY4S7M
         DxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SwTWq2WQQHvTM946Bqm/VirkA1XIi2rgymsCMk5wtos=;
        b=f8YRNSpaD5nY+3MAcN9xpExXdZyq5TqwVZPg9iuQt8IUKyA4hvwHMR0CdWRGMeoUIP
         1VEKIeFnIjT4cIwc+8YGNkvMwz2NTkH2e95RbLWOtFYrUiTDNgPfyRP2I+Yn9o6qTKjU
         jx1CJNZw6AzNp9FR8Q+7aR0SG4jto+G4JX4VSX/ezDYCbXUVb5Qd+Q1Wq05O8QplJwRe
         GcJtuhhwk4jtV713Amp7eMvd6tc3x9ULwOswxyQd/UbSE8eIbOh8Xm201dk7Iuhh18Rz
         R7Z10kObAgKm3LzlfURPAlk1X+cy1+dwa7fZMOBf6xll6WF5GDyGoo7POfDEnqWesaBH
         zNRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5332RD8K5ZLSQc589hAJBkZr4YCsXwAfKJVhETTgM1yBWqVVThCT
	CKCKT/3hV3qkwiN4PQcBwYo=
X-Google-Smtp-Source: ABdhPJxob53SnEkUqADAaQvmgjgl5eWTy03CDT3R8T7N7hiFviUMIJOxFsS1NzdR2kEMtmH7lcULIA==
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr24632349wrs.189.1623749550957;
        Tue, 15 Jun 2021 02:32:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1d0e:: with SMTP id l14ls1220777wms.1.canary-gmail;
 Tue, 15 Jun 2021 02:32:30 -0700 (PDT)
X-Received: by 2002:a1c:e343:: with SMTP id a64mr21933434wmh.114.1623749550062;
        Tue, 15 Jun 2021 02:32:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623749550; cv=pass;
        d=google.com; s=arc-20160816;
        b=uICghQqBNYx+vImbnQfIJ0mMg5aXqDeCCGmkJXvMcPGrPbs4GOLJXjpVkcyQow9tYJ
         6zDSi1f4r3NiDnefEHFhDSHZ6gINhNlLBmBINCjmhf4Hhd8dDUCnop+tj3GMrkKsaw53
         zR7eBRkGikdpda0eQur3Pe619Q1rlaYnqKODJPvspBVOVLL9B81+yA6oGr0XMijxR1rU
         ZmZgsZz1E4ZM4al2/8TMM/cqzmd5CPQSnA5Yo6sxya1CH4Rkroej+4+vFcNcFj1x8kl/
         d6BzPpeay2CoHyvG0dnbb14Xk5oY8xXBCXo/w4ljHOcOs9vHtRtW+gJPvo7nRtV/JdFS
         UIzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=3hEnyZIv5nuvHhVjpi4+0tkBWmJ7JMzmSvh9m18El7M=;
        b=q0JbrySBkqBuqNt+Ao4Pub9FoG9yHDsFIFShWn+yxHs+e0PhEBwTJv7tJsJNDVa8br
         mbiXYNlmKh3VfsZj6pBUqQjAj3Fv/FUtBWsBqMtqjBJsjhUSn7naJyrK/aQcXcSHNdrs
         v59fgY5qTgbo0pn7B9C0gjTN4wtFBHhnoM16aiGnjij3sMeTTJOXH+JRdlNfTGUgVRfD
         mA/3fHKipJBlvcUUfZoqKf7DCuLP9GlX6db9+updB0YbMbb3pOet5QaepfWzmuOjyBW4
         5AFpcLs9qJR0KTSIvoYPrr3vLIeYoxObGJEOHYbSHypMUvBm7GWnND5uTy3frhJwaiet
         I8EQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=kUbMsMr9;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.66 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com. [40.107.20.66])
        by gmr-mx.google.com with ESMTPS id v24si56461wra.1.2021.06.15.02.32.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 02:32:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.66 as permitted sender) client-ip=40.107.20.66;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDmIVgzl0rYhSDJqH6AM7UstjR5OYC2QyWVOhjDd/mjzkCbLsCHu8daTQjDUXZIezoyof2SDwuQzCyydc1IjB9NL2zuIXcGq3n/J+Uh2/2JBccqizFd9P5veVu9t6pAQg+AXuVWE6umq2AoOLQfHYkQcLTRHSVgQhxBj/ds17ZOjLjiHoZ5TsFWcKxJ87Jeg9vAZ2dIykjMJu2y4yRu0kOhhsO/+QVtF09yCkNZgjFpKsnpImqYfocgSmYULaQXBi4PwintC7Tlmz1Jq0ciVqSIlkoSkNJmO7YEHY8nlkBGJWxhO9of2BKEQcaqcLJV0R9tTwI5Naw0KI3PQx9uDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hEnyZIv5nuvHhVjpi4+0tkBWmJ7JMzmSvh9m18El7M=;
 b=IMbvMn/xjcDlMAXJ2C9nny6koPzWbvucZJ97D4QuC8SRJX+vAV5jTJrdws+PJq/FP2KpPbvjJ95HCsXZmDzbTVjAKUk7niK41RIoMva+98G555kkbAtl94MjFaUe+lA1uTViqO7li2k4zd1KgrgPKADN/bjBVQMQi037bw2z3Gi38lck6IHjzSfWursnxkPeB3/LL9TRfd9I6qGqyB3PmsdadvIKzjb99kkSrxQdDVYtjfqKiKHufEngvOe7/v0ZZZlwIVI7RFTQeXWITHPzFTJnqf39R7SxdqxVGyqpJqaImOThCilnPxiiAP/y7j5xXkU6Nrw/YbEeQzqPq+zmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4216.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Tue, 15 Jun
 2021 09:32:29 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4219.024; Tue, 15 Jun 2021
 09:32:29 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v2 0/4] Support building and running on Debian 11
Date: Tue, 15 Jun 2021 11:32:21 +0200
Message-Id: <20210615093225.162909-1-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [178.27.125.62]
X-ClientProxiedBy: VI1PR0501CA0047.eurprd05.prod.outlook.com
 (2603:10a6:800:60::33) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (178.27.125.62) by VI1PR0501CA0047.eurprd05.prod.outlook.com (2603:10a6:800:60::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 09:32:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 132c76ef-324c-4054-1709-08d92fe07e7d
X-MS-TrafficTypeDiagnostic: AM9PR10MB4216:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR10MB4216935D7C927C6D27F63A75F6309@AM9PR10MB4216.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tUwybAdBFRUEncH1H+QlleJb8Q1dwe/REUQvCOuqs2QFVUMY3dHPAvxlC7udjG5z3PnhiA+RfSeYKyrkXXYbkmmn8u6LvYLfRXiZgledBdwHEjuY1x7YrUUA8b0GUy/mMMfAwBIL15r9LdgmePuCaHnlj0ZSAI2Tk1s6tt2DIlls3GoGdAL36Ar6dym9mRtKaCPilIb1AINePNEiv/WdyP9Y5aFS7ieibQVtgaKMCIVg9n2+1ReUnPGr9vEqU64+NO3RRB99FaXnarbDyRue2sjuT0F8/LGyxeRVEYo4aRC3u9Ap5xBBhbwBtcjxMtncmx/JpXqo17HMntiA6rLZCPR/ef8n09Nh/ciUNBfiKl9kXpP2z8sHhNsICsPBdhsoBmIpiBLBE3N4vtKcChlyZyaaaYwetKujzo/g+eKdBzrIYTcwy9VDpXIS0VFvSz+h/52yHloz4TKhVhYOAAJvSsY5vcQq+rBDzQolgZAmCrcknmX2EuDObgrU4vz60nLuXzMEMkwAtk09YTfuoSxB4l7kxtC+IEvA1KX+LGC8p757IaDq3/bIk3TqEqtNNcvGp9p6cI5kAVeUUj/z8bBJPAYKQV/VI+42YcM8G5qDmh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(44832011)(6496006)(478600001)(36756003)(16526019)(186003)(86362001)(38100700002)(6486002)(8676002)(2906002)(8936002)(5660300002)(6666004)(66946007)(83380400001)(54906003)(6916009)(107886003)(66556008)(66476007)(1076003)(956004)(26005)(316002)(2616005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cc2Y49PaUqQnaSTx84w7tJ5txTjB5uPeCsY7aY12W/gLEoEFlucHvc7Yc9wP?=
 =?us-ascii?Q?s1kigN+qPwo/vfBOSeH+4DzxyHRiEqdJ3yPJSjwUl3yGV6zRgTxeVQ15zy0y?=
 =?us-ascii?Q?hyucD1ZUY17oY7ofunHyTf9GRlWqJ27Voi+6Tts9FcabXqVr9SYH2zZty7B+?=
 =?us-ascii?Q?GV68jssYRx9teG+Bl1MgcnoiVtn0cjmZ9DuAJWMM+X2kARy+Jyz2s1jCJxG5?=
 =?us-ascii?Q?gI0RV/hwNARVr8siadfu2VHjbIIYO8FRjsfncHsH8eledXJKVxKpRe/uEi4w?=
 =?us-ascii?Q?JNhZmzuNuw/OrfmWIW6G9YUyNjZbsDgLyO9TlbC8XrFXr1m2Cj82+p4h+4bk?=
 =?us-ascii?Q?5brDHSHK1TelVEBM/StdqlbcnNY7RubVItHyjo5U0cqynH9MNc8FhgKm6Hbi?=
 =?us-ascii?Q?uZ0QLzGpOeX2HNZ8cAFTd2FHUIHPX5CiFPa3yznhYnq1Gu5JIvZrVq5ZB/PK?=
 =?us-ascii?Q?YI5RCcHVNSZQR/DB1NtCXUTVDOYhWbhqELYz7IoPULVHli9Sj0tdxf6OTofi?=
 =?us-ascii?Q?empiUOTxltSTwOKOP2+FEYEyPCNqTmEpjdXvrQuDRHQe3UfCb9vpm1IeS4hL?=
 =?us-ascii?Q?bpzXedJ8R7T/hJATYYzozfvovCn1bZ+lOnp0KuwyYZkACIS0TI6VNqoQkdER?=
 =?us-ascii?Q?5CNSNmZBgDb7VhZ2ozILlaRTiPKXGBvEFk5j3Z63mLFLcO418lny8cPhlcU6?=
 =?us-ascii?Q?iSmImsT1rW+dBZGFceXkMeJo00gIOA2l9i9Pn5ihw4VGd9LUZA56toYTfS44?=
 =?us-ascii?Q?VpHdCBVGUrRwfjgoQvgpJ18g71thZtOG9owXD6eOrvOlEXA+e7F6Yym2i3PU?=
 =?us-ascii?Q?pqmrkYQ5beos2u/oBpIilmoGKkEAFophbh9N9RzBCXTorFeK2dZ+XpOVl8YD?=
 =?us-ascii?Q?0zJJ3QskM8o13XTyd9+KsDS1PbCEe5KB9jw+3TXIb3VyE5g3JIWAvm8Z5nzw?=
 =?us-ascii?Q?fXhGqcFJKxuPGnsxyt6PRnyFxfUFVnd1pPE+c4si2deKXs+1/V+kGS5If3nX?=
 =?us-ascii?Q?mjUCWc1gIWiJzIrMVY65cdnb1Si9CwSgGutQvzZHSBhRDzEKt0VyqKSEVIfr?=
 =?us-ascii?Q?CfGawjVB/HZ49ASkXu/TfZpz7CW/3W1MNy0C0S4pbnqj0fAYEGKI86VGMbtX?=
 =?us-ascii?Q?wwa7lNCXo5Ovndn6zgVY2nPW25eNnfKrHzkVK6blSCYqmYrjazRd/1IvewzX?=
 =?us-ascii?Q?14jS4NB6hAz+4pkzPp/LPmNnkMdDyqscy2NqGp554874VRWQphgMhtC5Z+YO?=
 =?us-ascii?Q?vWY/rDC4sAhKqyUCHwojs9GqOyeJuo1HM852Xg4d42oi9Y2jGB2oUOnRDySg?=
 =?us-ascii?Q?1TIgNbHfPv/z7eK6mLHpMjDH?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132c76ef-324c-4054-1709-08d92fe07e7d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 09:32:29.2012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogG2ygikCCPfykb5vmlK8fYuHPBvScrqhqU2j758CVQwMAp3Y4TpkBkGz4h197FD5HLd4PgaxOv0o8pQbH72GBwlXPtb8AfFXOo9PxNltdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4216
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=kUbMsMr9;       arc=pass (i=1 spf=pass spfdomain=siemens.com
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

Hi!

This are the necessary changes for building and running Jailhouse on a
Debian 11 system. As Debian 11 will no longer support Python 2, most of
the changes are related to the Python2 -> Python3 migration.

Testing was done on x86 only so far.

Best regards,
Florian

Changes in v2:
 - Address review comments from Jan and Ralf
   - Cleanup ExtendedEnum
   - Remove "from __future__ import print_function"
   - Migrate shebang of scripts/arm64-parsedump.py to python3 as well
   - Update CONTRIBUTING.md to mention python3 only

Florian Bezdeka (4):
  Makefile: Update build dependency from python to python3
  tools: Update shebang from python to python3
  tools/scripts: Remove python2 specific code
  doc: Migrate docs from python 2 to python 3

 CONTRIBUTING.md                               |  2 +-
 Documentation/setup-on-banana-pi-arm-board.md |  2 +-
 pyjailhouse/config_parser.py                  |  1 -
 pyjailhouse/extendedenum.py                   | 12 ------------
 scripts/arm64-parsedump.py                    |  3 +--
 scripts/include.mk                            |  4 ++--
 tools/Makefile                                |  2 +-
 tools/jailhouse-cell-linux                    |  3 +--
 tools/jailhouse-cell-stats                    |  3 +--
 tools/jailhouse-config-check                  |  3 +--
 tools/jailhouse-config-create                 |  3 +--
 tools/jailhouse-hardware-check                |  7 +------
 12 files changed, 11 insertions(+), 34 deletions(-)

-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210615093225.162909-1-florian.bezdeka%40siemens.com.
