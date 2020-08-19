Return-Path: <jailhouse-dev+bncBDEN32754MOBBH4G534QKGQELJ7CI3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id F0915247F74
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 09:28:31 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id i6sf4204258lfd.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 00:28:31 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597735711; cv=pass;
        d=google.com; s=arc-20160816;
        b=wqED7xeL18nCz32fDNK89kn8bCdKOLOqsHtWbVEAzfcwbEe12Hrgo0vC5ZNfE58P9F
         Km7XHdOpPBQzyRz6Ol6TSCr6OWWBy5UkLLr++Tr4wzeWJ1RUDXTXo4/pLVPWjPfqZqYM
         JLJ6YkYgSPVYU27KUvhrkQnd4VznDEVupTbuubt521OKoHJ6ewDsO5nQ2R1Ogmy3LTvF
         RGJJpTilTRgDT1GQCKWILAOtou9KZRnvsfPVmUM01fDaTZDunNloJTtOcso1lnKIEgu6
         hnY/eHHY2CwFAtvJPUEJLbrI4lAqn60+Gt4294i3JoIMe6AWTD2yF5igtGdzMlLbnU2a
         vejg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=84RHvJH2iCBzgEqbavPRUrtb9hJe7KxEXTSa/o4pF4s=;
        b=RmSHpBbHD3VSPLLsrc7jkB2uattipVJdmOpc4CXI5Ialnicu1YEorqtDIrsgX5SoBm
         rfkaoGwrv6ok1x44f26RwnrVh/Rdnc5YH0+CBTrLL04l23PrEtAB3kShM/nMbYAdm2g7
         gBve4yoN6L5fNaQcjr3u3GmLNEA4c1wUMiWTCkgYd9JczrUUj+Nfau/1UM3CfQHyZOuL
         v+ncyLO0Bn5usifn6mIeZ+gpRmvIcfn7vszogXdANstLBs8ouxWxoaK87bBp/zm651Mv
         5P6etl2se048Ycm7YaXGE+v5dzkqJ1WzaZLbCeQ1Ag3oOP/clMc3gwQtcpoI0n+RnYzx
         91RA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=exNoNCFx;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.42 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=84RHvJH2iCBzgEqbavPRUrtb9hJe7KxEXTSa/o4pF4s=;
        b=PmWWKuhrblSAms088VRv+u5Mf1/1+UBLShDI2oRtq4AzgV1qITRWeTFIVdivaR+Ifd
         0ABwGdVMnS/BV6BBQmble0PealJ6VGbYxxOw/+u6iBYWro2pc4ZFdMe24w8XusdYJmoJ
         +26q7tPhEzZIFT+4b+YB+XvR82xNPu7jSqcMv/3KC3/lOfmAf5XH4MZm5kvOu29XRbkL
         T53zIPiKEzzCbEx24MTbboMU0pITt8esUAV5M3IsVMwXjR9PHKs1qsz+gQan0Pbz3Fq+
         GSP9/K5RqE9WwQMlQi/bAjm1TVZsVpFlYckVCC19gK3IZHuKYscAM2cOIB2Xg/zk21P+
         KACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=84RHvJH2iCBzgEqbavPRUrtb9hJe7KxEXTSa/o4pF4s=;
        b=YOymTOZzOX9209R9o26KKsF9kmr2ySI2WoV1sYS1FablXPmgCD3ILH+vtanaGo8NuF
         PFhIUUHRqzUW3E+8Pysy2dkE6nrSWJ330UlStCadhWVCdYWrF2AiCLQ1N0jh0pq5QkGw
         TXQlQRFCOOOjrnGePi8jBkBCqWYvWUdAPUsUpOxO1nLHuVI+QSAptPVt3clQXzG5QUSS
         s4JCtJ7lpn8gBvgI5bnhED05rOzrBiHtIwkaYYew+r4Y9c5VrL+EWrhb0mofXiz9Nboz
         MuszUUyaQGgpm81Mw7W7IrsSlm8iARx3q23nrvfUaf+fHdjKtdWyCRuYEqNFE4yGOPXA
         urCg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531UO2DZmU2ZqQKhd2NGpJefnXHFuRGlY5v4OTrsZJ9Sy3tz0Djb
	+xISLdpS5Bivq5RbmXgVrJ8=
