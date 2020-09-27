Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBG6JX75QKGQEDS4JHPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id BD058279D3D
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 03:02:20 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id 23sf789659lfy.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Sep 2020 18:02:20 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601168540; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZYokE6Y4PWO4lCquKDpfC52knyV6Lb6oCfTunQDqvIcVhPkBxfTfgSRlaKec/V5Xrp
         bQfkFejWL8V1/cXNsUMRyf/TNXxdx2DtfAfsCEF+JxFxF9/StiCAIz0qO9d2UPRKI4mL
         4K+fJQeBXbK3aAlKQEPc+ugzyAbf5ZXoF6EOOibbu8NZFAAxq15eVMV9bmVn1Fyb/yzM
         o/OgU4EBDwW1cA8HBsebJjQDglyHamMj7SE7VdBiFlpyemjF6tO3+BuWjtuJVb0mJlBJ
         kuLb7yffgJHF2afAyMyDAHoM48CreCRf2xTXsXJIJ7FE4j0URLva+BxMHrCQ0BktZQyw
         Y0XA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=Gmz2xDF7N1m7cqxev47uC5rrB4IkKrcbQxuSfhOcU9Y=;
        b=ply5N+6Yr4sMcWdAuUP1WoDsOvf8KLvxmKKTIjnaI+8o4KbmPKSHb3B/uO0lqkR3m7
         1X3IfsL4ioKQ94mpzE9KOeko0fcZouM2ys+lOPX8tLm2mObFQHL5cFHDMm4yvS16B1Dc
         QeQ7VmOIWOZ8gY4E803PavVSKABu4n8Vc5BrE2us4fTtw1Tz4ts9lu3TiybWpzfic1Pw
         Uvgwc3oZlOGwqen1KRKSrPXAXKAS3oNtSHXuX14yCZ0DqqlnyJVNleavE7vYwDzUCS89
         eRCZaLiK8vXkGWQqhUIuaFb+pUxCxsEUld7YvY2BXvMeQ7yX/N81Kn2K1mWYTxo02Mbu
         4KCQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="Cwx5mu/d";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.87 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Gmz2xDF7N1m7cqxev47uC5rrB4IkKrcbQxuSfhOcU9Y=;
        b=XsM0XLQAQ1o/YmzVMKe9B8ilyr9kvW7F6+ITUReO05EFrfvowWGzFfP4rB4lk0fnL2
         Amigdn6VlUGo2yy1t+dRJaMOrBGu3C4nroQd9ijL8okQEaGVEd7z/bD5PzIf+pb6M/pa
         J3QLE9Vdlr5ngJ+fzEz9AhXS2RJ1jgHPJxGE2VPK8KJNdnDiUlZie1k5cWCcY655nH3r
         y8yxoyv26h3njWYD+4AemXVEzEE4co14HflQ/Zlgvx9BW65EYSvOp+VHfQZO2afP5IrY
         YK+Ibh0ThZBOPM6+p1xLAWGgzHacUkB42ayCYXiJ3AqLJ/dJPKLSs7tHLrc/EQ0RHeZk
         U3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Gmz2xDF7N1m7cqxev47uC5rrB4IkKrcbQxuSfhOcU9Y=;
        b=caKAIVYwQl86GyJn7NdUgYl6e/rn/8X+V0rI/rTmeGNxlgDUDZ/rt7anr9Si1SJ5X+
         /naVralwhbfVIv+GVrNYZsAb7Obg/sWwh0tjWk4jffBafQp46npTDQqPMxOJc5DQWqv2
         1NGeDihq/5SUh6Z3mssPMqhgz0dv1SrhkaMrxa/nDXqO1clKvak6xtFs9Q9utHD6/pct
         oSaqIrlld0T/EVVbOCbV/mYE2Q+kh6HG/MamuH3yOlnoi3oVaIxDrW6B91veGNltq6L/
         4pDtvg+vPr2+9NVm0w8rq+XfI4rcQYxKWBYHdiSygaF2F6oq/h5mUxR3Ql+8F1qW42qm
         vIUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530xYHt4GH7C+f9ULNbUZY2JibcNwzfTh7djVAVXl7FvAowrGspJ
	koS+WaflLwB0eRyzpntCMhg=
