Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBLNFUX2QKGQEZFGJP5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 043DF1BD923
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Apr 2020 12:10:55 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id m3sf592861lfp.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Apr 2020 03:10:54 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1588155054; cv=pass;
        d=google.com; s=arc-20160816;
        b=u4nkFRMOdonlvl3j5QebVVPuiQYV28xZGr0T6nzVD0iDI3AK6/ELLJ+ttT5AzNzUt2
         LdgRIm3OpLkZe5vjn5SOI9tp3mUkouKJ+vUVXEfT/zK0EH0IbRuEFyzj0KHFkg9N7Qzk
         BvHkV9q2+nPFJnRrdmj5LHC/BdZp+tVCCvop0ufnE7ZSnQ+TwPxuwTAmQuu4Jv4uVpPS
         0CwQBM5cR7ZbX17+SkC/bp+bX6lN79AvyVD5oNdl3fJCVLHCjEuFOumZ/Wqt8FKNYb1Y
         ROu0JW9LhapoPl9/OQUewvEWEiz2Ic69JmkI9MYh+9TeQE0vO00r3pxiQdjjIBrixw4h
         4xuA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=a0LeZXhRHIxofm7YIQYfIIaOUH7NEp/Z8CmYHsyV/ss=;
        b=pFUxRk3/f54pxnaQ2KkDVlYW/8gNmm2HlVnRR2b4+0eJelWC8knE52mbB45FJty/DX
         6FG4WrkyFMgb93G3OC2J58lfNqJFf9ypLcmBu97z1vb0rFP3Hs24WXhMY36BPX7QRHzJ
         2iIdQs5uXI+5TYNcTQVMpYDWqM5fX1KWn6T/nGsPKy/A9IA9SpaJN9NZpwrg/V722G6S
         tlZjw+NPOZhogtpv5xdECHANaYtZeOq9eiU5/iB3ci00TnJTSL4aFEDpzertEq+jVXau
         /6r5qQRXRSgexjYyU00SZ+aAB2s9T8QUDz1gdZpAQahwqWCZ7/b6ZG7UoQa9TvxcCQcQ
         VEyw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=lS1yGWmX;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a0LeZXhRHIxofm7YIQYfIIaOUH7NEp/Z8CmYHsyV/ss=;
        b=fWR7pzfZJreBmZ2dUUGA5zIRF9qGO0J1DnWGQnct2dr4vFUajuGI//ILPv4KDZrqkf
         2mSPxOQ2orLF0ds1ugLx6JBwdKfkgosSkf3o2g2/4nZ7matkCSmzGqdlXrFIYlYct8Qm
         Z6g3v7C/n3lcHiervMTeHACm9T4fegQzEFHx6uFB3ZPH6SXk0jVx2HA+y/GUjCDfKEbs
         Kh0iUbxqrr+0yMuRGuA9D0EFHHczz/kVc7mjdSJd0cUS7EG+UjQxWgstfrdghbgNgBCf
         4rdQVCiPtHxB4yl29/Eo8tI/0m6LW2yM2re6Zv17/fgPXRBhDOIQ4fwJkREC5/uuOrgX
         Tzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=a0LeZXhRHIxofm7YIQYfIIaOUH7NEp/Z8CmYHsyV/ss=;
        b=Nj7axxb9vG3qYY6oSwj0w/XS+ZiwRnZUY27s3NgF+AZvnx2Rdx0dPOodnROOaDdV/Y
         3Gr01ZByf95/fcDMwZ2Hv0hAyIWqY3Ox5hFvCxz4kfWV9AOjGeWum8x7J0PIKpvCeplr
         GAncU0trPPHDSqqOMWhXeBT5upflJQZcogYdq9ZIN5hJwFzcyVrPVFdmB14pQjkcoKL7
         xV8BQGAy2xCYR5y149P5lTabXyOaZG0utWrwLKPCf3sKmTurU34p3lCra18IFmEV5HrU
         AhB8K6COCeTbgk9blu9aiUYoy4zXQkJ2Cy3wpTNhlZBZHpbw/kl3lPbp0YrFUxiHgKXP
         IW9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZ0fZfPbBaSoGO25hKm1AKo07qLkICN61Z9ZRHe4foVVvCOTKh7
	tsencgIcG2CYrpv1oHcNebk=
X-Google-Smtp-Source: APiQypLI1xNE3SLNzMwt7E+zjFmtFVqx3X+GhM9AiiLoGXOhv9FAlTl2gcnl1eOA0vIf1mdYJ9PUhg==
X-Received: by 2002:a2e:870d:: with SMTP id m13mr20140361lji.64.1588155054075;
        Wed, 29 Apr 2020 03:10:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:59d1:: with SMTP id x17ls351643lfn.4.gmail; Wed, 29 Apr
 2020 03:10:53 -0700 (PDT)
X-Received: by 2002:ac2:4554:: with SMTP id j20mr22583662lfm.91.1588155053135;
        Wed, 29 Apr 2020 03:10:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588155053; cv=pass;
        d=google.com; s=arc-20160816;
        b=kgB+vsuaNpTEjNpY0oxxdmHFDDm1RSn/HaqPSEtIxTY8BTjvxN9nQFZuoIwjxbN4rv
         idPkiG8S5w6at/9ugZm/q1blbWhEDztKGsuKoT2bi/uT8A3tu8gXEUl9QqbXwANrSeVS
         PuFaX81H7QLyo5veJswg0yNvvgNHoz+p1LoBKydxMhuTiRAvFpFXHqBuD1KYV7IczCKI
         ztOCGIk5OHfR0CyPfnUFd1qgYLGJAsYzJiktwspzbUoEXVmgq0MCr7MG7QMu2hOmQT09
         o4oYfkEcN7/dpt2YrFgwTAVqnu9a2dUJ7ejoCHgUZsgHFQMILqcdzlRZa8utwwr49Pw6
         ABKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4hmHX2LbBxQLaH4SwsnQ7sasubpYuFooC5U3tFVie88=;
        b=gVollGoodvL3MAPfp3uVg6mj9sZwTDSD2BterwjS7fMVPsYdiSRmk1dMNfE8h9I2iI
         +Hux/F2FZdez/qN3647hD9vfv/y23ccU+et7IEkdUcwjK69r2DDBcm3eKhM7hISr4RhV
         ByaI40NWB3atJ+EvROHe6xGqwE/KS+kt1YWh8KERi+28vpl7il78CGvl5GWggff11D47
         il3TOjQTfmFoVeXEVzJSzbVCsjHDUuBMk4HvyKQh8Gzl6L1TS/zAjjyjG8TVBs4NbdZS
         jUC/MXaHxn32R4M9qi5Zf+jI/+ejHukm6Y7oUfSZiUp8Kdz8XIMgFmttuud2erncicaY
         d76g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=lS1yGWmX;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2059.outbound.protection.outlook.com. [40.107.22.59])
        by gmr-mx.google.com with ESMTPS id f17si118397lfp.0.2020.04.29.03.10.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2020 03:10:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.59 as permitted sender) client-ip=40.107.22.59;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXw4q3f40bCYsizFj7HCqNr8Czdc7np078hb4viGYLzMglPiII3oN4/BBSe3InPe/s/WKFSM1pwht2nU1Gj0pYNtsiOjw34k8y659hV9lVNgICVcFDPRVQUAM+IdOfowyuaAy7M71TSm/VwBGZQsrALKYi4s5KALa8Sn0u9CJTd2IzOXj3Eg8+KeakIs92v12mCXsmSeFPU4TvOaQy+fF4w3jLA2YgGYMkXzViYrmCblwkTK3b+UVrzY3DstYCoNzApXWZzSO7wFYRREBy9dcTiiE2J3CgRShC5/p3eBZnXbz2dzpnjt3HB0VnAw4OnoT/t4+0eviKrQqIoHQ4vIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hmHX2LbBxQLaH4SwsnQ7sasubpYuFooC5U3tFVie88=;
 b=ZY2QKd52dgscDwfJqaABMC5WOgUncm2cesBnBbbnr8eEKVCUEQTTiJVUpD5RUbfxtIFIhWXLQ3Exig040BbdMC+u1ls7WOKUaQiIuIAvFmDJC8f7+jv/QoTdtWtemZFQJ6kfhT71AAZcTpmA3r9GALECYs3vDEeZ/rlI0CxCnkcR+rxSU66YsE/mfaQh/2114vlwmaj8hK+eQeQCKkFOlYSNy/5BXUE7hUIMReoEt+eohHca95fny6p/NwFpWq6a9kBcDo46hR6C8MywNPxJz1RI72w55NzCdzgdXz2i/boFbH9XhqQ6NfA6zz1vqK4gcHJGu3kpxNpIkRbk2/EAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2741.eurprd04.prod.outlook.com (2603:10a6:4:98::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Wed, 29 Apr
 2020 10:10:50 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871%6]) with mapi id 15.20.2937.023; Wed, 29 Apr 2020
 10:10:50 +0000
