Return-Path: <jailhouse-dev+bncBD52BTEZ4YLBBSWDWSNQMGQEBM2D62I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x640.google.com (mail-pl1-x640.google.com [IPv6:2607:f8b0:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE45624694
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Nov 2022 17:07:40 +0100 (CET)
Received: by mail-pl1-x640.google.com with SMTP id q10-20020a170902f34a00b00186c5448b01sf1651855ple.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Nov 2022 08:07:39 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1668096458; cv=pass;
        d=google.com; s=arc-20160816;
        b=gxU5ILr3SLpblPItvhapSp81XeEkz6qyjXZfgJnqQcBPKzas/0INvTB31VdrB7BG+R
         DXDDBq5D0l9qU8/J08gtJnZ1UtIyfHivuV1QO+4kQZEyU9893EdARjAVujJUzO2gShjg
         b9+gUV3AyAEs15k766E7rlV53Kh+Q8P8mtcavyGcmjGa4YGRk/QBs6ZObpuXpiHEqjVV
         wfHXrItEgxJU3cQwKQj8B2aCk7Udy1tjNn7zBdQl4xNX6Ut8Wh3xIosRJs4c9tAv/HLl
         2izxLZX5nxeZrRBn8+93NPoMBZBSk82I+PuwA9quW8yDOk3+rqdi04yY0d0M16tBVRY1
         8pfQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=8/BDy2WbVDn/KzEDfNkRMKXY3yuRDl+I2aHtQPwAdyM=;
        b=0IN8Alnli3AXOJPOY+tMx0j2ZSTSzy2LzcJuP8NOrbaPxsP/X8UC26+dU+PD1DV7pZ
         ExiF2Y8ONo7D56YhtEFTyCbh3rodNvcVWQ77vAXH2XSRkx+5zGRuJiRa9ExErJ46cTAK
         epSinJNAwntymbTzYRemV3wp8J7+IUqkgKmVESIvdMEZ4fR9XL1wJGoBpzV9RBoXP+Vj
         OsaWUff1yQSqpFnD5EqIpAuuGjZ17nNc8Q2SJ9v4krPq5x5K5YIMgXNmny4HTbRKHvb5
         5DXwgbpZW6w9cDjnQL8x2n5+BHDDqIz9KL9eY0AQQv9H/3dhUc6uqFq0DCBxL8GBkqJl
         tW0Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=SAcskypl;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=aVMcad4g;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of ross.philipson@oracle.com designates 205.220.177.32 as permitted sender) smtp.mailfrom=ross.philipson@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:message-id:date:subject:cc:to:from
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8/BDy2WbVDn/KzEDfNkRMKXY3yuRDl+I2aHtQPwAdyM=;
        b=deiY9EQtPQor3lgxsQdO+pt4xRnlccfTnk6dp8w/D2ISQwIW//+yCeTP1NZM6yY3t/
         rBe7Nya72DX2fgMtYj+efZzXnJTCU9Y/7EaMda9KOapo9sr5RoduXodj15t7ANFg3kVf
         HjI7Z2wjxCYvBGIVj7FbPTn27AF7cugcdMydNwGeOlVusT06z0dpuN8wdqTXSLELXeNV
         kSkzpkqXgNe7CFWv00cZb4evGQ7864xfWSC7p9NqqGthv29TwNE+MioOihhEOVZLZlHl
         NQLkhKfnHKVPqN+6Y1sRX3HLxpwX1zN1LO7hb8RHn5W5h/KUKvAfXiz5op1p8XD9JTDV
         GwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8/BDy2WbVDn/KzEDfNkRMKXY3yuRDl+I2aHtQPwAdyM=;
        b=Bvux8b5/1aA0+w4/VLQwgUFy5gfDGaQURAJM0DNjg5M+kx/UbNUHKIQXl9zeuurCKp
         NjwXhu1L6scGZhNVvoSdXa0l8gy8bF7b45InJPbA4WNY1gInsZ7cfHnQn3d0fvKXtcmI
         hnzU6FTML+gQg6REjKceQgfZwR6daJTjeK0mOv/AsurCds2c0+3x/uI7ev/zTF1hLdkP
         EjpjCFz+KYS7m4FC0SsQvE9dcFO9zDb9AXShMm3wAo+mqYRvfYucyYRFy2YlqfKzGtha
         WK7F5Ten/mJH3h74ILi6KN4eNwPE9LmS5d8W6gmWU78X66JhwXQ9dBIHLE0JDh+FviL8
         GxjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf0w86ZTVAtfkwfCdjE8kki1VbAwcbwBB8WtUFhqYjeeJpJ+xGaW
	O1x9jn2BYAj+Oa9n7j2cuuY=
X-Google-Smtp-Source: AMsMyM5QMuA9S5niYYbTkvjMF18FmLdY4jiJlDEacQGFWnahpbe2SS3cF/Spnpx4XtCef16k168p4w==
X-Received: by 2002:a17:903:1c7:b0:186:85c3:98b7 with SMTP id e7-20020a17090301c700b0018685c398b7mr1473016plh.31.1668096458558;
        Thu, 10 Nov 2022 08:07:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:180c:b0:557:cfb6:bcec with SMTP id
 y12-20020a056a00180c00b00557cfb6bcecls1408307pfa.9.-pod-prod-gmail; Thu, 10
 Nov 2022 08:07:37 -0800 (PST)
X-Received: by 2002:a63:585c:0:b0:46f:f128:62a7 with SMTP id i28-20020a63585c000000b0046ff12862a7mr2856914pgm.139.1668096457589;
        Thu, 10 Nov 2022 08:07:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668096457; cv=pass;
        d=google.com; s=arc-20160816;
        b=o4PwXirDzp9Q4f+27zR6V1XU2jcAVIe/nohI4e/4gglO6A9OsHBsQVXktsCOaBWWbC
         YTdcwCC2n3C/85g3p+y/eYTSSP6Zd7Kbs775yWw6yFtMQNOW6LUukHIAW12nQVmGr9un
         qeo4L0MretFitZtXqGzKk5+7ZPWvasIgsy2Qm9bJj+xFiYPZWiNCH8+uiYxUxE8/smix
         7H8OvE0e74HksvNL2XI+xZmEGde4XVT8zy3pRedqh8y0qk5tNHigg2lhnPnB07qa3vsg
         pIqWsvk0RDFFFuzFgDkWJlH0Ef1Q1oWEfwa0o86Fm1MghHVc3qEIssC752ZyU5PwAtAx
         x/tQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=0tIq+Nk9fP8w3iWkgsV7ZO05ZvnZbB65xj6iQU83LWA=;
        b=N+esH/gSIex1v9+KibMqM9QsrsTI5+VECR4cNT7CbibaHKEpwCUTlEfs1mGkcjT7Fj
         0EpK3DPLB6aHZLZLY4P4QDBjKmxdVfC4m42612QYMDfBr5osHbWpxpeUQnvsPznMBjyM
         6kV10Q9myaqO+zW1CZtiYdrkNNtsg5iLlY6Emb96qvY7fGPpFjK+GH9rGOWJJ1CX2EEj
         44yFiFZiLD3zr6246lbR3iQxsbVQkbVtqnM032nm0Bw2V/Iedg1KJ3JEPjyV4Vigdflj
         N7BSFIgk7u/71hF9UhtQmCyKHZvh/M8fWZHpCi4pV2mbwd7z90xYD0bamoi0e1oqYE0h
         tXnA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=SAcskypl;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=aVMcad4g;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of ross.philipson@oracle.com designates 205.220.177.32 as permitted sender) smtp.mailfrom=ross.philipson@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com. [205.220.177.32])
        by gmr-mx.google.com with ESMTPS id lr18-20020a17090b4b9200b00213290fa218si1010pjb.2.2022.11.10.08.07.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2022 08:07:37 -0800 (PST)