X-Google-Smtp-Source: ABdhPJwkKWLiR9r4tXc3tDIkDDFWF2XVahNDfBo9Yi0H4ndww/fgiHYW8OsYLt70TZCqiXW8BpAzBw==
X-Received: by 2002:a2e:a376:: with SMTP id i22mr2948047ljn.336.1601168540253;
        Sat, 26 Sep 2020 18:02:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3c13:: with SMTP id j19ls790300lja.10.gmail; Sat, 26 Sep
 2020 18:02:19 -0700 (PDT)
X-Received: by 2002:a2e:7a04:: with SMTP id v4mr3367823ljc.128.1601168538990;
        Sat, 26 Sep 2020 18:02:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601168538; cv=pass;
        d=google.com; s=arc-20160816;
        b=OIa5qkv7L2i48pLa16R+4kDrakYWmNa5buh/6Qnf+vlDPEpIWmTe18ZlT4rEHVGMlr
         4bFLMykbWLMuDl7cm0YTS79QB8GT9cBnOVHx4ief2xFvBKGZMnqx4GcDx5SWgqFHQy9L
         5iPfH1hxoqw1+WRU894PbYST00PiwGYo8J5nDssOh+FBbMvQemi1D5jZCZzsdQALdOk1
         0sS8vXwOOMxtM5mgjvtL9B5YrIgHAbtYJ6K4JJGrBmFQ6iebC0ISCroIu8pbLEY3wAhd
         yjwE0fzhtL5+FbPi7FBoVBRlxiXUuWNcPeORlueDpAflnUDxkZagaXyBmMgm+Me308qD
         mG+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=jp3pUtOmycMKNcqb5EZ7VHVDe6lUx83hg4TwjczcjY4=;
        b=m70Bc6EE6n31R2l4Vi7/OFApHtROTqQvg1CQPkw5rpWEYf1gp415pWKi5UHzyZ+tLB
         0j8nhA9AasntUVHQufxgiVOXIas4hONQ3qjVoEA7kM3b8yHtaTJXW3a+QMMrm2eDYSJ6
         skcQJoZpKAwAYHH5yeEVbtIIIM7BHzdk59XJlB5Nmapb73XYOMhjlfCVpUoK48VyVPNL
         DJ2qhZn4LcqNc638b/345vU/DBKSqD4UoYXiZx24ZszwTKV4XNllB5Mgq/caqEa9znoM
         E/DFmQUUeQw/zJhICNWI2bsvJC604eVxvflUZkh4T5JTyTGKCEcl9paSi7eoHJBRD8mw
         63Eg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="Cwx5mu/d";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.87 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130087.outbound.protection.outlook.com. [40.107.13.87])
        by gmr-mx.google.com with ESMTPS id 21si74158ljq.5.2020.09.26.18.02.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 Sep 2020 18:02:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.87 as permitted sender) client-ip=40.107.13.87;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAgr7dVdnzH/xHkSo8IdhK7ANUjaKTF+6LOt6bUiJF9uC+Um4XgkRQU7e5xMSQkIjGugdd7+l0FC+Gi9kAz747bXxDPciz5MDi1w5RvdTfA6m6N8ixotFYTwvoJ34SIbrPERMSrrRHjfCnVyjFYCExFF7I+y859GKx7XfEi11uRJYU9w1x8QC5PcJL0l/gub5pWPhZwu/Mtz/nKu0H6Su3avE8qS6kWlrVTDObqsPv8Y+8kVIIq09TPxolshMa69KPQmnhiEABsR6jQCzKgKEsrwXjlZU8/tITbLW3VsYxnruRiWsRzlAMSk24a0yZ8yAju//2GVnKZRJJ9WjSe7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jp3pUtOmycMKNcqb5EZ7VHVDe6lUx83hg4TwjczcjY4=;
 b=bztQMrgRpiA/WcYVY2A2g/Azcf+yqJHaepdDhDCC8JUCRU+byeXqIA8E5VqMPzhJbc5Iju7rdizJDP6O9rdzTd629Btbb+AkLeRFOSwm5i36aZU3Tsz7eTJz+LeCIPMPOeZWlJBsKuGktK7fKpymwSZAmhWWxVwz9SN3hGnFvNjxU/NG36/nLZuTKWcGgaGtqVFnmDGB1ttK/93Mgx10/qgrb2lYdoc1b3NUSZgV6PM9EuisinJZ9cSouTkgAna5HzW1KMoWiLjA92Db8zXh9Y+Gy+kQFNBBDso9IqcdwbfhP3+ZPmVPEe+OXeurGpBr2O9fyb2inT56dQ0kMosesQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2375.eurprd04.prod.outlook.com (2603:10a6:4:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Sun, 27 Sep
 2020 01:02:16 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 01:02:15 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 2/8] arm64: smmu: Allow arm_smmu_init_context_bank to
 return an error