X-Google-Smtp-Source: ABdhPJwa4ZZMnTMpWk1c6cNsc5Uelqgoc0pK8Zz2Mr7BLbY30PZIhSmJSuGMihIPg2b6rewG4n9PUw==
X-Received: by 2002:a2e:86d9:: with SMTP id n25mr9964650ljj.444.1597735711393;
        Tue, 18 Aug 2020 00:28:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4845:: with SMTP id 5ls736396lfy.2.gmail; Tue, 18 Aug
 2020 00:28:30 -0700 (PDT)
X-Received: by 2002:a19:8095:: with SMTP id b143mr9295962lfd.175.1597735710435;
        Tue, 18 Aug 2020 00:28:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597735710; cv=pass;
        d=google.com; s=arc-20160816;
        b=z0FAUV74yRgBEBlfyuLcpjQJ9bBcR9YhFohJTi7UcqxY4pPYDhHL8Bk0hAOOPGnjCS
         XV0rp2seAuOIJm4c3nnpDgj2Dw1QhQDICKdhxybWm8DCqrYYpUarvZg3Hn2vElWBm7Ww
         CGe654xqXVPvXrTphF8wRiqPfFO6IBi7RPJerHOpeq6UKF7DmQgzfps9kuwVm5wEF71L
         hS2R6ZNRgtaDZpJxYdHjIumqViU7IIwOaKzMOR0n/qWRpiMzvSX6mY1Ydv24ed6kETJg
         pjZ32RF1+GC77KA9CxuEgblpM/LZIjjJNhuKY6lqVIKH7PSHngTnyI/JwkZP5eS1ARPC
         xoFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3cAeaRKpI6+1NyB4v+1wMyt4Vo8bQCNHNJdJUofRBZs=;
        b=W0cnz2ixOnBPltO9TBqM3PCV+rkvdtdVgqE1Innh4jaPD/BwKOmqmVlwhhtGXjdI1f
         fLCqvGgAXy2iu6H4j8vvJYFz9TuCGR4rK4khks9hYGNg/fTQIIUVyiNl8MhFJTThaoNp
         xn0w7rXHJi/VKM83yT9aK6abtEWxas9REMbl8NrVosA6MT71YBkcYtFJXdIi6pB5eXXl
         0sB2DgpUJ4R70aImenPs8DdyR/HxtZcg3kmdKXo3HvdZEzO7yCUpupEcFWgwUB5z4E+Q
         WRcu3IVGhhGx98D/ctNu4DRLhRigW3UZtpWSunOwQuqU61UKupXLpIEnLH+LGuq7vF2e
         fwwQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=exNoNCFx;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.42 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70042.outbound.protection.outlook.com. [40.107.7.42])
        by gmr-mx.google.com with ESMTPS id a7si656431ljp.2.2020.08.18.00.28.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.42 as permitted sender) client-ip=40.107.7.42;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiN3v6QJ/2QhWcpX0vld/Hbhe2NLemuVKPlzOOBy+7vJ+JVG7AHhWFlBGn5Yj4p49xb0/e5YEoMHxyeMpjhkxXEVrMVgyaA19a/iSIdCNLIWSG9N/GqOV128FpGScRNzTVaU+hUpDXQygji90gnO05Pm4wJ4s1YwooW66lRhUw0ugRPDoHEuFnGv8fMYYZd4QTghLVwJ88ELOvi98Un33ujvXaOZMlAbK2LPxMZc/KuqfBTuNqLuLfXJBl+Mf9Q3ToiMv7k5lak3rhiQmnMApen0AiOoeo6wTU/+dz/3Gk9n8krQeV7hY2dOHL1mL3X4/CDD2e2RqUuRJoB2GqIlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cAeaRKpI6+1NyB4v+1wMyt4Vo8bQCNHNJdJUofRBZs=;
 b=Cfbjtp+knYCJ38VyOXGJsOUZq159dnVhSFRNz3E0Pbo7x54zTAYDpjKsOZsvZu8RHa4vt0ezl62aPgvms1c6SOvD+TXrN6YEUTGXqe5Rys7zAlH4CbXQEgaDUPODYDSh5d72vWmIGNRK79dkz7FbTIaRkLYCndMqPiUmZ9m2RTcX87ac3EIoxdPumpJsxbGhwFwzX4Kj+nUM2HNc5BD7xZQEaihbVB/d2lFYLvwEVj8iCRjzkotwE7dM5v8W3Bl3TPjL6v3lfHnRlLf3O3cR3de1ZNU0tUPZ3pD5jPOw9J/WRuk71vxC0aEgZkaK6nR3pAJOXr3Q2RbWbCPtJpi9Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB4058.eurprd04.prod.outlook.com (2603:10a6:5:1b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Tue, 18 Aug
 2020 07:28:28 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 07:28:28 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V3 1/4] arm64: support inmate cell in AArch32 mode
