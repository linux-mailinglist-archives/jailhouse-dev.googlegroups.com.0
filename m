Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBYGG3X3AKGQECJUZE4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9871ECBC3
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 10:46:24 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id j16sf798549wre.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 01:46:24 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1591173984; cv=pass;
        d=google.com; s=arc-20160816;
        b=lRiobFqo84agnpyKFtvfJVhwMT1IsbEIUtTpBnlrBtn9V3XK9EcZwedg4tvYghMFJY
         f7aFBRspiv+WT+RH7xc0cnF0l/MyjO7XYIy1g74t9l9Q5w1b7T32hbcMuKwY/L58SXlL
         zNJE06e2TDHhDOBgoW6MXtt88OdqjbXbRuYtpJgAaffIqxQeMO8BV0N5RZuJTEFWfqaH
         J/5cIcktufk7mpDsluEoAqLi5oPCPppP4mygqA4A/wGg4wm2DLy4uCMcAz8fkeDGs5DQ
         1tbRED9lnDZiO0hG9ozguAvIHOr3B6ErcUYHmO9LEntaAG8izCJlxpZ6zb6nt6MFnZt0
         1GPQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=vCAppNDYhUl5bqP5lnpvJfUG/W1nIP4ZZTREWFFYOJg=;
        b=S8ZW5Wp/biXEZQkX12h2WDCY1aCree1ch7BSyR7Ofzcxf1mzhpM6G1Y/Ck8zQYCZUP
         n5IuqpNJ3/SCxqMAbzftUDZ6JXmeCaIchakQo6rIDllY0rXq0om+gWUsM+0EKVGZnqnz
         iFio6mD7eoaeGAYJxV5IiUmiRi4un7NTstuOjeRgAmVQSFeBqkEecLAX4IzhS5voLCQC
         J/Z1VDW8UzlJHJUm2nN1ew1AOaYOMQJvZczccKsQUeSYEEKvGSH1ynFqO42+5kP2OK+l
         oemXYX0y52eWSXPERASyTSkl1bOKS6IJZoDP5K+UA1XN/RF/6JfIVIMhmOB5ozlu76WC
         7ukg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=AFgQBT1t;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.63 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vCAppNDYhUl5bqP5lnpvJfUG/W1nIP4ZZTREWFFYOJg=;
        b=i+w9fVdppfNdAvQ+CHWatgi0+q+tojDOzBjJ8gNeNlQnVMU8wSoLeTKJzCkdK/lD0d
         +bddRGCWGcd6DoZx8faprkb6lx9W6zsbYbE89uzFfO7dFFuBGJ4FdQoLkVJEROFO+9od
         KCLxC7jzt6TfrWhS08pddh0bFZsEhxu4zUFNV1cU5geLphTQ/VrdCJupE9ecUrOBGItj
         VelJniReybRKEZHvzrzZ7+fNyHLl1hf8hy5h4PHhnX+gSAszOO5zsjbDZo+dOOi5ixgq
         CNw0e64VuWSCiBtWTsyn5hoTE+t4UIj20CaAzOIUospWuXeIgIgKzGKhpGiqc2ljJB1e
         VZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vCAppNDYhUl5bqP5lnpvJfUG/W1nIP4ZZTREWFFYOJg=;
        b=SaIM+/7g6c2QlHRT97RVUiwuBgVhAzV2GMFeAGJD8FNbYgooEkx4OKix2ZQY2+urLQ
         Mi+lyi7LdRUEfbEZr9kAv1P/pVnK45fC+sMH7ueL3GUEt80V2xY9gahCK3P3EE20Ooup
         EQIB7Bhl+TGHmLvKNIWVB1ZmLABrFD/eCRar2ZGkwRqfo3ClYZmXJ12/0rTv5prmF/Jh
         2zDBfw+z1ozEpDv4JNUV6uIUu9iSfFYPPECjGTwQk5aqUgJoqJxbnKOrGomHuKJaluHw
         YHV6/yjoRl+Kyrg+HfFdkaS9eqDBsl2hRhVCCsktWTIiewQFwO01QgE4w6/UdeBojuo8
         HuMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Lbxk3Zz5ew51YhEC71pZiYGiA29CMdLHDP3JBtLTMOmGA3yI4
	IZCqzeg40RZd9zK+asJ1ou8=
X-Google-Smtp-Source: ABdhPJxQBYWsyhKecQ1L7J0gAuRscoK61GjnnzXFGte3hFv/zmjSk/Bi3EbrUqUmJgifPqkXClF8NQ==
X-Received: by 2002:a1c:24c6:: with SMTP id k189mr8198931wmk.9.1591173984250;
        Wed, 03 Jun 2020 01:46:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:da46:: with SMTP id r6ls1854373wrl.3.gmail; Wed, 03 Jun
 2020 01:46:23 -0700 (PDT)
