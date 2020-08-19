Return-Path: <jailhouse-dev+bncBDEN32754MOBBKEG534QKGQE6NWQVQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id F15CD247F78
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 09:28:40 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id l14sf7903165wrp.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 00:28:40 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597735720; cv=pass;
        d=google.com; s=arc-20160816;
        b=cOQuE4m9/cbLNMDjdOzZoKNoTJOcGMrsVdDErFWX5oWtCTwDka17yUxH8RkwHUv+Rj
         Q1fZKus7ojAMky4v4exabgFvNQZ55l9COO5vqbMhpLg+0jOQ5orm+GqKp1keOG55Ar+K
         jsinPuUGWzbyuHi6/cQkoyFj6kFZ9IwdRlL4MCGOt5swyvdw0d9yrjtUkfxLXQ0rMPTJ
         stW8M4ZlGK5YbuUnin4tDJz9GpBS9+adjuDZY2D3F+LzrE5cG8KtxuMx2gL7gM3RLba3
         CsvH1PG5u3OQemUFSI+oAMkZ1Z0e8NC9bArz1LgaPRJ3ZN6P/1AIxLIktyxzPvADF+s2
         dxCA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=YJ6mO9aPiasK5gM8X7GyOKI7N7rl/HZ3bN30sid+a+0=;
        b=T0X9qB9xjWgALHrjCD3BDWq9KSgu2M2ZzFru/ibU/ez8MXdc1nfUb2YTlbaC/7QOx1
         zFi3nYXM8WP0pfl42RyebsIggvQFfZ+R9KiUvC9TI3udDTENJFVSQ4Rm5NPvKWFCj6VV
         uUkWXEvZkSZcrJTTo94QifvOrM1IR/9VuaDUYCxKdxXiHmqWvl/6xgEzVxYsF6FXZlem
         qEL2nEQzfOF+6AWesxHLsh5LPRwAd+y8rB7QePcuZp8Nu8jAsYmHUR2s7v5B6vDklLx4
         CL8H0mC9otH6coQMvuvqmDVjGkyXs00jdVUArmT4rSlp0/QcJHK42O0aXGZ2Ka1W9rFF
         hedA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Eb6CnUkR;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.48 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YJ6mO9aPiasK5gM8X7GyOKI7N7rl/HZ3bN30sid+a+0=;
        b=VftUdRioXDYkT3oFvoNSyW7MehcYaUvVRZ2K1FqCeEa5NGzeeDFXL4w8MjmGIIa+RW
         cuQnUCvMZTGYV3kvasQqS79hCsc+f2RFuUKDC2wHQViYZ4plC0QBaDxjGIdWEpJKaBnN
         Z1B/tqGwBDshb0vkaUyylt5NSGPcjH47iyjoPXp8oL+NP/FDhT/sAp5BrmZBojfvgmlk
         We6w1HAOofCNdW+8dmXeVZt7rBzRYb10Mwf75DsKCCH5NUD59RCmn1HjPNDgMVt48j92
         sMjHzL8stADC6BZUqJpFGGgLl89NnsWY3BK4ep6pAdj3HbkierA7qq8lxyGHtAJcZ2o7
         JkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YJ6mO9aPiasK5gM8X7GyOKI7N7rl/HZ3bN30sid+a+0=;
        b=hIBlSOBArbT867Sh5qve38ys7mjXxRdUhfv7TyTt8VQXKhamhzXXb9IHcRTKZ8i07g
         2OQcNDYtlJg9GzzOEQ5pozCJ9kWstEyCzuM/+ACFQSQVVwrGxn9uPUuoIuzZOKrIXgdk
         NJSgsmjwMOcQ3a8ePTchPYBtA41IjZdwW0hBH5QH3fQRzmeQwJm3h1RTf4HPsGFWbrWL
         aDt1B4vz+bMY4oZdYLioSV5agoRr0MMudr2B9fIm52FEXRydiQgr4/h9TeX1U+T/16uK
         k63pvfxdbCjl6b0mTXiUT3W7z4jrPsIwSGBYYLo943JDJ13Hr1GtbfvJxriBVthMhq1L
         UpFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530gEt7aei/eRmC0Yy31G5wRqGvre/nZALgaYpqc0USLa+5bxvOe
	mUtxTB54ACWpZVA7BVV++kk=