Received-SPF: pass (google.com: domain of ross.philipson@oracle.com designates 205.220.177.32 as permitted sender) client-ip=205.220.177.32;
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2AAFvJje017398;
	Thu, 10 Nov 2022 16:07:32 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ks4d581r2-30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Nov 2022 16:07:31 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2AAFaWBp035073;
	Thu, 10 Nov 2022 15:45:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3kpctfahdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Nov 2022 15:45:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hk94l+0YDzJMJ996aup9FtDik88ppQAy9rCYbBMWv68M3Llcpsp6zDCDxZxa8aSbPN/jk9fQH5IIK4zf/Kk47VRPsrUlxt1ZvYR6vKifhoaZxu2yRXicuEqUuoMpyhTGGNeKuOAmvzaAZg1t0I65H4xly5YQ3Ko7QvNPSrhVWiA+sGZYzjzEomPtSx0/MRVs7Ka2u5jLU23UvNxouu8uflorfp/D8YsbHGSiFGpRWWr8RYF3U08FHSbQUAzkIiN7asEt8Qdyuc9BwLE50ADTyL5GiEz3ycIjz/BtOxj+xmaDA3qwLYQ3Mh4LMCCrqw7HpVKEYpMftQc72BKb2HGluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tIq+Nk9fP8w3iWkgsV7ZO05ZvnZbB65xj6iQU83LWA=;
 b=FlHMlHiD4W4zC5brSuC6h32f4z7fTE371qOPBZF9UFux5D7UMgyqZXCsWxODVOG5oDFlDgTugpxjrnuEOXUhym6LL6++KEXntn2dhnBk7WHrVAD+8wPMIrR50+B1K49KhI5KdVhOIRQuAuvDlWAWWtZ8UgMjaLXBR1xnAYgzoiHE4XRkglCCtxb+l9uAGCV/d/e+qLEAqHsAmUsLmTYBS+nz7kyzj+4gsvXZs1ciTuPBWtjkFgi0MKAuGNtp0beloZp0ZFF4u67MlaWUkXRQevT481UxcowepHPPY8cKrA8tnQTTpVIneqKY6P/4cn28NmQzEpy3LCuquuTo618vow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
