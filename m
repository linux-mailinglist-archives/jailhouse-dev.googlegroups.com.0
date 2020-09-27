Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBZWKX75QKGQEJOWBJBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE0C279D41
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 03:05:42 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id 6sf1879853lju.22
        for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Sep 2020 18:05:42 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601168742; cv=pass;
        d=google.com; s=arc-20160816;
        b=k1b/JuHGtwRPiEPgCOBGGImDlEhLNmPzv2SwhZLykZulPlZ5TXX/T90DfdMaLs/upZ
         0N2fqSfLttFUwLSlyx73bYO37FU0HLtp2Odm87XVVwHoB3PKcHHRLcbA/e1Vt9WGQ37j
         o9qI13Mz47/khs/XzF550A5OwS7jNWRGGkYSMhMZbnCkFIPCaoj1mdPEM7rT/XZ1T56t
         RFviP2zKT2BGQNYXVJyZiXkeaSFttW+MaIyyQ8ztMnAuXVsMiMCLB5seLXLt8QEvIJ9W
         GE96+N4ieYXxfyR3aI5NSNqaEAZxr7wIie1O4u5QFrl0QJNlleT2hoL7iAaZZ7WRExBk
         i58Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=7MNF6spTkRlo4T/vzcX55sv2bp05Ose4yyXZrtNVaho=;
        b=LK4S67urJVTkX81+2PugJ09xwZ/bFgyj30Tx9r8bbGuG9PNRY+QAFRMotmZCc5/Km+
         vH9ea1wzncj7FNxgPzXlG+IotXVFL4XvsLluM/nAzx4C6TNlwl1U2yy2/oo1HkxyPJQs
         3MsNm/In8CBPvNP9/Flmn2rCOdYUjxEDBLEe5l4lnCa46stzs7W67thOscs1ofcvUt18
         HWEFmxvF00gWqlSEeDS/yyirluv1uKlnCHQNhQKoCGxEnFuyhxielFEieVJratnJhDcK
         G92UwfcDNYjNEg72+y22xBdVdP74xy2/ISLFZnE0tDt9hgyTC3lm4rKhTYNT/fdAfUyp
         nbrg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=FHcag0RF;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7MNF6spTkRlo4T/vzcX55sv2bp05Ose4yyXZrtNVaho=;
        b=oP83xIefAtMfLHElr0HEY+AsxuE9vAH+iO7K3p2MIcUoFoeGv1GC8G98Z2r+IRrq5V
         TnI4+KUXpvzzQ8pIOZPZboap9HTE7W9+J0Sy8QqGSGFWREmfV6JG2HdlRaL/U8LT5pFM
         Nj47KDKR6G6Gi+UKl3d0PZBhCc9eRcWK0bGA+FGPFeB+qrwO/gdULgLEe1gvjTBNneRz
         g/YRPoZLDKejS5Tg4FnEPmTPVSXVIp2hi9W38QVXv79rKN5fo5LCLlK0DjeZuSA5vHwd
         Cv2aH3PmTudoNu06l6sLOtuAeCieFnParPGdM55qyKrAZBgBcy4SMbiyZWxBOhfbpDCV
         vnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7MNF6spTkRlo4T/vzcX55sv2bp05Ose4yyXZrtNVaho=;
        b=U5uenug1pNNoweR3QKefL0Rs3+oU3w69ostr5J6mym8iQPjEEMvptW0WycTNGJnOnZ
         IRV4lp6xtoNQO5tZ3V0sAsSfsKCKMJ3CParHUUkfABb3UASauR5nvjvIut7p1MOjy2Ez
         bMn9j/HHy2WWhH3sPaGzZmFAQKLAJWQqs/Ns1ytCJGUhDsz/6oTF+S4wuJcAdcZtG3Z3
         Fbb+wq2RU5g7fBtorWGR2H2Jm3XDUK2ODT7bvWcbYJEmjPcA3XwQPfqIlRN5m/y6+ZYV
         WiSO1riowoPBQuJzPfw4nIPm9xQLETDm/G+jdkWRG9z379ZT2JYYZTX6pB8JFxu3BNET
         SagA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533T4YA0VbbGuTUpmjvAIFJk59ubPtBLyv3LmBnQ0GNmdyn0JX5n
	EToGuuCwzr6A/BBe2MD34Mk=
X-Google-Smtp-Source: ABdhPJxvOZyrUhN6h94Sb5DHSMDXHVS7kP7+s0LQFOUoWD33egAUubAY+va4gohh3fz0meBbTSUShA==
X-Received: by 2002:ac2:5685:: with SMTP id 5mr1966968lfr.161.1601168742392;
        Sat, 26 Sep 2020 18:05:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls2400607lfn.2.gmail; Sat, 26 Sep
 2020 18:05:41 -0700 (PDT)