Date: Wed, 19 Aug 2020 22:28:04 +0800
Message-Id: <20200819142807.20972-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:3:2::24) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR0302CA0014.apcprd03.prod.outlook.com (2603:1096:3:2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.16 via Frontend Transport; Tue, 18 Aug 2020 07:28:26 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e281346-9103-4fcd-7f1c-08d843484cca
X-MS-TrafficTypeDiagnostic: DB7PR04MB4058:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4058146D2E9A281A15DFCEE0E25C0@DB7PR04MB4058.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q5WMkpMiTE3fO/sdv5GmK0pd8Yz7lfOTVg4q94RpizVK87Hi6hFmaJhfP5Ul9U5uOZwZ286zLLb+bSEV0GOB9Epjv7/oj1dcRmxj8LJz2MlL9ecSn/W9JfCDeuCJXUfKQ2a8d2sm/o75CBSkHIycgVEPBPuDF+NZRpmF77lIAs/hBGyfo314kPlC5VG7N7/q8PJgCx9s1+4VtJVqebFxd4HBpDI/nhJerN3bkv4vx0A7/0QXtm5frp1XHOH/5Z1vq0gVJE7jp80vwPW6otRMtC2Q3n2HgzU/L0TX3iWIKjsb0cU8jT1sQACohe/vmuNxPnrYvHQxm+hNbPklvLjHcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(83380400001)(52116002)(36756003)(86362001)(956004)(2616005)(44832011)(6512007)(1076003)(316002)(8676002)(4326008)(66556008)(186003)(66476007)(5660300002)(6506007)(16526019)(2906002)(66946007)(6486002)(8936002)(26005)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: KFxEvtrVdSBOPE0raMHC28VE/Vul3VqKqQeid11mTfof4TcBhFqr/vx9YuIPPx9Tu59X1Hwg4LckcP6mblOUYcq+xMzoO6MspLkQbB2j/pb6xIZLG2KF6JwIZ4/mUnHILIEcHm10EHNxKwcRwul5CT+NaRnB2CY9grp5oGz+36yb7UdAAmQ8qU2JFLnwLrk7RgGCwloKl/HcyHe93vSe0goymylDFcj+0IFyoaES+CPnVXVtrS7aFAAiCpFmWG5+FZpnVBZ8icGozPq517K0Ikd4OVNYn+y+dKmnYWZ3zcRWrRTdLypLxbW3BcHF3i5Vjw9D+8GkV1b/pfg0Rf+S4xlCdbDhHaVAhkOTATxvrLetJjqyyXnLysSxTavbkU0O6Mx3DvwY4Mnv44sAuBMKa9gv3+sTAwNLY8s3uZBVg/rB/1U0IAFnKXGa7OJ4hYtoSs2nHH3kuOtnxjwZCEObVj0N5Y+6qi85keg+2MlvZPWCTmy9mIOTXN/cWEz9M/qt2VnLH5HxBp/wI8H7R2BTuNJ1uAgqW9/B5mOj5QtSedtYR9zmOq0IED11YHBNSwAAGA6oC4aynvIDaeqgTfcyGfFG3vj3CQ4MnOkFqXpg82u8U7YaipL5y+UT+yWiCJuAMytVRJXthbI67RTSS/Qrow==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e281346-9103-4fcd-7f1c-08d843484cca
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 07:28:28.0798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fmhx5MHa4Gb9Alq+qo1gLuMPHAs0aq2rbXkWRR1jCF+WefhFo0RLAQQUdGfGGLBElDk+mQYFPGUEQQRArsYp5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4058
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=exNoNCFx;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.7.42 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

An AArch64 hypervisor can host both AArch32 and AArch64 virtual machines
at the same time. If the inmate cell wants to run in AArch32 mode, the
assigned cpu must change to AArch32. Because AArch64 hypervisor and
AArch64 root cell are used, when the AArch32 inmate cell is destroyed,
cpu owned by inmate cell will be reassigned to AArch64 root cell, switch
the cpu back to AArch64.

The following is a summary of some of the points when supporting inmate
cell in AArch32 mode:
Define a macro "JAILHOUSE_CELL_AARCH32" to indicate AArch32 execution
state. Add this macro to flags of struct jailhouse_cell_desc, and you can
use it to indicate whether a cell is AArch32.

Add "bool aarch32" as second parameter to arm_cpu_reset(), and can use
it to pass execution state. If aarch32 equals true, switch to AArch32.

When an exception occurs, the processor must execute handler code which
corresponds to the exception. When the exception is being taken at a
lower Exception level, the execution state of the next lower level
(AArch64 or AArch32) will be used. Fill exception handling functions for
Lower EL using AArch32 in hypervisor/arch/arm64/entry.S.

Configure the registers related to changing execution state. If a cell
is AArch32, SPSR_EL2.M[4] will be set to 0b1 which means AArch32
execution state, SPSR_EL2.M[3:0] will be set to 0b0011 which means
Supervisor, and HCR_EL2.RW will be set to 0b0 which means lower levels
are all AArch32. If a cell is AArch64, make sure HCR_EL2.RW is 0 and the
other registers are configured according to the previous code.

After Linux operating system boots up, execute the following commands to
use AArch32 virtual machine on the i.MX8DXL:
./jailhouse enable imx8dxl.cell
./jailhouse cell create imx8dxl-gic-demo-aarch32.cell
./jailhouse cell load 1 gic-demo.bin (32-bit)
./jailhouse cell start 1

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm-common/control.c             |  7 +++++--
 hypervisor/arch/arm-common/include/asm/control.h |  2 +-
 hypervisor/arch/arm/control.c                    |  2 +-
 hypervisor/arch/arm64/control.c                  | 14 ++++++++++++--
 hypervisor/arch/arm64/entry.S                    |  8 ++++----
 hypervisor/arch/arm64/include/asm/sysregs.h      |  6 +++++-
 include/jailhouse/cell-config.h                  |  1 +
 7 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index 70793432..3caa30c6 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -32,7 +32,9 @@ void arm_cpu_park(void)
 	enter_cpu_off(cpu_public);
 	spin_unlock(&cpu_public->control_lock);
 
-	arm_cpu_reset(0);
+	arm_cpu_reset(0, !!(this_cell()->config->flags &
+		      JAILHOUSE_CELL_AARCH32));
+
 	arm_paging_vcpu_init(&parking_pt);
 }
 