X-Google-Smtp-Source: ABdhPJx4KEBCyf2lsc6qmvWxzIkAfni1PxModvEJr2L2Pd1lZ5sSsdf1sTiLkQftnNn6tflON/PUhA==
X-Received: by 2002:adf:dfd0:: with SMTP id q16mr20572241wrn.60.1597735720674;
        Tue, 18 Aug 2020 00:28:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:3802:: with SMTP id f2ls677577wma.0.canary-gmail; Tue,
 18 Aug 2020 00:28:39 -0700 (PDT)
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr18447632wmj.153.1597735719879;
        Tue, 18 Aug 2020 00:28:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597735719; cv=pass;
        d=google.com; s=arc-20160816;
        b=IG1rrZV+666S2X/+bS9Z4WeRq9vB0u2IE2uBaWfIoOKuDQyR8OWnh+edEZIEsFSf+z
         vvtWZZxDYlJDz5ZcoHzZfD8bur815DFJmw4TxEWobvzimeKMl4RKMGF5W9feNphhppEb
         vft1YNyrDNZu4+58DimBm1wMyhAhYHfHcXUKqKHrgW2o7lZlon3EbXIx2IUVRPu7zZ2v
         yKEROPsgoz1bNuQKPP06zfUaAHLZp91vFTm1BbQ29BOnSGqONeF6CoPCzD7CNnD0Wofd
         3Sc1bJdtSPBu8WQYeov15aSzPdR2E8pWpx7v0UC+bPOVm/eZVhLbZ5bZm1wFTrQ52IvC
         rCKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zOhLzRycssuM5qWYCSBpgfm1lo1qmQ8SOOl1SU42jCI=;
        b=Etap1wSfygcV2VsozmqP8iL66BHHx+TuCvRgeEbkGsuyDgDkkzNcsTLh0T+TXxn86p
         5Z0ShCNqVXQz8hVw0xVC3HOxIVNV7bvXH7sBwOvhfXRmzkD1u+PdOVzsWA+dylgXbbli
         6yJCv+wK+qzi+UUsQ8nqHqrUvf/j3tP7OSRRSrwFD6eeqh+KgY25CDa+tXBzlsbYbO4P
         nP3HXM9kfe/75QQc+rXquuLCmN35BTlWA2gj+uAlbf3p2HS+Nh8oHxjw/7tJGVIhPw9r
         7Vr+VGRZ1Uiqisqzu1W3DZqYWqWLQgKYYI/KCSAHRtpzr5TO48T939+fzh6EZFlLmmtI
         uC7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Eb6CnUkR;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.48 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70048.outbound.protection.outlook.com. [40.107.7.48])
        by gmr-mx.google.com with ESMTPS id i17si564420wrw.4.2020.08.18.00.28.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:28:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.48 as permitted sender) client-ip=40.107.7.48;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMrgK0ZhiZBcOn5pyzH9E2M0/mKNzOBB5WllNYpMgXT4EsrxrRF60eCd25fhyAe/uW21LozEbZzVwMrgbzcmCXB3AERtKxM6SKGbiFfZihxJ1vVfNFJBqxUoaeFVVXcD7cy259GDfiv8wK2s5q6HIbEDaufZJGs9P0p8lrgeDlq3PmWgB2AaAMpt4Nm7HXkzssAf46gnxHzUWfTlsHeBG57G1ficntkjYhmkZFkqqHze1hru2COpmCt/bUTNvKMxq+eTijlPgrhzwEMGihD/BEsBAWKTa6XmrYU4vvA91n68aoLnLdQ/+auBb0VDwfdEOULxIFbRLYZnimRYKD16zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOhLzRycssuM5qWYCSBpgfm1lo1qmQ8SOOl1SU42jCI=;
 b=AiGjJhnaVOIH9E0es++/qSOdDdr28QQlW9TQ6TEdwtBq/non45YvXNFffB01BI5a7kMDhhKfRtccyBHvoYkbtSEKa5hl6glXU6Q4COoffX7biabhKu9KBPTcabZD9yjSNrNRW/fT5IiPcz1FNNK2SqkoTIljt1DmAcCXIzuHrzo50kauui1buinaZEjuvZ0K/lc4wYrXzVL5Xyq0sHXOmuQw9+YB/3MepT9p5d+Epkb01Uci6xxdiAAfp4kL3UF7duSXWw7DeKczwLmtV7vAv6yJiejk/FwMMAcGMb6i3yRVTj8QRH7sKCCzyWyqsoudUdLfHQznmbK7tZ6XWFT7SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB4058.eurprd04.prod.outlook.com (2603:10a6:5:1b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Tue, 18 Aug
 2020 07:28:38 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 07:28:38 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V3 4/4] configs: arm64: imx8dxl: add cell configuration files