From: peng.fan@nxp.com
To: alice.guo@nxp.com,
	jailhouse-dev@googlegroups.com
Subject: [PATCH V1 1/2] arm64: introduce smmu-v2 support
Date: Wed, 29 Apr 2020 18:02:00 +0800
Message-Id: <1588154521-2897-1-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR04CA0128.apcprd04.prod.outlook.com
 (2603:1096:3:16::12) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0128.apcprd04.prod.outlook.com (2603:1096:3:16::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2958.19 via Frontend Transport; Wed, 29 Apr 2020 10:10:48 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 25c39fe0-a7d8-4c0a-e1dd-08d7ec2597b3
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2741:|DB6PR0402MB2741:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2741DC876375C504CD482FCB88AD0@DB6PR0402MB2741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 03883BD916
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJSksdywfyZnoUx6xtMgCZd3WXqFbIoADlubY9bbHvv5OpSEFBC2JUvtyLCr4PA/9GJga/GLQ0Z3Bus38nPGuD6ohHDDOAwn+OOjZadxjFqhO+VS6s9GQiDFCj/WDIVRuxoNXXglwpyKo03l93d2L6EBDbvZBXAjTaeel++QlvIlzJXnHssAdc6+yZpmA+kmzwfx3vUV7Rab0z3PHz3MTffZIRoKTbJNmMaMUaG8IKneKC81mBLIhC+GJKCy3eebWeb4k3wpk9mkQFSXh/6i7NwiI3IUZ9cmbM4Diyhx9HfBQ4kiIoHHpbUuJ+5F48cqKTt/EMsHaDXauoasdHCTghJDuquolblnV3kTLFXXP7Yj9WxuwmHTqhRye3IlbCPmbCeOaJJFck7mPCZ2r/Li22ubJ+FYSG03wU7xOMAs+GMGe7IMidErhcRSfDcUtsqj1d/4dwqh9kQuk/8tp6kqrC4U/RdwebQ9dagoNAs6qRHYVCBjJF6iLJG8fo34+EFW7e4pcUjg2podn+C9xwLeBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(30864003)(2906002)(26005)(5660300002)(6506007)(36756003)(316002)(66556008)(66476007)(186003)(52116002)(6666004)(16526019)(9686003)(8676002)(69590400007)(66946007)(8936002)(6512007)(478600001)(2616005)(956004)(86362001)(6486002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: RjYJbGfuNONb7LicrBqa7QrC7n48X6pdRdBJO4yY85kqKjdl2iX/LapsBxP94HHYT0bCOB2DL9+5k8XJOa2kIT+aCbQyQj6rOBsslBwRT6c6TJtMNvTGQxtyp8wLtFP05t2a24q6JRta+DLFOaQmLHVRNq6zJr+Y02e5LU4oKdOVyS63XexSk4WKWcCWLRalgkfbTnXHz1fuWQIF8Ely3xZDW2pB6DE9mPorTMUDMSAbAJY5spOtZAJKuDN28L+yS9NzOIxz5OUmeotjOWLwyihi10G77u0hoRbmeIxbVSYhyoig1WPJc4u9nqsuA8PXlk525Phm4kim3aq/wTVCcsCdhyanOqeDwfa00hc6enMY2UMgFNLgjA+R0C1+N4eC6HJ0EzbDV5Knt9JXX81F/xgpnc+9RNKEqJ/4bxx6yjStRTTydKIPfzBbf7/GuF5wgVImKSw5rGmArNQ9BrK/EBuhd5NUBbDEDJujEFs0lWxksfi2fy6KgPZiFvZFAoUP/3GskP2EVCSYOGTEd7OfWmzB2t4YgcZSqV3dxUjvEE/SB31AkupfeP5XxUpoLV7AVfQJ31fwgq+ITwpWZm3mJz+iruxaAftuW+ABh/YhC/7XWw/vbakBnjMhBWRQwSxk+H/WyMLb7Ba9LukAmX6GCYQAgQlJ940ERv5exLMw3OcYuAMVLleewvPUJnHUCRCEHSKZLhI9CNsT3Rbf21SP3NL/7nv5zmW55gSSPqRZxcaLCoMBtQMgUJBXttqIWmb+0uQ2vvERfcnGGxCWbBweIrSpamvHUc5dng94V71AjNo=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c39fe0-a7d8-4c0a-e1dd-08d7ec2597b3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 10:10:50.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecmHRqSHbZ4czt+xU8YDg6QvMnjXJWBL4QWRG9k0O3UDC/gTjkSyAqdps8NB/s2ic1r+jkOduDfXyKfVVzCAdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2741
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=lS1yGWmX;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

From: Alice Guo <alice.guo@nxp.com>

Support smmu-v2 mmu500, add sid master support, only support stage2
translation.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm64/Kbuild          |   1 +
 hypervisor/arch/arm64/arm-smmu-regs.h | 220 ++++++
 hypervisor/arch/arm64/smmu.c          | 926 ++++++++++++++++++++++++++
 include/jailhouse/cell-config.h       |  15 +
 include/jailhouse/sizes.h             |  47 ++
 5 files changed, 1209 insertions(+)
 create mode 100644 hypervisor/arch/arm64/arm-smmu-regs.h
 create mode 100644 hypervisor/arch/arm64/smmu.c
 create mode 100644 include/jailhouse/sizes.h

diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index c34b0f32..e87c6e53 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -22,3 +22,4 @@ always := lib.a
 lib-y := $(common-objs-y)
 lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
 lib-y += iommu.o smmu-v3.o ti-pvu.o
+lib-y += smmu.o
diff --git a/hypervisor/arch/arm64/arm-smmu-regs.h b/hypervisor/arch/arm64/arm-smmu-regs.h
new file mode 100644
index 00000000..a1226e4a
--- /dev/null
+++ b/hypervisor/arch/arm64/arm-smmu-regs.h
@@ -0,0 +1,220 @@
+/*
+ * IOMMU API for ARM architected SMMU implementations.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ *
+ * Copyright (C) 2013 ARM Limited
+ *
+ * Author: Will Deacon <will.deacon@arm.com>
+ */
+
+#ifndef _ARM_SMMU_REGS_H
+#define _ARM_SMMU_REGS_H
+
+/* Configuration registers */
+#define ARM_SMMU_GR0_sCR0		0x0
+#define sCR0_CLIENTPD			(1 << 0)
+#define sCR0_GFRE			(1 << 1)
+#define sCR0_GFIE			(1 << 2)
+#define sCR0_EXIDENABLE			(1 << 3)
+#define sCR0_GCFGFRE			(1 << 4)
+#define sCR0_GCFGFIE			(1 << 5)
+#define sCR0_USFCFG			(1 << 10)
+#define sCR0_VMIDPNE			(1 << 11)
+#define sCR0_PTM			(1 << 12)
+#define sCR0_FB				(1 << 13)
+#define sCR0_VMID16EN			(1 << 31)
+#define sCR0_BSU_SHIFT			14
+#define sCR0_BSU_MASK			0x3
+
+/* Auxiliary Configuration register */
+#define ARM_SMMU_GR0_sACR		0x10
+
+/* Identification registers */
+#define ARM_SMMU_GR0_ID0		0x20
+#define ARM_SMMU_GR0_ID1		0x24
+#define ARM_SMMU_GR0_ID2		0x28
+#define ARM_SMMU_GR0_ID3		0x2c
+#define ARM_SMMU_GR0_ID4		0x30
+#define ARM_SMMU_GR0_ID5		0x34
+#define ARM_SMMU_GR0_ID6		0x38
+#define ARM_SMMU_GR0_ID7		0x3c
+#define ARM_SMMU_GR0_sGFSR		0x48
+#define ARM_SMMU_GR0_sGFSYNR0		0x50
+#define ARM_SMMU_GR0_sGFSYNR1		0x54
+#define ARM_SMMU_GR0_sGFSYNR2		0x58
+
+#define ID0_S1TS			(1 << 30)
+#define ID0_S2TS			(1 << 29)
+#define ID0_NTS				(1 << 28)
+#define ID0_SMS				(1 << 27)
+#define ID0_ATOSNS			(1 << 26)
+#define ID0_PTFS_NO_AARCH32		(1 << 25)
+#define ID0_PTFS_NO_AARCH32S		(1 << 24)
+#define ID0_CTTW			(1 << 14)
+#define ID0_NUMIRPT_SHIFT		16
+#define ID0_NUMIRPT_MASK		0xff
+#define ID0_NUMSIDB_SHIFT		9
+#define ID0_NUMSIDB_MASK		0xf
+#define ID0_EXIDS			(1 << 8)
+#define ID0_NUMSMRG_SHIFT		0
+#define ID0_NUMSMRG_MASK		0xff
+
+#define ID1_PAGESIZE			(1 << 31)
+#define ID1_NUMPAGENDXB_SHIFT		28
+#define ID1_NUMPAGENDXB_MASK		7
+#define ID1_NUMS2CB_SHIFT		16
+#define ID1_NUMS2CB_MASK		0xff
+#define ID1_NUMCB_SHIFT			0
+#define ID1_NUMCB_MASK			0xff
+
+#define ID2_OAS_SHIFT			4
+#define ID2_OAS_MASK			0xf
+#define ID2_IAS_SHIFT			0
+#define ID2_IAS_MASK			0xf
+#define ID2_UBS_SHIFT			8
+#define ID2_UBS_MASK			0xf
+#define ID2_PTFS_4K			(1 << 12)
+#define ID2_PTFS_16K			(1 << 13)
+#define ID2_PTFS_64K			(1 << 14)
+#define ID2_VMID16			(1 << 15)
+
+#define ID7_MAJOR_SHIFT			4
+#define ID7_MAJOR_MASK			0xf
+
+/* Global TLB invalidation */
+#define ARM_SMMU_GR0_TLBIVMID		0x64
+#define ARM_SMMU_GR0_TLBIALLNSNH	0x68
+#define ARM_SMMU_GR0_TLBIALLH		0x6c
+#define ARM_SMMU_GR0_sTLBGSYNC		0x70
+#define ARM_SMMU_GR0_sTLBGSTATUS	0x74
+#define sTLBGSTATUS_GSACTIVE		(1 << 0)
+
+/* Stream mapping registers */
+#define ARM_SMMU_GR0_SMR(n)		(0x800 + ((n) << 2))
+#define SMR_VALID			(1 << 31)
+#define SMR_MASK_SHIFT			16
+#define SMR_ID_SHIFT			0
+
+#define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
+#define S2CR_CBNDX_SHIFT		0
+#define S2CR_CBNDX_MASK			0xff
+#define S2CR_EXIDVALID			(1 << 10)
+#define S2CR_TYPE_SHIFT			16
+#define S2CR_TYPE_MASK			0x3
+enum arm_smmu_s2cr_type {
+	S2CR_TYPE_TRANS,
+	S2CR_TYPE_BYPASS,
+	S2CR_TYPE_FAULT,
+};
+
+#define S2CR_PRIVCFG_SHIFT		24
+#define S2CR_PRIVCFG_MASK		0x3
+enum arm_smmu_s2cr_privcfg {
+	S2CR_PRIVCFG_DEFAULT,
+	S2CR_PRIVCFG_DIPAN,
+	S2CR_PRIVCFG_UNPRIV,
+	S2CR_PRIVCFG_PRIV,
+};
+
+/* Context bank attribute registers */
+#define ARM_SMMU_GR1_CBAR(n)		(0x0 + ((n) << 2))
+#define CBAR_VMID_SHIFT			0
+#define CBAR_VMID_MASK			0xff
+#define CBAR_S1_BPSHCFG_SHIFT		8
+#define CBAR_S1_BPSHCFG_MASK		3
+#define CBAR_S1_BPSHCFG_NSH		3
+#define CBAR_S1_MEMATTR_SHIFT		12
+#define CBAR_S1_MEMATTR_MASK		0xf
+#define CBAR_S1_MEMATTR_WB		0xf
+#define CBAR_TYPE_SHIFT			16
+#define CBAR_TYPE_MASK			0x3
+#define CBAR_TYPE_S2_TRANS		(0 << CBAR_TYPE_SHIFT)
+#define CBAR_TYPE_S1_TRANS_S2_BYPASS	(1 << CBAR_TYPE_SHIFT)
+#define CBAR_TYPE_S1_TRANS_S2_FAULT	(2 << CBAR_TYPE_SHIFT)
+#define CBAR_TYPE_S1_TRANS_S2_TRANS	(3 << CBAR_TYPE_SHIFT)
+#define CBAR_IRPTNDX_SHIFT		24
+#define CBAR_IRPTNDX_MASK		0xff
+
+#define ARM_SMMU_GR1_CBA2R(n)		(0x800 + ((n) << 2))
+#define CBA2R_RW64_32BIT		(0 << 0)
+#define CBA2R_RW64_64BIT		(1 << 0)
+#define CBA2R_VMID_SHIFT		16
+#define CBA2R_VMID_MASK			0xffff
+
+#define ARM_SMMU_CB_SCTLR		0x0
+#define ARM_SMMU_CB_ACTLR		0x4
+#define ARM_SMMU_CB_RESUME		0x8
+#define ARM_SMMU_CB_TTBCR2		0x10
+#define ARM_SMMU_CB_TTBR0		0x20
+#define ARM_SMMU_CB_TTBR1		0x28
+#define ARM_SMMU_CB_TTBCR		0x30
+#define ARM_SMMU_CB_CONTEXTIDR		0x34
+#define ARM_SMMU_CB_S1_MAIR0		0x38
+#define ARM_SMMU_CB_S1_MAIR1		0x3c
+#define ARM_SMMU_CB_PAR			0x50
+#define ARM_SMMU_CB_FSR			0x58
+#define ARM_SMMU_CB_FAR			0x60
+#define ARM_SMMU_CB_FSYNR0		0x68
+#define ARM_SMMU_CB_S1_TLBIVA		0x600
+#define ARM_SMMU_CB_S1_TLBIASID		0x610
+#define ARM_SMMU_CB_S1_TLBIVAL		0x620
+#define ARM_SMMU_CB_S2_TLBIIPAS2	0x630
+#define ARM_SMMU_CB_S2_TLBIIPAS2L	0x638
+#define ARM_SMMU_CB_TLBSYNC		0x7f0
+#define ARM_SMMU_CB_TLBSTATUS		0x7f4
+#define ARM_SMMU_CB_ATS1PR		0x800
+#define ARM_SMMU_CB_ATSR		0x8f0
+
+#define SCTLR_S1_ASIDPNE		(1 << 12)
+#define SCTLR_CFCFG			(1 << 7)
+#define SCTLR_CFIE			(1 << 6)
+#define SCTLR_CFRE			(1 << 5)
+#define SCTLR_E				(1 << 4)
+#define SCTLR_AFE			(1 << 2)
+#define SCTLR_TRE			(1 << 1)
+#define SCTLR_M				(1 << 0)
+
+#define CB_PAR_F			(1 << 0)
+
+#define ATSR_ACTIVE			(1 << 0)
+
+#define RESUME_RETRY			(0 << 0)
+#define RESUME_TERMINATE		(1 << 0)
+
+#define TTBCR2_SEP_SHIFT		15
+#define TTBCR2_SEP_UPSTREAM		(0x7 << TTBCR2_SEP_SHIFT)
+#define TTBCR2_AS			(1 << 4)
+
+#define TTBRn_ASID_SHIFT		48
+
+#define FSR_MULTI			(1 << 31)
+#define FSR_SS				(1 << 30)
+#define FSR_UUT				(1 << 8)
+#define FSR_ASF				(1 << 7)
+#define FSR_TLBLKF			(1 << 6)
+#define FSR_TLBMCF			(1 << 5)
+#define FSR_EF				(1 << 4)
+#define FSR_PF				(1 << 3)
+#define FSR_AFF				(1 << 2)
+#define FSR_TF				(1 << 1)
+
+#define FSR_IGN				(FSR_AFF | FSR_ASF | \
+					 FSR_TLBMCF | FSR_TLBLKF)
+#define FSR_FAULT			(FSR_MULTI | FSR_SS | FSR_UUT | \
+					 FSR_EF | FSR_PF | FSR_TF | FSR_IGN)
+
+#define FSYNR0_WNR			(1 << 4)
+
+#endif /* _ARM_SMMU_REGS_H */
diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
new file mode 100644
index 00000000..ea1b4c1e
--- /dev/null
+++ b/hypervisor/arch/arm64/smmu.c
@@ -0,0 +1,926 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright 2018-2020 NXP
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Modified from Linux smmu.c
+ */
+
+#include <jailhouse/control.h>
+#include <jailhouse/ivshmem.h>
+#include <jailhouse/mmio.h>
+#include <jailhouse/paging.h>
+#include <jailhouse/pci.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/sizes.h>
+#include <jailhouse/string.h>
+#include <jailhouse/unit.h>
+#include <asm/spinlock.h>
+#include <jailhouse/cell-config.h>
+
+#include "arm-smmu-regs.h"
+
+#define ARM_32_LPAE_TCR_EAE		(1 << 31)
+#define ARM_64_LPAE_S2_TCR_RES1		(1 << 31)
+
+#define ARM_LPAE_TCR_EPD1		(1 << 23)
+
+#define ARM_LPAE_TCR_TG0_4K		(0 << 14)
+#define ARM_LPAE_TCR_TG0_64K		(1 << 14)
+#define ARM_LPAE_TCR_TG0_16K		(2 << 14)
+
+#define ARM_LPAE_TCR_SH0_SHIFT		12
+#define ARM_LPAE_TCR_SH0_MASK		0x3
+#define ARM_LPAE_TCR_SH_NS		0
+#define ARM_LPAE_TCR_SH_OS		2
+#define ARM_LPAE_TCR_SH_IS		3
+
+#define ARM_LPAE_TCR_ORGN0_SHIFT	10
+#define ARM_LPAE_TCR_IRGN0_SHIFT	8
+#define ARM_LPAE_TCR_RGN_MASK		0x3
+#define ARM_LPAE_TCR_RGN_NC		0
+#define ARM_LPAE_TCR_RGN_WBWA		1
+#define ARM_LPAE_TCR_RGN_WT		2
+#define ARM_LPAE_TCR_RGN_WB		3
+
+#define ARM_LPAE_TCR_SL0_SHIFT		6
+#define ARM_LPAE_TCR_SL0_MASK		0x3
+#define ARM_LPAE_TCR_SL0_LVL_2		0
+#define ARM_LPAE_TCR_SL0_LVL_1		1
+
+#define ARM_LPAE_TCR_T0SZ_SHIFT		0
+#define ARM_LPAE_TCR_SZ_MASK		0xf
+
+#define ARM_LPAE_TCR_PS_SHIFT		16
+#define ARM_LPAE_TCR_PS_MASK		0x7
+
+#define ARM_LPAE_TCR_IPS_SHIFT		32
+#define ARM_LPAE_TCR_IPS_MASK		0x7
+
+#define ARM_LPAE_TCR_PS_32_BIT		0x0ULL
+#define ARM_LPAE_TCR_PS_36_BIT		0x1ULL
+#define ARM_LPAE_TCR_PS_40_BIT		0x2ULL
+#define ARM_LPAE_TCR_PS_42_BIT		0x3ULL
+#define ARM_LPAE_TCR_PS_44_BIT		0x4ULL
+#define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
+#define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
+#define ARM_MMU500_ACTLR_CPRE		(1 << 1)
+
+#define ARM_MMU500_ACR_CACHE_LOCK	(1 << 26)
+#define ARM_MMU500_ACR_S2CRB_TLBEN	(1 << 10)
+#define ARM_MMU500_ACR_SMTNMB_TLBEN	(1 << 8)
+
+#define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
+#define TLB_SPIN_COUNT			10
+
+/* Maximum number of context banks per SMMU */
+#define ARM_SMMU_MAX_CBS		128
+
+/* SMMU global address space */
+#define ARM_SMMU_GR0(smmu)		((smmu)->base)
+#define ARM_SMMU_GR1(smmu)		((smmu)->base + (1 << (smmu)->pgshift))
+
+/*
+ * SMMU global address space with conditional offset to access secure
+ * aliases of non-secure registers (e.g. nsCR0: 0x400, nsGFSR: 0x448,
+ * nsGFSYNR0: 0x450)
+ */
+#define ARM_SMMU_GR0_NS(smmu)						\
+	((smmu)->base +							\
+		((smmu->options & ARM_SMMU_OPT_SECURE_CFG_ACCESS)	\
+			? 0x400 : 0))
+
+/* Translation context bank */
+#define ARM_SMMU_CB(smmu, n)	((smmu)->cb_base + ((n) << (smmu)->pgshift))
+
+#define MSI_IOVA_BASE			0x8000000
+#define MSI_IOVA_LENGTH			0x100000
+
+struct arm_smmu_s2cr {
+	enum arm_smmu_s2cr_type		type;
+	enum arm_smmu_s2cr_privcfg	privcfg;
+	u8				cbndx;
+};
+
+struct arm_smmu_smr {
+	u16				mask;
+	u16				id;
+	bool				valid;
+};
+
+struct arm_smmu_cb {
+	u64				ttbr[2];
+	u32				tcr[2];
+	u32				mair[2];
+	struct arm_smmu_cfg		*cfg;
+};
+
+struct arm_smmu_device {
+	void	*base;
+	void	*cb_base;
+	u32	num_masters;
+	unsigned long			pgshift;
+
+#define ARM_SMMU_FEAT_COHERENT_WALK	(1 << 0)
+#define ARM_SMMU_FEAT_STREAM_MATCH	(1 << 1)
+#define ARM_SMMU_FEAT_TRANS_S1		(1 << 2)
+#define ARM_SMMU_FEAT_TRANS_S2		(1 << 3)
+#define ARM_SMMU_FEAT_TRANS_NESTED	(1 << 4)
+#define ARM_SMMU_FEAT_TRANS_OPS		(1 << 5)
+#define ARM_SMMU_FEAT_VMID16		(1 << 6)
+#define ARM_SMMU_FEAT_FMT_AARCH64_4K	(1 << 7)
+#define ARM_SMMU_FEAT_FMT_AARCH64_16K	(1 << 8)
+#define ARM_SMMU_FEAT_FMT_AARCH64_64K	(1 << 9)
+#define ARM_SMMU_FEAT_FMT_AARCH32_L	(1 << 10)
+#define ARM_SMMU_FEAT_FMT_AARCH32_S	(1 << 11)
+#define ARM_SMMU_FEAT_EXIDS		(1 << 12)
+	u32				features;
+
+#define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
+	u32				options;
+	enum arm_smmu_arch_version	version;
+	enum arm_smmu_implementation	model;
+
+	u32				num_context_banks;
+	u32				num_s2_context_banks;
+	struct arm_smmu_cb		*cbs;
+
+	u32				num_mapping_groups;
+	u16				streamid_mask;
+	u16				smr_mask_mask;
+	struct arm_smmu_smr		*smrs;
+	struct arm_smmu_s2cr		*s2crs;
+	struct arm_smmu_cfg		*cfgs;
+
+	unsigned long			va_size;
+	unsigned long			ipa_size;
+	unsigned long			pa_size;
+	unsigned long			pgsize_bitmap;
+
+	u32				num_global_irqs;
+	u32				num_context_irqs;
+	unsigned int			*irqs;
+
+	spinlock_t			global_sync_lock;
+};
+
+enum arm_smmu_context_fmt {
+	ARM_SMMU_CTX_FMT_NONE,
+	ARM_SMMU_CTX_FMT_AARCH64,
+	ARM_SMMU_CTX_FMT_AARCH32_L,
+	ARM_SMMU_CTX_FMT_AARCH32_S,
+};
+
+struct arm_smmu_cfg {
+	u8				cbndx;
+	u8				irptndx;
+	union {
+		u16			asid;
+		u16			vmid;
+	};
+	u32				cbar;
+	enum arm_smmu_context_fmt	fmt;
+};
+#define INVALID_IRPTNDX			0xff
+
+enum arm_smmu_domain_stage {
+	ARM_SMMU_DOMAIN_S1 = 0,
+	ARM_SMMU_DOMAIN_S2,
+	ARM_SMMU_DOMAIN_NESTED,
+	ARM_SMMU_DOMAIN_BYPASS,
+};
+
+#define s2cr_init_val (struct arm_smmu_s2cr){	\
+	.type = S2CR_TYPE_BYPASS,		\
+}
+
+
+static struct arm_smmu_device smmu_device;
+static unsigned long pgsize_bitmap = -1;
+static u16 arm_sid_mask;
+
+static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
+{
+	struct arm_smmu_smr *smr = smmu->smrs + idx;
+	u32 reg = smr->id << SMR_ID_SHIFT | smr->mask << SMR_MASK_SHIFT;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_EXIDS) && smr->valid)
+		reg |= SMR_VALID;
+	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx), reg);
+}
+
+static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
+{
+	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
+	u32 reg = (s2cr->type & S2CR_TYPE_MASK) << S2CR_TYPE_SHIFT |
+		  (s2cr->cbndx & S2CR_CBNDX_MASK) << S2CR_CBNDX_SHIFT |
+		  (s2cr->privcfg & S2CR_PRIVCFG_MASK) << S2CR_PRIVCFG_SHIFT;
+
+	if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs &&
+	    smmu->smrs[idx].valid)
+		reg |= S2CR_EXIDVALID;
+	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(idx), reg);
+}
+
+static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
+{
+	if (smmu->smrs)
+		arm_smmu_write_smr(smmu, idx);
+
+	arm_smmu_write_s2cr(smmu, idx);
+}
+
+/* Wait for any pending TLB invalidations to complete */
+static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
+				void *sync, void *status)
+{
+	unsigned int spin_cnt, delay;
+
+	mmio_write32(sync, 0);
+	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
+		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
+			if (!(mmio_read32(status) & sTLBGSTATUS_GSACTIVE))
+				return;
+			cpu_relax();
+		}
+	}
+	printk("TLB sync timed out -- SMMU may be deadlocked\n");
+}
+
+static void arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
+{
+	void *base = ARM_SMMU_GR0(smmu);
+
+	spin_lock(&smmu->global_sync_lock);
+	__arm_smmu_tlb_sync(smmu, base + ARM_SMMU_GR0_sTLBGSYNC,
+			    base + ARM_SMMU_GR0_sTLBGSTATUS);
+	spin_unlock(&smmu->global_sync_lock);
+}
+
+#define ARM_SMMU_CB_VMID(cfg)		((cfg)->cbndx + 1)
+static void arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
+				       struct arm_smmu_cfg *cfg,
+				       struct cell *cell)
+{
+	struct arm_smmu_cb *cb = &smmu->cbs[cfg->cbndx];
+	struct paging_structures *pg_structs;
+	unsigned long cell_table;
+	u32 reg;
+
+	cb->cfg = cfg;
+
+	/* VTCR */
+	reg = ARM_64_LPAE_S2_TCR_RES1 |
+	     (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
+	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
+	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
+
+	reg |= (ARM_LPAE_TCR_SL0_LVL_1 << ARM_LPAE_TCR_SL0_SHIFT);
+
+	switch (PAGE_SIZE) {
+	case SZ_4K:
+		reg |= ARM_LPAE_TCR_TG0_4K;
+		break;
+	case SZ_64K:
+		reg |= ARM_LPAE_TCR_TG0_64K;
+		break;
+	}
+
+	switch (smmu->pa_size) {
+	case 32:
+		reg |= (ARM_LPAE_TCR_PS_32_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 36:
+		reg |= (ARM_LPAE_TCR_PS_36_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 40:
+		reg |= (ARM_LPAE_TCR_PS_40_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 42:
+		reg |= (ARM_LPAE_TCR_PS_42_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 44:
+		reg |= (ARM_LPAE_TCR_PS_44_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 48:
+		reg |= (ARM_LPAE_TCR_PS_48_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 52:
+		reg |= (ARM_LPAE_TCR_PS_52_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	default:
+		printk("Not supported\n");
+		break;
+		/* TODO */
+		//goto out_free_data;
+	}
+
+	reg |= (64ULL - smmu->ipa_size) << ARM_LPAE_TCR_T0SZ_SHIFT;
+
+	cb->tcr[0] = reg;
+
+	pg_structs = &cell->arch.mm;
+	cell_table = paging_hvirt2phys(pg_structs->root_table);
+	u64 vttbr = 0;
+
+	vttbr |= (u64)cell->config->id << VTTBR_VMID_SHIFT;
+	vttbr |= (u64)(cell_table & TTBR_MASK);
+	cb->ttbr[0] = vttbr;
+}
+
+static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
+{
+	u32 reg;
+	struct arm_smmu_cb *cb = &smmu->cbs[idx];
+	struct arm_smmu_cfg *cfg = cb->cfg;
+	void *cb_base, *gr1_base;
+
+	cb_base = ARM_SMMU_CB(smmu, idx);
+
+	/* Unassigned context banks only need disabling */
+	if (!cfg) {
+		mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, 0);
+		return;
+	}
+
+	gr1_base = ARM_SMMU_GR1(smmu);
+
+	/* CBA2R */
+	if (smmu->version > ARM_SMMU_V1) {
+		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64)
+			reg = CBA2R_RW64_64BIT;
+		else
+			reg = CBA2R_RW64_32BIT;
+		/* 16-bit VMIDs live in CBA2R */
+		if (smmu->features & ARM_SMMU_FEAT_VMID16)
+			reg |= cfg->vmid << CBA2R_VMID_SHIFT;
+
+		mmio_write32(gr1_base + ARM_SMMU_GR1_CBA2R(idx), reg);
+	}
+
+	/* CBAR */
+	reg = cfg->cbar;
+	if (smmu->version < ARM_SMMU_V2)
+		reg |= cfg->irptndx << CBAR_IRPTNDX_SHIFT;
+
+	/*
+	 * Use the weakest shareability/memory types, so they are
+	 * overridden by the ttbcr/pte.
+	 */
+	if (!(smmu->features & ARM_SMMU_FEAT_VMID16)) {
+		/* 8-bit VMIDs live in CBAR */
+		reg |= cfg->vmid << CBAR_VMID_SHIFT;
+	}
+	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
+
+	/*
+	 * TTBCR
+	 * We must write this before the TTBRs, since it determines the
+	 * access behaviour of some fields (in particular, ASID[15:8]).
+	 */
+	mmio_write32(cb_base + ARM_SMMU_CB_TTBCR, cb->tcr[0]);
+
+	/* TTBRs */
+	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_S) {
+		mmio_write32(cb_base + ARM_SMMU_CB_CONTEXTIDR, cfg->asid);
+		mmio_write32(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
+		mmio_write32(cb_base + ARM_SMMU_CB_TTBR1, cb->ttbr[1]);
+	} else {
+		mmio_write64(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
+	}
+
+	/* SCTLR */
+	reg = SCTLR_CFCFG | SCTLR_CFIE | SCTLR_CFRE | SCTLR_AFE | SCTLR_TRE |
+		SCTLR_M;
+
+	mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, reg);
+}
+
+static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
+{
+	void *gr0_base = ARM_SMMU_GR0(smmu);
+	int i;
+	u32 reg, major;
+
+	/* clear global FSR */
+	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR);
+	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR, reg);
+
+	/*
+	 * Reset stream mapping groups: Initial values mark all SMRn as
+	 * invalid and all S2CRn as bypass unless overridden.
+	 */
+	for (i = 0; i < smmu->num_mapping_groups; ++i)
+		arm_smmu_write_sme(smmu, i);
+
+	if (smmu->model == ARM_MMU500) {
+		/*
+		 * Before clearing ARM_MMU500_ACTLR_CPRE, need to
+		 * clear CACHE_LOCK bit of ACR first. And, CACHE_LOCK
+		 * bit is only present in MMU-500r2 onwards.
+		 */
+		reg = mmio_read32(gr0_base + ARM_SMMU_GR0_ID7);
+		major = (reg >> ID7_MAJOR_SHIFT) & ID7_MAJOR_MASK;
+		reg = mmio_read32(gr0_base + ARM_SMMU_GR0_sACR);
+		if (major >= 2)
+			reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
+		/*
+		 * Allow unmatched Stream IDs to allocate bypass
+		 * TLB entries for reduced latency.
+		 */
+		reg |= ARM_MMU500_ACR_SMTNMB_TLBEN | ARM_MMU500_ACR_S2CRB_TLBEN;
+		mmio_write32(gr0_base + ARM_SMMU_GR0_sACR, reg);
+	}
+
+	/* Make sure all context banks are disabled and clear CB_FSR  */
+	for (i = 0; i < smmu->num_context_banks; ++i) {
+		void *cb_base = ARM_SMMU_CB(smmu, i);
+
+		arm_smmu_write_context_bank(smmu, i);
+		mmio_write32(cb_base + ARM_SMMU_CB_FSR, FSR_FAULT);
+		/*
+		 * Disable MMU-500's not-particularly-beneficial next-page
+		 * prefetcher for the sake of errata #841119 and #826419.
+		 */
+		if (smmu->model == ARM_MMU500) {
+			reg = mmio_read32(cb_base + ARM_SMMU_CB_ACTLR);
+			reg &= ~ARM_MMU500_ACTLR_CPRE;
+			mmio_write32(cb_base + ARM_SMMU_CB_ACTLR, reg);
+		}
+	}
+
+	/* Invalidate the TLB, just in case */
+	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLH, 0);
+	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLNSNH, 0);
+
+	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
+
+	/* Enable fault reporting */
+	reg |= (sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE);
+
+	/* Disable TLB broadcasting. */
+	reg |= (sCR0_VMIDPNE | sCR0_PTM);
+
+	/* Enable client access, handling unmatched streams as appropriate */
+	reg &= ~sCR0_CLIENTPD;
+	reg &= ~sCR0_USFCFG;
+
+	/* Disable forced broadcasting */
+	reg &= ~sCR0_FB;
+
+	/* Don't upgrade barriers */
+	reg &= ~(sCR0_BSU_MASK << sCR0_BSU_SHIFT);
+
+	if (smmu->features & ARM_SMMU_FEAT_VMID16)
+		reg |= sCR0_VMID16EN;
+
+	if (smmu->features & ARM_SMMU_FEAT_EXIDS)
+		reg |= sCR0_EXIDENABLE;
+
+	/* Push the button */
+	arm_smmu_tlb_sync_global(smmu);
+	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0, reg);
+}
+
+static int arm_smmu_id_size_to_bits(int size)
+{
+	switch (size) {
+	case 0:
+		return 32;
+	case 1:
+		return 36;
+	case 2:
+		return 40;
+	case 3:
+		return 42;
+	case 4:
+		return 44;
+	case 5:
+	default:
+		return 48;
+	}
+}
+
+static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
+{
+	unsigned long size;
+	void *gr0_base = ARM_SMMU_GR0(smmu);
+	u32 id;
+	bool cttw_reg, cttw_fw = smmu->features & ARM_SMMU_FEAT_COHERENT_WALK;
+	int i;
+
+	printk("probing hardware configuration...\n");
+	printk("SMMUv%d with:\n", smmu->version == ARM_SMMU_V2 ? 2 : 1);
+
+	/* ID0 */
+	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
+
+	/* Restrict stage 2 */
+	id &= ~(ID0_S1TS | ID0_NTS);
+
+	if (id & ID0_S2TS) {
+		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
+		printk("\tstage 2 translation\n");
+	}
+
+	if (!(smmu->features &
+		(ARM_SMMU_FEAT_TRANS_S1 | ARM_SMMU_FEAT_TRANS_S2))) {
+		printk("\tno translation support!\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * In order for DMA API calls to work properly, we must defer to what
+	 * the FW says about coherency, regardless of what the hardware claims.
+	 * Fortunately, this also opens up a workaround for systems where the
+	 * ID register value has ended up configured incorrectly.
+	 */
+	cttw_reg = !!(id & ID0_CTTW);
+	if (cttw_fw || cttw_reg)
+		printk("\t%scoherent table walk\n", cttw_fw ? "" : "non-");
+	if (cttw_fw != cttw_reg)
+		printk("\t(IDR0.CTTW overridden by FW configuration)\n");
+
+	/* Max. number of entries we have for stream matching/indexing */
+	if (smmu->version == ARM_SMMU_V2 && id & ID0_EXIDS) {
+		smmu->features |= ARM_SMMU_FEAT_EXIDS;
+		size = 1 << 16;
+	} else {
+		size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
+	}
+	smmu->streamid_mask = size - 1;
+
+	if (id & ID0_SMS) {
+		smmu->features |= ARM_SMMU_FEAT_STREAM_MATCH;
+		size = (id >> ID0_NUMSMRG_SHIFT) & ID0_NUMSMRG_MASK;
+		if (size == 0) {
+			printk("stream-matching supported, but no SMRs present!\n");
+			return -ENODEV;
+		}
+
+		/* Zero-initialised to mark as invalid */
+		smmu->smrs = page_alloc(&mem_pool,
+					PAGES(size * sizeof(*smmu->smrs)));
+		if (!smmu->smrs)
+			return -ENOMEM;
+		memset(smmu->smrs, 0, PAGES(size * sizeof(*smmu->smrs)));
+
+		printk("\tstream matching with %lu register groups", size);
+	}
+	/* s2cr->type == 0 means translation, so initialise explicitly */
+	smmu->s2crs = page_alloc(&mem_pool, PAGES(size * (sizeof(*smmu->s2crs) + sizeof(*smmu->cfgs))));
+	if (!smmu->s2crs) {
+		page_free(&mem_pool, smmu->smrs,
+			  PAGES(size * sizeof(*smmu->smrs)));
+		return -ENOMEM;
+	}
+
+	smmu->cfgs = (struct arm_smmu_cfg *)(smmu->s2crs + size);
+
+	/* Configure to bypass */
+	for (i = 0; i < size; i++)
+		smmu->s2crs[i] = s2cr_init_val;
+
+	smmu->num_mapping_groups = size;
+
+	if (smmu->version < ARM_SMMU_V2 || !(id & ID0_PTFS_NO_AARCH32)) {
+		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH32_L;
+		if (!(id & ID0_PTFS_NO_AARCH32S))
+			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH32_S;
+	}
+
+	/* ID1 */
+	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID1);
+	smmu->pgshift = (id & ID1_PAGESIZE) ? 16 : 12;
+
+	/* Check for size mismatch of SMMU address space from mapped region */
+	size = 1 << (((id >> ID1_NUMPAGENDXB_SHIFT) & ID1_NUMPAGENDXB_MASK) + 1);
+	size <<= smmu->pgshift;
+	if (smmu->cb_base != gr0_base + size)
+		printk("SMMU address space size (0x%lx) differs from mapped region size (0x%tx)!\n",
+		       size * 2, (smmu->cb_base - gr0_base) * 2);
+
+	smmu->num_s2_context_banks = (id >> ID1_NUMS2CB_SHIFT) & ID1_NUMS2CB_MASK;
+	smmu->num_context_banks = (id >> ID1_NUMCB_SHIFT) & ID1_NUMCB_MASK;
+	if (smmu->num_s2_context_banks > smmu->num_context_banks) {
+		printk("impossible number of S2 context banks!\n");
+		return -ENODEV;
+	}
+	/* TODO Check More */
+	smmu->num_context_irqs = smmu->num_context_banks;
+
+	printk("\t%u context banks (%u stage-2 only)\n",
+	       smmu->num_context_banks, smmu->num_s2_context_banks);
+
+	smmu->cbs = page_alloc(&mem_pool, PAGES(smmu->num_context_banks * sizeof(*smmu->cbs)));
+	if (!smmu->cbs) {
+		/* TODO: Free smrs s2cr */
+		return -ENOMEM;
+	}
+
+	/* ID2 */
+	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID2);
+	size = arm_smmu_id_size_to_bits((id >> ID2_IAS_SHIFT) & ID2_IAS_MASK);
+	/* Reuse cpu table */
+	smmu->ipa_size = MIN(size, get_cpu_parange());
+
+	/* The output mask is also applied for bypass */
+	size = arm_smmu_id_size_to_bits((id >> ID2_OAS_SHIFT) & ID2_OAS_MASK);
+	smmu->pa_size = size;
+
+	if (id & ID2_VMID16)
+		smmu->features |= ARM_SMMU_FEAT_VMID16;
+
+	/*
+	 * What the page table walker can address actually depends on which
+	 * descriptor format is in use, but since a) we don't know that yet,
+	 * and b) it can vary per context bank, this will have to do...
+	 * TODO: DMA?
+	 */
+
+	if (smmu->version < ARM_SMMU_V2) {
+		smmu->va_size = smmu->ipa_size;
+		if (smmu->version == ARM_SMMU_V1_64K)
+			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_64K;
+	} else {
+		size = (id >> ID2_UBS_SHIFT) & ID2_UBS_MASK;
+		smmu->va_size = arm_smmu_id_size_to_bits(size);
+		if (id & ID2_PTFS_4K)
+			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_4K;
+		if (id & ID2_PTFS_16K)
+			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_16K;
+		if (id & ID2_PTFS_64K)
+			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_64K;
+	}
+
+	/* Now we've corralled the various formats, what'll it do? */
+	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S)
+		smmu->pgsize_bitmap |= SZ_4K | SZ_64K | SZ_1M | SZ_16M;
+	if (smmu->features &
+	    (ARM_SMMU_FEAT_FMT_AARCH32_L | ARM_SMMU_FEAT_FMT_AARCH64_4K))
+		smmu->pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
+	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_16K)
+		smmu->pgsize_bitmap |= SZ_16K | SZ_32M;
+	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_64K)
+		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
+
+	if (pgsize_bitmap == -1UL)
+		pgsize_bitmap = smmu->pgsize_bitmap;
+	else
+		pgsize_bitmap |= smmu->pgsize_bitmap;
+	printk("\tSupported page sizes: 0x%08lx\n", smmu->pgsize_bitmap);
+
+
+	if (smmu->features & ARM_SMMU_FEAT_TRANS_S1)
+		printk("\tStage-1: %lu-bit VA -> %lu-bit IPA\n",
+		       smmu->va_size, smmu->ipa_size);
+
+	if (smmu->features & ARM_SMMU_FEAT_TRANS_S2)
+		printk("\tStage-2: %lu-bit IPA -> %lu-bit PA\n",
+		       smmu->ipa_size, smmu->pa_size);
+
+	return 0;
+}
+
+static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
+{
+	void *gr0_base = ARM_SMMU_GR0(smmu);
+	u32 smr;
+
+	if (!smmu->smrs)
+		return;
+
+	/*
+	 * SMR.ID bits may not be preserved if the corresponding MASK
+	 * bits are set, so check each one separately. We can reject
+	 * masters later if they try to claim IDs outside these masks.
+	 */
+	smr = smmu->streamid_mask << SMR_ID_SHIFT;
+	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
+	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
+	smmu->streamid_mask = smr >> SMR_ID_SHIFT;
+
+	smr = smmu->streamid_mask << SMR_MASK_SHIFT;
+	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
+	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
+	smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
+}
+
+static int arm_smmu_find_sme(u16 id, u16 mask)
+{
+	struct arm_smmu_device *smmu = &smmu_device;
+	struct arm_smmu_smr *smrs = smmu->smrs;
+	int i, free_idx = -EINVAL;
+
+	/* Stream indexing is blissfully easy */
+	if (!smrs)
+		return id;
+
+	/* Validating SMRs is... less so */
+	for (i = 0; i < smmu->num_mapping_groups; ++i) {
+		if (!smrs[i].valid) {
+			/*
+			 * Note the first free entry we come across, which
+			 * we'll claim in the end if nothing else matches.
+			 */
+			if (free_idx < 0)
+				free_idx = i;
+			continue;
+		}
+		/*
+		 * If the new entry is _entirely_ matched by an existing entry,
+		 * then reuse that, with the guarantee that there also cannot
+		 * be any subsequent conflicting entries. In normal use we'd
+		 * expect simply identical entries for this case, but there's
+		 * no harm in accommodating the generalisation.
+		 */
+		if ((mask & smrs[i].mask) == mask &&
+		    !((id ^ smrs[i].id) & ~smrs[i].mask)) {
+			return i;
+		}
+		/*
+		 * If the new entry has any other overlap with an existing one,
+		 * though, then there always exists at least one stream ID
+		 * which would cause a conflict, and we can't allow that risk.
+		 */
+		if (!((id ^ smrs[i].id) & ~(smrs[i].mask | mask)))
+			return -EINVAL;
+	}
+
+	return free_idx;
+}
+
+static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)
+{
+	smmu->s2crs[idx] = s2cr_init_val;
+	if (smmu->smrs) {
+		smmu->smrs[idx].id = 0;
+		smmu->smrs[idx].mask = 0;
+		smmu->smrs[idx].valid = false;
+	}
+
+	return true;
+}
+
+#define for_each_smmu_sid(sid, config, counter)				\
+	for ((sid) = jailhouse_cell_stream_ids(config), (counter) = 0;	\
+	     (counter) < (config)->num_stream_ids;			\
+	     (sid)++, (counter)++)
+
+static int arm_smmu_cell_init(struct cell *cell)
+{
+	struct arm_smmu_device *smmu = &smmu_device;
+	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
+	struct arm_smmu_s2cr *s2cr = smmu->s2crs;
+	struct arm_smmu_cfg *cfg = &smmu->cfgs[cell->config->id];
+	struct arm_smmu_smr *smr;
+	const __u32 *sid;
+	unsigned int n;
+	int ret, idx;
+
+	/* If no sids, ignore */
+	if (!cell->config->num_stream_ids)
+		return 0;
+
+	if (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
+			      ARM_SMMU_FEAT_FMT_AARCH64_16K |
+			      ARM_SMMU_FEAT_FMT_AARCH64_4K))
+		cfg->fmt = ARM_SMMU_CTX_FMT_AARCH64;
+
+	cfg->cbar = CBAR_TYPE_S2_TRANS;
+
+	/* We use cell->config->id here, one cell use one context */
+	cfg->cbndx = cell->config->id;
+
+	if (smmu->version < ARM_SMMU_V2) {
+		/* TODO */
+	} else {
+		cfg->irptndx = cfg->cbndx;
+	}
+
+	cfg->vmid = cfg->cbndx + 1;
+
+	arm_smmu_init_context_bank(smmu, cfg, cell);
+	arm_smmu_write_context_bank(smmu, cfg->cbndx);
+
+	smr = smmu->smrs;
+
+	for_each_smmu_sid(sid, cell->config, n) {
+		ret = arm_smmu_find_sme(*sid, arm_sid_mask);
+		if (ret < 0)
+			printk("arm_smmu_find_sme error %d\n", ret);
+		idx = ret;
+
+		if (type == s2cr[idx].type && cfg->cbndx == s2cr[idx].cbndx)
+			printk("%s error\n", __func__);
+
+		s2cr[idx].type = type;
+		s2cr[idx].privcfg = S2CR_PRIVCFG_DEFAULT;
+		s2cr[idx].cbndx = cfg->cbndx;
+
+		arm_smmu_write_s2cr(smmu, idx);
+
+
+		smr[idx].id = *sid;
+		smr[idx].mask = arm_sid_mask;
+		smr[idx].valid = true;
+
+		arm_smmu_write_smr(smmu, idx);
+	}
+
+	printk("Found %d masters\n", n);
+
+	return 0;
+}
+
+static void arm_smmu_cell_exit(struct cell *cell)
+{
+	const __u32 *sid;
+	struct arm_smmu_device *smmu = &smmu_device;
+	unsigned int n;
+	int ret, idx;
+	int cbndx = cell->config->id;
+
+	if (!cell->config->num_stream_ids)
+		return;
+
+	/* If no sids, ignore */
+	if (cell->config->num_stream_ids) {
+		for_each_smmu_sid(sid, cell->config, n) {
+			ret = arm_smmu_find_sme(*sid, arm_sid_mask);
+			if (ret < 0)
+				printk("arm_smmu_find_sme error %d\n", ret);
+			idx = ret;
+
+			if (arm_smmu_free_sme(smmu, idx)) {
+				arm_smmu_write_sme(smmu, idx);
+			}
+
+			smmu->cbs[cbndx].cfg = NULL;
+			arm_smmu_write_context_bank(smmu, cbndx);
+		}
+	}
+}
+
+static int arm_smmu_init(void)
+{
+	int err;
+	__u64 phys_addr;
+	__u32 size;
+	struct arm_smmu_device *smmu = &smmu_device;
+
+	smmu->features &= ~ARM_SMMU_FEAT_COHERENT_WALK;
+
+	phys_addr = system_config->platform_info.arm.iommu_units[0].base;
+	if (!phys_addr) {
+		printk("No SMMU\n");
+		return 0;
+	}
+
+	size = system_config->platform_info.arm.iommu_units[0].size;
+
+	smmu->version =
+		system_config->platform_info.arm.iommu_units[0].arm_smmu_arch;
+	smmu->model =
+		system_config->platform_info.arm.iommu_units[0].arm_smmu_impl;
+	arm_sid_mask =
+		system_config->platform_info.arm.iommu_units[0].arm_sid_mask;
+	smmu->base = paging_map_device(phys_addr, size);
+	if (!smmu->base)
+		return -ENOMEM;
+
+	smmu->cb_base = smmu->base + size / 2;
+
+	err = arm_smmu_device_cfg_probe(smmu);
+	if (err)
+		return err;
+
+	if (smmu->version == ARM_SMMU_V2 &&
+	    smmu->num_context_banks != smmu->num_context_irqs) {
+		printk("found only %d context interrupt(s) but %d required\n",
+		       smmu->num_context_irqs, smmu->num_context_banks);
+		/* TODO: page free smr s2cr cbs */
+		return -ENODEV;
+	}
+
+	/* TODO: request irq */
+
+	arm_smmu_device_reset(smmu);
+	arm_smmu_test_smr_masks(smmu);
+
+	/*
+	 * For ACPI and generic DT bindings, an SMMU will be probed before
+	 * any device which might need it, so we want the bus ops in place
+	 * ready to handle default domain setup as soon as any SMMU exists.
+	 */
+	/* TODO: How handle PCI iommu? */
+
+	return arm_smmu_cell_init(&root_cell);
+}
+
+DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmu);
+DEFINE_UNIT_SHUTDOWN_STUB(arm_smmu);
+DEFINE_UNIT(arm_smmu, "ARM SMMU");
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 30ec5d06..a6a7d8c1 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -266,6 +266,10 @@ struct jailhouse_iommu {
 			__u32 tlb_size;
 		} __attribute__((packed)) tipvu;
 	};