Received: from BY5PR10MB3793.namprd10.prod.outlook.com (2603:10b6:a03:1f6::14)
 by BN0PR10MB5286.namprd10.prod.outlook.com (2603:10b6:408:127::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Thu, 10 Nov
 2022 15:45:23 +0000
Received: from BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::72b3:f74a:9e7c:680a]) by BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::72b3:f74a:9e7c:680a%4]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 15:45:23 +0000
From: Ross Philipson <ross.philipson@oracle.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org
Cc: ross.philipson@oracle.com, dpsmith@apertussolutions.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        luto@amacapital.net, dave.hansen@linux.intel.com,
        kanth.ghatraju@oracle.com, trenchboot-devel@googlegroups.com,
        jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com,
        xen-devel@lists.xenproject.org, jgross@suse.com,
        boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
Subject: [PATCH v2 0/2] x86: Check return values for early memory/IO remap calls
Date: Thu, 10 Nov 2022 15:45:19 +0000
Message-Id: <20221110154521.613472-1-ross.philipson@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SA9PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:806:28::28) To BY5PR10MB3793.namprd10.prod.outlook.com
 (2603:10b6:a03:1f6::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3793:EE_|BN0PR10MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc44359-3b45-4427-9eac-08dac33294a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: If/RgOQlPiPi57BbY+nwagCaBxGqJLuUX5nCtb5wU7Lt5fuv7+K3sVU9NRWa9HSgKGxg6IRNL0k0iTNbhhTRZL/xucHh57J5zqvRfKMCiD2uwHy+NzOXj6cfpwY+sAiTBslpeJ3M4+7UVLg/zC0PtIxur3xy95l6gIvJQl60Y6RbJVzrwNkvPnM90872pfkLvzDPQURtPfKriZpQZiglfGsPSiHPTKnhHV/VDxzcP/mgTwRCPDFWHJ2nxCf/DO6MX6hHtnh+TCD/WP47z7J74/kmgL+5Lk76977fhT156AEFMGMQUZbR4RXAgd2mS8B45X5oYRr62PEflU94H3hbDaqEb+SZNA0wyfzX1OG/L9FLjV8BPamJkuDbgSxNW+1twrBNiTMf0QD9qGcnOR6/E5jaDESzcdJ2oPl1QsbE/u/zcC/1O/+MX36ozVNjTf94Wyc8BGXRlrwQOOtHQJwZ6TQGrLl90olImT39a0Pv00Cxg2W4EvnvfyqLD1ZOxHJph3RpWV1japI6nrnPyIiJj1zTtzELXJZZOTiu4kWHI5IGwiL8S+MeiXyAOiroUHhhBSjry9oX9B6CBP681oElQJPLjN6eHP86hvPNfJ03Ky5kBjrNUoTI4Acea8LPWGsG3sSqyq6RlZlJOvA+v54lm+R7aMZVFFe6t1t0ZLIW7j8pyT4MokTbZV2p1eOqNRgUUyiXWE9ioDcpQaii2miZ6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3793.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199015)(86362001)(7416002)(44832011)(8936002)(41300700001)(6666004)(6506007)(66946007)(2906002)(4326008)(8676002)(66556008)(1076003)(5660300002)(66476007)(83380400001)(6486002)(316002)(478600001)(2616005)(186003)(36756003)(38100700002)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c9VomFaLbZSYbYnPXlqTqw/Q9tgio1lZBkDZYLNnVKK9MVs8PStlEl8CyRnj?=
 =?us-ascii?Q?MeU4Yx//JFLRiqLyUptwuZ4B5QE3AlaDMEDlIRKtA15IbRKrAc07OCNi76w3?=
 =?us-ascii?Q?8IaKP004Q5KhRjXeu6CWv6vkGDOlBJ44hVSEXv8Hj3TV6rAmZG06VlZPN5Zi?=
 =?us-ascii?Q?1TsMbI7Temed44F6kxXz418siuG93JQFiEmVJHznXEZJJwk257dHfTjfBj5r?=
 =?us-ascii?Q?EJdVrOYqWO+Mjl586nhMZcTluxAXty5OvWntNan+aLzIpy2siP747+Xr8gvz?=
 =?us-ascii?Q?HRkkZl6Zstmmpo2gPcWR2fvS2P9K5Qndu/03v7O8XnWn7GxvqZ9yK6BBOsOc?=
 =?us-ascii?Q?1Mux3nc1C/dJh3kpl39dmIlbjel7EGpQ45KveALBzf2PyQlKvRIiPL76mCGJ?=
 =?us-ascii?Q?IUK/Tu8JwtbH7+QvjC8ndhBYvUUjBl9278RKt/zOgP9ftFlXFB5XB+aWR5Kh?=
 =?us-ascii?Q?kYhwGE75317ItO5wmGHNXBayV+fM9N6VJp3KnySW5nsp5TxjQtwlXkFF/rKF?=
 =?us-ascii?Q?wn68bDp4qqWac7UNgAui9qf54pvtTxa+1QIuVnyRB/MUDDJaIRgcQnnq4Iqg?=
 =?us-ascii?Q?6GCBFyz0q1Xlhn2M5kS+3+4vZnA3eCB36tFgWp/gFzmpEd9cVvYnKL32VDsc?=
 =?us-ascii?Q?Xnsk0P4uAteUtjTkS33LxkVC1eqbfLQhITAl5oUPWeGwIkY6vlRw5No6DBPL?=
 =?us-ascii?Q?9zQuSeIhu9T98mxim0BkkpNYWSI4zn5ye59qdtwcayz9zo4NDpSFO7cGypiE?=
 =?us-ascii?Q?1Rfw/xBNk6qkBEJeIR8klEaR2AtCE17rjOWKxittq3y5/f7aZQnmk2B1zEhK?=
 =?us-ascii?Q?TY1UckGs+mhqeIOdvfAHJl4t02F7zd+ygrjwBos9ah0sFMToUrVjRe4dwxqq?=
 =?us-ascii?Q?165PQ6FODsGexbx3VLt04SoF8yWuCQO611jwjnXGDfv01Xfgl8c4LMU4lA0d?=
 =?us-ascii?Q?aaXFNDq2+aNnNtjx2Jd9dIvZl99X2TbX72Rf+3xKV4vDr0uhcgYTIa8c/03V?=
 =?us-ascii?Q?xbWjaCszMApzxXMG/YYsnzfd7DFB2Od2jTJkECvVETn/+Cz6jDba4WBkrpo7?=
 =?us-ascii?Q?aGVp+/74DUF/ubFsqGBFmyRkfCHeFqX6xFFGmxecrlF3/M473FtG0wVaGSeS?=
 =?us-ascii?Q?aaOJgRRQ3dAXkmoww1WZDXswV1Z2MKX6QdPIgiEjXdYvYBX+lodW6/bR9mmb?=
 =?us-ascii?Q?mvbT169N8po3lBz2AeAOhHL2poGGGbwvu0X10NFGPV/ucl2kY9+WeuFG7WYj?=
 =?us-ascii?Q?BZRG/JHgKoegSOjzd8FFITjOtPXxugCvnDRY7PLrrelN+gISNh4pE7sShYth?=
 =?us-ascii?Q?MvdzhYwYvYyKqfgzOD1XuozuTu3drmTSbmahxDGg7N9r4XQiSetUDNgCf6N1?=
 =?us-ascii?Q?K9itbahGppdSqwZ+AqWKQic81MNRysZDg17SaYNAmLncHvxwAtvW1X+gUgLK?=
 =?us-ascii?Q?IYI825WEZ+HvgGPUs+BxGmDB+k93/N2/6WkWYLCrxgbizvgezilKJ096S9t2?=
 =?us-ascii?Q?wxUbAzdTiDpnM6/ORAxnRlunoH0zY/DMNMh0hgsx48g54V1Dj1Sxz1e1PGrW?=
 =?us-ascii?Q?jglH0JMI/HfyxLOu1vDSYelVZRd8yUXHW/UbEn/YcdwP2fahujp5nUPsqrVD?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc44359-3b45-4427-9eac-08dac33294a2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3793.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 15:45:23.7687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTpsJqvgszOxPEqQJ1cBZvOT1BDwD+x6B3L2yepoXinaxA7A6yt17UrNQIFxXFb+04eUFwZ8HC3Xo/XV9xiYABXTA5RQ/3+EL+dxEZaCnMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5286
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_10,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 mlxlogscore=694
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211100111
X-Proofpoint-GUID: 5ZCQR8N8QRNY8JYeYDKOaztjqMhOmB2S
X-Proofpoint-ORIG-GUID: 5ZCQR8N8QRNY8JYeYDKOaztjqMhOmB2S
X-Original-Sender: ross.philipson@oracle.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oracle.com header.s=corp-2022-7-12 header.b=SAcskypl;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com
 header.b=aVMcad4g;       arc=pass (i=1 spf=pass spfdomain=oracle.com
 dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of ross.philipson@oracle.com designates
 205.220.177.32 as permitted sender) smtp.mailfrom=ross.philipson@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
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