Date: Wed, 19 Aug 2020 22:28:07 +0800
Message-Id: <20200819142807.20972-4-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819142807.20972-1-alice.guo@nxp.com>
References: <20200819142807.20972-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:3:2::24) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR0302CA0014.apcprd03.prod.outlook.com (2603:1096:3:2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.16 via Frontend Transport; Tue, 18 Aug 2020 07:28:36 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f46e30a-b58b-4c07-cda0-08d843485305
X-MS-TrafficTypeDiagnostic: DB7PR04MB4058:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4058117ADE32F84CC301BCDDE25C0@DB7PR04MB4058.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyaueHk8O89Iij6PKAt6E+lY9xS6UBTKL5SR4/9xnYqzJ5Qais9yNM1K/U1KmlIcX0GFBPHOgbA8+bLTfk+ZQ/2/kK6InjDDHONeG4GvmWvjfZdmtQRVjcU1ZwdOUZHLWjA1LwnT+NhTEUXTnUkRjlZFYkHuFXvTIkR1fPACMsvRePrsQ+ZEq9e7XSM1VYptDxZRWO0O78VOhazoYtDygwvop9a5m0OQATLHK4a5SxrpxsuRaLkyrVhV6xHyxsuaoaSGdLGyhcRmy8iv3TB0ngRLEZ3k4hP4+jMequ6yx+hfn/b6V6dzYgGgty7VNwz2820syJWHXs0zio9yJ9brXQ5JDDmg2v0ES/VCf1KCX1EvWOYsbX44oCy6p+fNMn4y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(83380400001)(52116002)(36756003)(86362001)(956004)(2616005)(44832011)(6512007)(1076003)(316002)(8676002)(4326008)(66556008)(186003)(66476007)(5660300002)(6506007)(16526019)(2906002)(66946007)(6486002)(8936002)(26005)(478600001)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: eFpetpDUJ5CO1wJGJn7mvR1Y+4PYK3dlhJgg96fHPypq+kFP1hHRb0QKRVYTPLYVvpUIH+ldvxcgcBzP7OWhL4BGdjvGGnTiKB4zmDENBWDJIKJoBkqy9xHCyTiuGSl2SWlexc9XM9Du5Du1byG4utD5W7tJjgoF5R69EYMKlwtk4RYd+v1luRrYSDFp+m/XLMfBH/XaQ383YVWL5qcNQXZSSha5x7n55ghQhYXpOsec/xP1f31cP/69RVz4AhM3vouBSR9lAgGOU2xu8x1tbD2ICnKQT9A5Hvh/UiMNjJ7vYZ1fzqv6Ct7Rf2u7/qqE3bdcmuQKVi53rbTuyDif9GzTbKWNqlbk7LDH8I671jBP49hwuZHe2fGOVmm+kJK+3ZHemUYYnO5XO1XnLTNLE8uU6+dQ88jZGPbMTVe+sXHwqWePKcaTioRcHhGjwjlVd5AQwZjJvaGynmRZTG4GzDFOk0CRaoIpqTOoa9iElLiTy6qRKFs+eXbubXekZowCr360zxMsRSDIsf7HkoOlm6/g7q0GzzSfpDa1MfJ6whFGNDvIAdiOTBFxNpfwn0dv8AfqVkxZu/NOmDUb1xlRbQTvxYrMdACBIN8tOpgyHJiGYai+XIc0jlLIGMHCn6Phmacef26UOGYLp5ZL+lVTAw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f46e30a-b58b-4c07-cda0-08d843485305
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 07:28:38.6154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3prw7YRjYyn2y+wislmUS+E9lfHg86LQrcc8vz9lbzo18D4ZPAePzsy6Dx0FuuySEjMD0bcJ4IcH9RrJCq+qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4058
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Eb6CnUkR;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.7.48 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Add "imx8dxl-inmate-demo-aarch32.c" to support AArch32 VM on the imx8dxl
platform. Distinguish whether it is AArch32 inmate cell by the macro
JAILHOUSE_CELL_AARCH32.

Add "imx8dxl-inmate-demo.c" for AArch64 VM.

"imx8dxl.c" is used for the root cell.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8dxl-inmate-demo-aarch32.c |  14 ++
 configs/arm64/imx8dxl-inmate-demo.c         |  68 ++++++++
 configs/arm64/imx8dxl.c                     | 173 ++++++++++++++++++++
 3 files changed, 255 insertions(+)
 create mode 100644 configs/arm64/imx8dxl-inmate-demo-aarch32.c
 create mode 100644 configs/arm64/imx8dxl-inmate-demo.c
 create mode 100644 configs/arm64/imx8dxl.c

diff --git a/configs/arm64/imx8dxl-inmate-demo-aarch32.c b/configs/arm64/imx8dxl-inmate-demo-aarch32.c
new file mode 100644
index 00000000..f18d40a1
--- /dev/null
+++ b/configs/arm64/imx8dxl-inmate-demo-aarch32.c
@@ -0,0 +1,14 @@
+/*
+ * iMX8DXL target - gic-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Alice Guo <alice.guo@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#define USE_AARCH32
+#include "imx8dxl-inmate-demo.c"
diff --git a/configs/arm64/imx8dxl-inmate-demo.c b/configs/arm64/imx8dxl-inmate-demo.c
new file mode 100644
index 00000000..089a0b8d
--- /dev/null
+++ b/configs/arm64/imx8dxl-inmate-demo.c
@@ -0,0 +1,68 @@
+/*
+ * iMX8DXL target - gic-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Alice Guo <alice.guo@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "gic-demo",
+#ifdef USE_AARCH32
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG | JAILHOUSE_CELL_AARCH32,
+#else
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+#endif
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+		.console = {
+			.address = 0x5a060000,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* UART1 */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xa1700000,
+			.virt_start = 0,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	}
+};
diff --git a/configs/arm64/imx8dxl.c b/configs/arm64/imx8dxl.c
new file mode 100644
index 00000000..f94692bc
--- /dev/null
+++ b/configs/arm64/imx8dxl.c
@@ -0,0 +1,173 @@
+/*
+ * i.MX8DXL Target
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Alice Guo <alice.guo@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xbfc00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_CON_TYPE_IMX_LPUART |
+				 JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0xbf700000,
+			.pci_mmconfig_end_bus = 0x0,
+			.pci_is_virtual = 1,
+			.pci_domain = 0,
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x51a00000,
+				.gicr_base = 0x51b00000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "imx8dxl",
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 2, /* Not include 32 base */
+		},
+	},
+
+	.cpus = {
+		0x3,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xbf900000,
+			.virt_start = 0xbf900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbf901000,
+			.virt_start = 0xbf901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbf90a000,
+			.virt_start = 0xbf90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbf90c000,
+			.virt_start = 0xbf90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbf90e000,
+			.virt_start = 0xbf90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbfa00000, 0),
+		/* MMIO (permissive): TODO: refine the map */ {
+			.phys_start = 0x00000000,
+			.virt_start = 0x00000000,
+			.size =	      0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x80200000,
+			.virt_start = 0x80200000,
+			.size = 0x21d00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */{
+			.phys_start = 0xa1700000,
+			.virt_start = 0xa1700000,
+			.size = 0x1e000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Loader */{
+			.phys_start = 0xbfb00000,
+			.virt_start = 0xbfb00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 288,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 0000:00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 0000:00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200819142807.20972-4-alice.guo%40nxp.com.