X-Received: by 2002:a5d:554b:: with SMTP id g11mr30193945wrw.260.1591173983604;
        Wed, 03 Jun 2020 01:46:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591173983; cv=pass;
        d=google.com; s=arc-20160816;
        b=Lyh76JaVn2WaHP/nXQz0ftH/dI6c3PAHZ11ux6Fc70fuQt8Wm640oSbC3bByhHpEuT
         7k883Xzo8CGUnEd5vFoeCUo3lhI67Sobj+lGM8V+BuYjMSezV8nr+GYYmkFWdOoTbULU
         qqNY8MankjE89hF1erofpyO7Hi3RqUrzR5/YU5EXt6eKNRK96s+6ImsyT4pYMoQriaOe
         ftIcg/tEugtGqZtmFeSt8i4XBIoRV0ofSD/NRrdJQmHVLwEhTXzp2ydZxrOmvZGH3AwE
         kj4NEmBsAZr1K9+cseEsBIm4QUm93YRqfD5/IMpwt3fz0OlLFzRdPR+VZpeyk1KGrT9Z
         2iag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=rCBwI00NbhbhpUIENJcW+/iNbC8q1SEMOamf1/Gz7vI=;
        b=uY3TxnIvo+20jamIm5SPHKv/npYWVCYV7qmOqp28B2E48wskysVzkXZsTAv6xHI0oh
         Snf6SpXweCpZhLGR8uROUZ3bOCuS7Ld60op0pfA5mE6Ex9HNKeCUdMv/sMP2qDxL3sOm
         QjRhrFqu/xGwURmNaYW6iSOylFCsC22UnVwXUWpeEJqVOluTFjHMtG5NY6vDBTefhCqJ
         VnlW7X3ATGLgHRzeMjuGakfwbQSlreVT4rxLSKy3oyzvWpJW5LJBw8PE+il+llIx0Thu
         9Ef5J+F/K3B3GohsJu1PBY6Egvyt0EQoQSTokvrvfCHE8mmaORXUJmWR2CUsxXlPIxwr
         8Wiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=AFgQBT1t;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.63 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60063.outbound.protection.outlook.com. [40.107.6.63])
        by gmr-mx.google.com with ESMTPS id f1si72981wrp.4.2020.06.03.01.46.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 01:46:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.63 as permitted sender) client-ip=40.107.6.63;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg+JJ2QgNB9qaTFZaos3O7ls2wE1pNEAuZy+zh7irrXHw3BHSz6Q0R1FmF/7r4WOns7d0mQPbFgV5/aX3FjXdosOXFKZ9c2yTfqKhiPOf10fRQbLW4DlmAHDAGRdspfAPkZBJOmNIVje87LCJQGECj+s3eyHLnFell0j9siZMyxfvy8JMLEkWed/tfRRymeRJOnrUoSXHvPmiuwuRNonSCDdDHNUr6KzLFXfbxjPqo5qaIlJs31r5s2J5JmXcTKdHlnCnGzC+ELa6e+g9SSK/KO5/d3PPH9fc5Ay/zNIRNiOry6U4vmKZUXqvtgdCVOGtZKKFToxv4N+fhrSAw1yUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCBwI00NbhbhpUIENJcW+/iNbC8q1SEMOamf1/Gz7vI=;
 b=fWZbX3j+mUwBn6wMys70j408QXOqgXpd2RKU7uXILJQ9BmiPyum+68MvzRs0CVfehkkq9ElQOvFGXvX1aVAEAnMpJgnPPH9O+Y+ffx2ZcSouY5Od9kmy/Vd23wnn5yUpWlpPMl8NM31yMMqbwnf+1Twg0KVLRsHmkH9FR25FTM8uGAiEpLIY9uyw6ODomBvIec8Qj7LOCpUzuJ0T7nXCkitU4/7c2Ken+5kqdHKnwVaC3qwB5YXHowxC8cxINfMo3dfJ11nZdDvDzAn1c/hEkfYGzqiuq6FuZJvnSHpQ3Vb9YcTwBcMWqil7mXik84Wd8/9Dpcrun6mwv0fwaoP/Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2775.eurprd04.prod.outlook.com (2603:10a6:4:99::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 3 Jun
 2020 08:46:22 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871%6]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 08:46:22 +0000