@@ -100,7 +102,8 @@ static void check_events(struct public_per_cpu *cpu_public)
 	if (cpu_public->wait_for_poweron)
 		arm_cpu_park();
 	else if (reset)
-		arm_cpu_reset(cpu_public->cpu_on_entry);
+		arm_cpu_reset(cpu_public->cpu_on_entry,
+		!!(this_cell()->config->flags & JAILHOUSE_CELL_AARCH32));
 }
 
 void arch_handle_sgi(u32 irqn, unsigned int count_event)
diff --git a/hypervisor/arch/arm-common/include/asm/control.h b/hypervisor/arch/arm-common/include/asm/control.h
index 2f54e2b5..9a5eaba7 100644
--- a/hypervisor/arch/arm-common/include/asm/control.h
+++ b/hypervisor/arch/arm-common/include/asm/control.h
@@ -29,7 +29,7 @@ void arch_shutdown_self(struct per_cpu *cpu_data);
 
 unsigned int arm_cpu_by_mpidr(struct cell *cell, unsigned long mpidr);
 
-void arm_cpu_reset(unsigned long pc);
+void arm_cpu_reset(unsigned long pc, bool aarch32);
 void arm_cpu_park(void);
 
 #endif /* !__ASSEMBLY__ */
diff --git a/hypervisor/arch/arm/control.c b/hypervisor/arch/arm/control.c
index 5e1828f6..cd68dd9a 100644
--- a/hypervisor/arch/arm/control.c
+++ b/hypervisor/arch/arm/control.c
@@ -20,7 +20,7 @@
 #include <asm/psci.h>
 #include <asm/sysregs.h>
 