Thread-Topic: [PATCH 2/8] arm64: smmu: Allow arm_smmu_init_context_bank to
 return an error
Thread-Index: AQHWkxjgjolEBbt/fkiVligzzAB2Sal7rWZw
Date: Sun, 27 Sep 2020 01:02:15 +0000
Message-ID: <DB6PR0402MB276075970479238C9A00C91488340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
 <f258244cc57e69dbba1ff4a94d4f35541cdf8baa.1601023807.git.jan.kiszka@siemens.com>
In-Reply-To: <f258244cc57e69dbba1ff4a94d4f35541cdf8baa.1601023807.git.jan.kiszka@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d0ea4f32-6833-4ad2-3279-08d86280f9c7
x-ms-traffictypediagnostic: DB6PR0401MB2375:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2375C1B1249FBCC2DEB95B6188340@DB6PR0401MB2375.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hALSHmRxy/12wU3CBI8V55Tc3Pqo/krcz2FwROs6MmlDE18Ub7mQ8kQdOYjGr+MBdNgjuNqIRF9bihejwjcvPasHA3SMOOJroPNaBx+5JaDmjdJ+nuLGo2zxNg6ucDoTq4ty1UMQM9vej9s460kEsLR4W5hWUBhMm14hPV2Sil1Qdoc8vcITqZm4JuIvzZl5T3C4wHac0IddsIfb2txXXNPSkCOfhCU0zEwll7pKNEI/FyIoSpsL4Y8iAyT25sLwjKBtrPQ9o02Gkf0bgQKadqdDAdSE6gOOtSbF3WHsqOUzsOzMKsV+KUbzyNc3DpmUo9GGnBfF3OfOtwrtVn8SbyV5Zvxdg1DCbGJt+vVftUhIB+3nb5QO6dmzkagVrh+u
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(52536014)(33656002)(8676002)(9686003)(26005)(2906002)(83380400001)(76116006)(66946007)(66476007)(66556008)(44832011)(478600001)(66446008)(86362001)(55016002)(64756008)(71200400001)(186003)(7696005)(8936002)(6506007)(110136005)(4326008)(316002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ENQjxy7sk00KzZCxBS0DXaYTxEJlaqvzVTewbvlTqEmmaVRuAQomMDRdMtue1r20GCdx6aWfmp0U7WcAN2qbvTo26RZAOiqo0xhB2w9P83us3dDI59cCdN813uclXZA1Dzm6kkiCwbprxYN0c/JKi6MXRxmBki0Yh7zAsaCxGf5xNwu350al0NrC2yenRMF8tbfVymHc16Mr0hGwBoIIu318VrJ8zLvrvsy7NNXMHvEwOo7g8FeUS3bVAorvGT58f1eazRK9SS1UtSPCMgSADxICq4noraxSQPwyxbDEIQObwjXWNrZPkaU52LOcwxnp7jfNbbCEcfjHPaEYJCjY1MaK+LdMCBbpYlGegFPBSVKw4GtbaBFDp1mD/nk2U7uTdpBS2Bd8BsaNgDjr9xowUbCgPRFcugTZeSb20IGLBvQNp9I0fYYklHYuulXuFX1k6V5ii3R2aPR9dUe+UkC0fIYNchJfxxJBBx8Af2X09+dWQc/g35LpwAvkmfaoUMqQtT5rtN6p0lXaLqiJuTzXJy2hh0Kb2lF9cdyMZCeuDxIFjShsy5L5h8XhBDSfNVSseSiKpF6Q9hv0Oyx/M86a13qTk5ACkbCiIfnpjmgVISo92IstyvDkKiSA5POfTXnJNwcwOccjTSfLqjnFpsynag==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ea4f32-6833-4ad2-3279-08d86280f9c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 01:02:15.8572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +DxLsAt31MCS1gY69fcYl+CNGWSUFk/YqvyVEzSveDeNWWl90HIuKAiQ3nFuTBXdbePvd6mHc45E8jRX27hgeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2375
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="Cwx5mu/d";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.13.87 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: [PATCH 2/8] arm64: smmu: Allow arm_smmu_init_context_bank to
> return an error
> 
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> If arm_smmu_init_context_bank detects an invalid/unsupported pa_size,
> allow it to return an error and handle that properly.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/arch/arm64/smmu.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index 8975e8b7..3b2d6e15 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -349,9 +349,9 @@ static int arm_smmu_tlb_sync_global(struct
> arm_smmu_device *smmu)
>  	return ret;
>  }
> 
> -static void arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
> -				       struct arm_smmu_cfg *cfg,
> -				       struct cell *cell)
> +static int arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
> +				      struct arm_smmu_cfg *cfg,
> +				      struct cell *cell)
>  {
>  	struct arm_smmu_cb *cb = &smmu->cbs[cfg->cbndx];
>  	struct paging_structures *pg_structs;
> @@ -400,10 +400,7 @@ static void arm_smmu_init_context_bank(struct
> arm_smmu_device *smmu,
>  		reg |= (ARM_LPAE_TCR_PS_52_BIT << ARM_LPAE_TCR_PS_SHIFT);
>  		break;
>  	default:
> -		printk("Not supported\n");
> -		break;
> -		/* TODO */
> -		//goto out_free_data;
> +		return trace_error(-EIO);
>  	}
> 
>  	reg |= (64ULL - smmu->ipa_size) << ARM_LPAE_TCR_T0SZ_SHIFT; @@
> -417,6 +414,8 @@ static void arm_smmu_init_context_bank(struct
> arm_smmu_device *smmu,
>  	vttbr |= (u64)cell->config->id << VTTBR_VMID_SHIFT;
>  	vttbr |= (u64)(cell_table & TTBR_MASK);
>  	cb->ttbr[0] = vttbr;
> +
> +	return 0;
>  }
> 
>  static void arm_smmu_write_context_bank(struct arm_smmu_device
> *smmu, int idx) @@ -877,7 +876,10 @@ static int arm_smmu_cell_init(struct
> cell *cell)
>  		cfg->irptndx = cfg->cbndx;
>  		cfg->vmid = cfg->cbndx + 1;
> 
> -		arm_smmu_init_context_bank(&smmu_device[i], cfg, cell);
> +		ret = arm_smmu_init_context_bank(&smmu_device[i], cfg, cell);
> +		if (ret)
> +			return ret;
> +
>  		arm_smmu_write_context_bank(&smmu_device[i], cfg->cbndx);
> 
>  		smr = smmu_device[i].smrs;

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> --
> 2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276075970479238C9A00C91488340%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