From: peng.fan@nxp.com
To: jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] arm: irqchip: fix irq_bitmap setting
Date: Wed,  3 Jun 2020 17:10:04 +0800
Message-Id: <20200603091004.28908-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0062.apcprd02.prod.outlook.com
 (2603:1096:4:54::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0062.apcprd02.prod.outlook.com (2603:1096:4:54::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 08:46:20 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 883d8e07-2e09-4236-dc66-08d8079a976d
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2775:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2775469CE1E0E25B38F07AB588880@DB6PR0402MB2775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fZS2lIeOu1oWnYe2g0HT9x+nAJJ08Ge9Q0eaLmaXx3C0Np46caZonzOdtnB6ybF+TlfwYtHxKgTb4X8+7lnTCKm4f/mREcLJX7qdymsk+OFfxIi4zk4+nsxVZLjf4f2M0K9q8a4d0qSt+IFO7t3ycnshsYbia1BiBMEN1DGVS7ZzyBedpuovZlN/BFzFq1eTbPLPrzc+zD8h011LCe31+O+TKtzzLyjC92undJokoPjQ2dToDTBFAiDUqt2PHotaiTYKeY2Wsb8R8ivZakv0db0sYWXLSxbzoqbDY4QzCoguuxkLrwwpKcdwE78ow9HqMsZl3O84GcaKaVbw5qoRGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(36756003)(83380400001)(6506007)(478600001)(8676002)(86362001)(52116002)(66556008)(66946007)(8936002)(9686003)(66476007)(6512007)(2906002)(6666004)(186003)(6916009)(16526019)(6486002)(316002)(26005)(5660300002)(4326008)(2616005)(1076003)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Q1JqVjWa8ar6g7wbNeQuoJlECTz0H9+If6F+FDVcPwHtNX4PjXd9jiR+JHYj+Fa3TCofeCx4Hft257DFTQHMS2dsFlvl1G8rc77ZWFwGpXA5L4f4S0wkWltlgCkrWgzJvJxhS9zpGRjriW9YcGFWWyfQwryefydc+bLJQgXuZ+wm3EepEZNG2/DlGeOcWQrHmYMCDmWyJtb/517QxBvySXFr4Kec1dT4r0sxF0Sc6au7LVb+y9wrCrilwbj5Bppt2jFIV/IIjWW5qofBWtH/rUGu9fvT8OkK6532j4TTs1ZzYdNoATEkW7BiOvuO+yrsUX1YTb6f758WE6T9zN6wFuVe98gAdsY/iAdfqqRNpfItU2oHl54EyZkCKUqz3/IdiaYlDC20NKbfPrEXcDfSxaWsqO3nBrzfdbobo+tNTv1i9Mx6vp1ikupRb5nUL2HPoiIu8CD9uDX3M6mzEdfGAKwGRLbs38ujCNaunOrWhidQ5/6mFA7K+fDVvbe+BCmk
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883d8e07-2e09-4236-dc66-08d8079a976d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 08:46:22.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59GC1dBwSTwewQr0JWDJgLcwmPG/dKXAEcrFs+sGdFHBVMkTQaXLOnR1tOQPnADKXUzgiLfi44Gyf1VdoaM+Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2775
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=AFgQBT1t;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.63 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

There is a implication that the pin_base in the cell file
should be "32 + 128 * i" with "i >= 0". However there is no checking
for that. Pepole might choose other pin_base, such as 160, 224 and etc.

Saying the 1st irqchip pin_base is 224, the 2nd irqchip pin_base is
160. When irqchip_cell_init loop into the 2nd irqchip, it will override
the settings of the 1st irqchip, because "224 - 160" is less that
"sizeof(__u32 pin_bitmap[4])", so to make things simple, we not enforce
the pin_base must be "32 + 128 * i", and make the upper example could
work is to check whether pin_bitmap has a non-zero value.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm-common/irqchip.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 847758ae..794b88d9 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -421,8 +421,11 @@ static int irqchip_cell_init(struct cell *cell)
 		    chip->pin_base + sizeof(chip->pin_bitmap) * 8 >
 		    sizeof(cell->arch.irq_bitmap) * 8)
 			return trace_error(-EINVAL);
-		memcpy(&cell->arch.irq_bitmap[chip->pin_base / 32],
-		       chip->pin_bitmap, sizeof(chip->pin_bitmap));
+		for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++) {
+			if (chip->pin_bitmap[pos])
+				cell->arch.irq_bitmap[chip->pin_base / 32 + pos] |=
+					chip->pin_bitmap[pos];
+		}
 	}
 	/*
 	 * Permit direct access to all SGIs and PPIs except for those used by
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200603091004.28908-1-peng.fan%40nxp.com.