X-Received: by 2002:ac2:5586:: with SMTP id v6mr2045707lfg.71.1601168741265;
        Sat, 26 Sep 2020 18:05:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601168741; cv=pass;
        d=google.com; s=arc-20160816;
        b=T3AtojgkArzcrdOADRGT/MNZgRat+/7kwjmmxSEqHGwwpzWY5GHqkN+by0QcLb5+1l
         8Yu5sf3lqtwiI6r0PNMtretonLdiDiCGtyVgfw7ZSkaMiSK+b88xCXcs5G01pEB9aPhD
         Grhjnox3iJaU78PL3xDanAenfeu2OxkFcnoDts10O99JmTpFcJaZkVL/a8u3E+UiANn0
         iJsgsKoeKKJ++gD/RI7B3yJJI/OiOoWZCk5AGCfUdJYgQjfCkcXWtXWoIMIN9iQ0WkyO
         Vg6xq1sbcBFkAWS7kOdz6bw1vm26PY87OnY3UjFKXA3Yxr7EtIGNDBv/yIdjVWdVTLCg
         B+6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=1ncmvF/NYOB5gL7z0e0Ie5esk7uNnkM0Fkx0YqB5E28=;
        b=WbnX2VwxBCVBqbO3R8MpWa7rAxY3moCkiU1e6+3P0H0eCIadf1nRlYoW0zJ6x2UuX0
         GEcwcXlKlBg1zVIbZDNjuJiHZ9vE4aNV1rLy84z9G0Vu4J/j3rXICyxoC4ui3lAZj9cn
         dUqc2nUW6FGu4BD1c1vC32dbyjnVI7balSW8q4IlwjW7CcunjHBwXbKdir2ED5R190ZP
         747syPSF+RlgcygLNKFEhCAI25dScLDkaPc26hasThV70POqrdW9DNg4cHCOatnNAqW3
         NL6q6W6Sx6k9FXr00nuPnPmnde0tds2Hc1e9fKnOlBh03e+hWyMbj+FkiUk7UA1/tj8x
         gV1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=FHcag0RF;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20055.outbound.protection.outlook.com. [40.107.2.55])
        by gmr-mx.google.com with ESMTPS id k10si97510ljj.0.2020.09.26.18.05.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 Sep 2020 18:05:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.55 as permitted sender) client-ip=40.107.2.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBp4csTaGpUuEO+58d4yKb1HKtkdC63t433OHbt6QcpU5GmUKzjf3tsMbCCzLR1pq/q84kRd8NZ8AbelRDXyQku0do3Qq4PEw3Oe70R8kTY3fKBJ1brAXQuhq5vEt/nYAG+hY+QBcg2B0oFmU54W3v8dsxZjy00wzAMxhZIdLbPmQ21C4x/VPukm0wwKe0NdLFwif3WtWpZrBEjPS+GPHdWlxkcvY7Vx5VZp60VTtu5ymeiNBbKoIpvaTr6QRCih5xOFsIJsWg9O8HdLXYnuXzmYoMz9vh8rcf2LFLB4FWZqRU8OhW32gYbqMY/9YZoeHtPCYnVj7F1BPa7r5cbhEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ncmvF/NYOB5gL7z0e0Ie5esk7uNnkM0Fkx0YqB5E28=;
 b=A+GvVF76Lk/Jc16kLD977lZLj1yX4inI5JXCzXp3YuQEpARECySGHQISh1Ud78vXxvAiofbL7t8iQtooPBQPvgycvW4TbuiFDBBi7abfxg90AXZF0s7kupebCRvOH+yj3JjLSo3NDPYfJwm0C/QAK2osmKR3BDpcPamgc/rWEph5ILvNOz+oQqiBWUbAGu+9bkP4hrMSiszkjJ+OImGeAfpF5q9Y2Mv9Ya5pntZM8ecOlSs+ID6q4Fhdun37xmNJlNZv8YX/IN55bvQdb4CqIVlhhFnlO4XYLwslLuTtgj+u5P2EsNNtjIQjx34+tkJMc315G1njhg8OPwR3/2IZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2375.eurprd04.prod.outlook.com (2603:10a6:4:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Sun, 27 Sep
 2020 01:05:39 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 01:05:39 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 5/8] arm64: smmu: Fold __arm_smmu_tlb_sync into single
 caller
Thread-Topic: [PATCH 5/8] arm64: smmu: Fold __arm_smmu_tlb_sync into single
 caller
Thread-Index: AQHWkxjh54KOUDmOvUKUa/IuvH+ZpKl7ri+w
Date: Sun, 27 Sep 2020 01:05:39 +0000
Message-ID: <DB6PR0402MB27600226E882EF8168827D5688340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
 <fee50d3d617b6ab72c4e22371adf31b394a9454b.1601023807.git.jan.kiszka@siemens.com>