-void arm_cpu_reset(unsigned long pc)
+void arm_cpu_reset(unsigned long pc, bool aarch32)
 {
 	u32 sctlr;
 
diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
index 6e1ffebf..aee81620 100644
--- a/hypervisor/arch/arm64/control.c
+++ b/hypervisor/arch/arm64/control.c
@@ -18,11 +18,12 @@
 #include <asm/psci.h>
 #include <asm/traps.h>
 
-void arm_cpu_reset(unsigned long pc)
+void arm_cpu_reset(unsigned long pc, bool aarch32)
 {
+	u64 hcr_el2;
+
 	/* put the cpu in a reset state */
 	/* AARCH64_TODO: handle big endian support */
-	arm_write_sysreg(SPSR_EL2, RESET_PSR);
 	arm_write_sysreg(SCTLR_EL1, SCTLR_EL1_RES1);
 	arm_write_sysreg(CNTKCTL_EL1, 0);
 	arm_write_sysreg(PMCR_EL0, 0);
@@ -67,6 +68,15 @@ void arm_cpu_reset(unsigned long pc)
 	/* AARCH64_TODO: handle PMU registers */
 	/* AARCH64_TODO: handle debug registers */
 	/* AARCH64_TODO: handle system registers for AArch32 state */
+	arm_read_sysreg(HCR_EL2, hcr_el2);
+	if (aarch32 == true) {
+		arm_write_sysreg(SPSR_EL2, RESET_PSR_AARCH32);
+		hcr_el2 &= ~HCR_RW_BIT;
+	} else {
+		arm_write_sysreg(SPSR_EL2, RESET_PSR_AARCH64);
+		hcr_el2 |= HCR_RW_BIT;
+	}
+	arm_write_sysreg(HCR_EL2, hcr_el2);
 
 	arm_write_sysreg(ELR_EL2, pc);
 
diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
index 27e148c6..4789e933 100644
--- a/hypervisor/arch/arm64/entry.S
+++ b/hypervisor/arch/arm64/entry.S
@@ -401,8 +401,8 @@ hyp_vectors:
 	ventry	.
 	ventry	.
 
-	ventry	.
-	ventry	.
+	handle_vmexit arch_handle_trap
+	handle_vmexit irqchip_handle_irq
 	ventry	.
 	ventry	.
 
@@ -425,8 +425,8 @@ hyp_vectors_hardened:
 	ventry	.
 	ventry	.
 
-	ventry	.
-	ventry	.
+	handle_abort_fastpath
+	handle_vmexit irqchip_handle_irq
 	ventry	.
 	ventry	.
 
diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
index 0105b109..e5984dbc 100644
--- a/hypervisor/arch/arm64/include/asm/sysregs.h
+++ b/hypervisor/arch/arm64/include/asm/sysregs.h
@@ -15,19 +15,23 @@
 
 #define PSR_MODE_MASK	0xf
 #define PSR_MODE_EL0t	0x0
+#define PSR_MODE_SVC	0x3
 #define PSR_MODE_EL1t	0x4
 #define PSR_MODE_EL1h	0x5
 #define PSR_MODE_EL2t	0x8
 #define PSR_MODE_EL2h	0x9
 
+#define PSR_32_BIT	(1 << 4)
 #define PSR_F_BIT	(1 << 6)
 #define PSR_I_BIT	(1 << 7)
 #define PSR_A_BIT	(1 << 8)
 #define PSR_D_BIT	(1 << 9)
 #define PSR_IL_BIT	(1 << 20)
 #define PSR_SS_BIT	(1 << 21)
-#define RESET_PSR	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT \
+#define RESET_PSR_AARCH64	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT \
 			| PSR_MODE_EL1h)
+#define RESET_PSR_AARCH32	(PSR_A_BIT | PSR_I_BIT | PSR_F_BIT \
+			| PSR_32_BIT | PSR_MODE_SVC)
 
 #define MPIDR_CPUID_MASK	0xff00ffffffUL
 #define MPIDR_CLUSTERID_MASK	0xff00ffff00UL
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 6df4a745..2a968dd5 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -56,6 +56,7 @@
 
 #define JAILHOUSE_CELL_PASSIVE_COMMREG	0x00000001
 #define JAILHOUSE_CELL_TEST_DEVICE	0x00000002
+#define JAILHOUSE_CELL_AARCH32		0x00000004
 
 /*
  * The flag JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED allows inmates to invoke
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200819142807.20972-1-alice.guo%40nxp.com.