While sending an earlier patch set it was discovered that there are a
number of places in early x86 code were the functions early_memremap()
and early_ioremap() are called but the returned pointer is not checked
for NULL. Since NULL can be returned for a couple of reasons, the return
value should be checked for NULL.

This set fixes the places where the checks were missing. It was not always
clear what the best failure mode should be when NULL is detected. In modules
where other places tended to pr_warn or panic e.g., the same was done for
the checks. In other places it was based on how significantly fatal the
failure would end up being. The review process may point out places where
this should be changed.

Changes in v2:
 - Added notes in comments about why panic() was used in some cases and
the fact that maintainers approved the usage.
 - Added pr_fmt macros in changed files to allow proper usage of pr_*
printing macros.

Ross Philipson (2):
  x86: Check return values from early_memremap calls
  x86: Check return values from early_ioremap calls

 arch/x86/kernel/apic/x2apic_uv_x.c |  2 ++
 arch/x86/kernel/devicetree.c       | 13 ++++++++++
 arch/x86/kernel/e820.c             | 12 +++++++--
 arch/x86/kernel/early_printk.c     |  2 ++
 arch/x86/kernel/jailhouse.c        |  6 +++++
 arch/x86/kernel/mpparse.c          | 51 ++++++++++++++++++++++++++++----------
 arch/x86/kernel/setup.c            | 19 +++++++++++---
 arch/x86/kernel/vsmp_64.c          |  3 +++
 arch/x86/xen/enlighten_hvm.c       |  2 ++
 arch/x86/xen/mmu_pv.c              |  8 ++++++
 arch/x86/xen/setup.c               |  2 ++
 11 files changed, 102 insertions(+), 18 deletions(-)

-- 
1.8.3.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20221110154521.613472-1-ross.philipson%40oracle.com.