In-Reply-To: <fee50d3d617b6ab72c4e22371adf31b394a9454b.1601023807.git.jan.kiszka@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9571d5f1-7ac2-4757-4fc3-08d8628172ec
x-ms-traffictypediagnostic: DB6PR0401MB2375:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2375F82C6C402EEE79EB126088340@DB6PR0401MB2375.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mfBrd00VyMF839rrhz0COsT9PkXwoTy53BtdZ6zG/PCTwbSgmzK18sK2hOurSdMP94qaMJ5hl9FBryg7JxsnBaG+8p2xW7Adf3aiFCL5EJfx4R3ka2E9RV1zId/nQ5gPeUKZrQZ+Vu5Gqjvd1yJhocwGCcgpbS/Vop0MHKnz55V65OPaXzxsbW1BJQEVAXCQ3ppVgsu7o2SN8S10R4T6k6RVP5uz9BXum45Ol9Ux8Rr/MCUVAW02qDU+vE5hK1SqaUXJ3M6NEUp5Bn8GSmKQNFdIu/9pa3Am+cXekecooP7IweE51wGgM4qPaF7W2uQazxbPrdIlnbh2HHz4C8HRdtOBR8PO3QdslP8XF6rVmBrY2M+Oe9NkdJQOxEETy8lW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(52536014)(33656002)(8676002)(9686003)(26005)(2906002)(83380400001)(76116006)(66946007)(66476007)(66556008)(44832011)(478600001)(66446008)(86362001)(55016002)(64756008)(71200400001)(186003)(7696005)(8936002)(6506007)(110136005)(4326008)(316002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 8rV0nMsYX4FUVbzGQbeKE9rnNkmR1CQKJ6nlvSnEa3j0kWg+xeHWniRKfhRaZ4mkyTjtFhPQqINb0Zqt7I4fmg46nQUZMxEeRobS5XFMnKNcYVK9IHT5XezoZb/p3ubKdWuPMYzwASFfRM/VxyBrflCYwXCApRa83KN7wEnDuOl+4W1ez5nSo8Sh5LFmBoCKx+cBqpkHFhcxPipn/VbNAkjOY84gnezDa0GLwRlglM8DGV90eUsuyW1LQvqL4sDHDFnAxybt1LmbhWYRuhF48Mgv3Mp2lCrLUhSeMXIfOquKKJND4Z/DXL9D9m1n18xcVRChBkmmv3oNxahv+XA9WMi81NDUt8MRA8FeQaDl8iiicoLXNav2bvZ4bGgZ4NsruNDDU9tSw5EJVoVhnnX10aRnAZEm8qQlCsXAUcpCHJvA5unprGzjqrfkAvUabi3ut7UGLWc2jY/Loij71BhpThpGT8ZAIlewphOjzV/InNlcqCiuWX2KKcJq5NQBQrbJLFLgFwiiPx3NuH16UTXJUWoruVZddbAXqFihSwZPPhFc2pY37ejwtFcd0NF2PoLl82OkzQCB8EQkP09ReWgFriE1eL9l+r2eFyelp1EGV3Ka0W6luDgGW79anzGwE7Abuax9GN4UlIBHhYfMTAPsAg==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9571d5f1-7ac2-4757-4fc3-08d8628172ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 01:05:39.0948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lnblWY6UG+fJ/J7DxRPXJ8n/h2xGgGCCqfvhMNt3vcO8pdddTIOZSn5TsN8ZUPpu7UpbRfXfZWXQbmbWe679lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2375
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=FHcag0RF;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.2.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: [PATCH 5/8] arm64: smmu: Fold __arm_smmu_tlb_sync into single
> caller
> 
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> No need to have that inner function separately.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/arch/arm64/smmu.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index dc476618..2cd5157c 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -320,14 +320,15 @@ static void arm_smmu_write_sme(struct
> arm_smmu_device *smmu, int idx)  }
> 
>  /* Wait for any pending TLB invalidations to complete */ -static int
> __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
> -				void *sync, void *status)
> +static int arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
>  {
> +	void *base = ARM_SMMU_GR0(smmu);
>  	unsigned int delay, i;
> 
> -	mmio_write32(sync, 0);
> +	mmio_write32(base + ARM_SMMU_GR0_sTLBGSYNC, 0);
>  	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
> -		if (!(mmio_read32(status) & sTLBGSTATUS_GSACTIVE))
> +		if (!(mmio_read32(base + ARM_SMMU_GR0_sTLBGSTATUS) &
> +		      sTLBGSTATUS_GSACTIVE))
>  			return 0;
>  		for (i = 0; i < 10 * 1000000; i++)
>  			cpu_relax();
> @@ -337,17 +338,6 @@ static int __arm_smmu_tlb_sync(struct
> arm_smmu_device *smmu,
>  	return trace_error(-EINVAL);
>  }
> 
> -static int arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu) -{
> -	int ret;
> -	void *base = ARM_SMMU_GR0(smmu);
> -
> -	ret = __arm_smmu_tlb_sync(smmu, base +
> ARM_SMMU_GR0_sTLBGSYNC,
> -			    base + ARM_SMMU_GR0_sTLBGSTATUS);
> -
> -	return ret;
> -}
> -
>  static int arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
>  				      struct arm_smmu_cfg *cfg,
>  				      struct cell *cell)

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> --
> 2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB27600226E882EF8168827D5688340%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