+
+	__u32 arm_sid_mask;
+	__u32 arm_smmu_arch;
+	__u32 arm_smmu_impl;
 } __attribute__((packed));
 
 struct jailhouse_pio {
@@ -290,6 +294,17 @@ struct jailhouse_pio {
 #define SYS_FLAGS_VIRTUAL_DEBUG_CONSOLE(flags) \
 	!!((flags) & JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE)
 
+enum arm_smmu_arch_version {
+	ARM_SMMU_V1,
+	ARM_SMMU_V1_64K,
+	ARM_SMMU_V2,
+};
+
+enum arm_smmu_implementation {
+	GENERIC_SMMU,
+	ARM_MMU500,
+};
+
 /**
  * General descriptor of the system.
  */
diff --git a/include/jailhouse/sizes.h b/include/jailhouse/sizes.h
new file mode 100644
index 00000000..ce3e8150
--- /dev/null
+++ b/include/jailhouse/sizes.h
@@ -0,0 +1,47 @@
+/*
+ * include/linux/sizes.h
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __LINUX_SIZES_H__
+#define __LINUX_SIZES_H__
+
+#define SZ_1				0x00000001
+#define SZ_2				0x00000002
+#define SZ_4				0x00000004
+#define SZ_8				0x00000008
+#define SZ_16				0x00000010
+#define SZ_32				0x00000020
+#define SZ_64				0x00000040
+#define SZ_128				0x00000080
+#define SZ_256				0x00000100
+#define SZ_512				0x00000200
+
+#define SZ_1K				0x00000400
+#define SZ_2K				0x00000800
+#define SZ_4K				0x00001000
+#define SZ_8K				0x00002000
+#define SZ_16K				0x00004000
+#define SZ_32K				0x00008000
+#define SZ_64K				0x00010000
+#define SZ_128K				0x00020000
+#define SZ_256K				0x00040000
+#define SZ_512K				0x00080000
+
+#define SZ_1M				0x00100000
+#define SZ_2M				0x00200000
+#define SZ_4M				0x00400000
+#define SZ_8M				0x00800000
+#define SZ_16M				0x01000000
+#define SZ_32M				0x02000000
+#define SZ_64M				0x04000000
+#define SZ_128M				0x08000000
+#define SZ_256M				0x10000000
+#define SZ_512M				0x20000000
+
+#define SZ_1G				0x40000000
+#define SZ_2G				0x80000000
+
+#endif /* __LINUX_SIZES_H__ */
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1588154521-2897-1-git-send-email-peng.fan%40nxp.com.
