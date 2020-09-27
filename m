Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBO6LX75QKGQEVDJRLNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4D4279D43
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 03:07:08 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id r8sf2747634edy.17
        for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Sep 2020 18:07:08 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601168828; cv=pass;
        d=google.com; s=arc-20160816;
        b=rASvPCGZvD59iiKpNgMJfI38wR6i5EizuoNLWcmj3tSFrSOGDjl6FW2qBAarqL8L00
         G8Vjbil97jfLexPFN6tsu247Bscs+KUNAlX3QWK3qcJdhG+ElV5aU5GRkiTI5wvTbgF9
         OR88H7xKk/OHrpigzRddtafHrUYH69etv/UAwzg63dbZkevFZj597fZxhoEpEVJX5GlF
         UOpuo5Wx5ov4lSCHRYyJsxf/j0kFte8DjQfR2dEO+bFZpPNtAV8Pe8waCTmpHDpvHrWy
         Sc9Ejc9qfPYJN69Q5ixc+mgxlKju5bqT+gGpQDvJ4feISfnxtF/YpmGx3onwSIiBKLD0
         UpCw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=DXaHGQMsaSnEags9mUplyDd3Hhvl/rR8K3IhB4Ynyms=;
        b=i5apXIU0w67qhVUVx9P91DXFFJTDO+c/EhSadGjSUhbSjqmu3AbPFwlx0S759aOS7U
         67LHEZ5npgpUSSscBtba6M4N0f8FnoZ+K230KYbZccpJnzRK2HVdRhj4imL+/J6cGux9
         oGNxYV4v6pp5TSgSWQYLFWGkxyyUMbWod1ClE9rgfTBQ9jcIBMbSxcGNfoJ0VY4Ti18v
         jj0SDX1sNf2ts/1LVfmCcCoLTtZJyFS5TjsMjF3vGbzHk5emSgKYmwdX5+SyoUZauTDN
         ET4OxLaJTb7+dGqPx7hmYVSQQ22WHPz1sRiBJH4YMvicx6bu3ZqFElu+g+HYEvHIuK86
         LCqA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=L31jUwEJ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.72 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DXaHGQMsaSnEags9mUplyDd3Hhvl/rR8K3IhB4Ynyms=;
        b=IIz1vDLqhuDc/dNtLJZRZnsrbnrccSqUfm+qnk9lhGf/s2ZmDt+gyFtNb6o8tEPSK8
         66KRLCp8qsv0gwe1s70+W/c1JEkyd1rrlFAhQ/UBZ793NqWXRhvXm3qg+gUof9lzTaEk
         jyvcia4Of9YqfWNcX8TOwdbiXQ75ToLcjagNvnb+S+XxOoV9sveMNZ6kgMVCQrjlXEwZ
         Pr7v8GjsExKXmb2iYR86hHKjUCAnONAyT59V7bwZIhtjZzSA1dS9vGTp33TYWI2EjUSq
         4HnQ31p+T5pYMpmg060I/lVP/6xddrnnNfeD1Zk0X8FMEWQZZj53KVurVIr0syEhIUfk
         ZtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DXaHGQMsaSnEags9mUplyDd3Hhvl/rR8K3IhB4Ynyms=;
        b=esm16EEJfmE3ah7xcUbtBOBhb/yuPTBDBaTVg1G6R1CdbMefj57VBzI1PpTyz5KKmC
         P8uMo0q8uaoXgSsxccYSmzFY7/AKirYuXboyiFeopOGvUb7aKhLW/m2EUggFnnxCzKlr
         WnIi54IlPMJ8LU4ZHRpR0M0YCw2yN1/5NUbweZEjx1DX9+m2hEz7A3HoKuWX0izt6Y11
         ZcEiHdGrxSkWjrpldv8lFyBsplA3OxSegAXQ3e1CtqJvY3yzJ8MNY3Re+QmLtETsHrEK
         HAOPV1bOypDP3/s3ZrOcxAHFGTCzQTMd/feWJwpNaq+B4WxVi+Kv/JsX0SCXjR8n/e8Y
         mqVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+bIwUcFfpgFuIfiVrS/iJnjo26Btv7G+fkQjYuGgKRxeGYpfu
	RYNUAJE2VVuv7NOlTqam688=
X-Google-Smtp-Source: ABdhPJxo8RUc7zjNKfYHlferB0Z9JqFM0599TldtBe6lSR6De8DV2fZwgbvHc9rCddcnxU8zAjvrlA==
X-Received: by 2002:aa7:ca46:: with SMTP id j6mr8713281edt.155.1601168827932;
        Sat, 26 Sep 2020 18:07:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f1c6:: with SMTP id gx6ls2891283ejb.8.gmail; Sat, 26
 Sep 2020 18:07:07 -0700 (PDT)
X-Received: by 2002:a17:906:2c44:: with SMTP id f4mr9507671ejh.52.1601168826999;
        Sat, 26 Sep 2020 18:07:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601168826; cv=pass;
        d=google.com; s=arc-20160816;
        b=f1zwBBbsWjtfqWWocA8R55KIY8KVVR8tT8fihm/Ov9/3kqHnxLm2qGCpK/Tz7N+mrV
         seFFjZK7jUPIuX8br4ko3zlCjyQPmXWIB4dAXzlpt8aTuIorrFD9q3Vwi+VO/eaxHVWl
         0g0izNlJqJLiJnSXJQRoBxgYX4+cS0sgyRcHtkSoiY6Bb2urjqv9AlVJJUnZ3ZMZqyyz
         ntA/qNRKB1jJsho8mAIqPhf+Rra/tjIvqHpH0uODVXhp1eNS1Di9loLnYmRyWvHGRv8w
         8xveggUqJQ4cOQktPPrPHQj/Oodz/AtozbVHCwmVagOhP631vlDvyGgzE1q6RPbM6I9C
         UlbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=fwH+6SlsJCoaJs3PVM1a9vL/Kr6JMBuIqWdtdHUbjsg=;
        b=Yc9ro7DFcZJ9gKTEw12EKASC97juuglFDHXuuaHJ1MrTNC0dMuxpgpJtoc6eZucMCg
         DcErBviwOOLVZFIIbXMyi/eSayE4F+Zyyt2uSnZHJjjzrrc+Con7MQrNqTl/FiN51qUB
         wgTdT+IIlF9N1+MAb0vwyHG9+q0tvtjswDwZwSjPtqOoU1K/Tf3UZbjm/SUcUOpO+j9a
         idZ+tmYpSZYVADHqOsXxtdVui9TuoCMgqr6MZSzUcAUsWQ5JeKGinmr1BcE4OCbjf8tQ
         v9QsSgyjC33ntmlFXwS+gZhl9/97oyqzM7x6PFDzOD5IfL3CIkGXNXFciVDiY+OnSvQ7
         RLSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=L31jUwEJ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.72 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130072.outbound.protection.outlook.com. [40.107.13.72])
        by gmr-mx.google.com with ESMTPS id w16si146156edq.4.2020.09.26.18.07.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 Sep 2020 18:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.72 as permitted sender) client-ip=40.107.13.72;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2447PkCI+Z4+dz4Wr6wEyJSuFI6QFP1MdNFwxftP+Qdpov8QYxTrIdeFRr9KebzS2nX5N9nVT5d32btNGDAw1LBOu1DeInD7nga3JRrKGK6/b+WYuGDCjCmAJjC+8dL6k77BoZXY+C9bsEdTN7y2VpvtaJmSc6LZLChWU6Yz3pZGQKkFGgcQEThz+XYoL7BI8RDSBsHYaGHFDUrfC+vwE/9cQ9WONZOPnC+XO1LleV7lCnVfwy0162wGQO+x3dd8YKKVi6l9tKrWCunDthRRljuVr0v/eDwP+E5q+xo+XPbvpB+9einBLNBMRQdbmbRec83RWTSnURjIru5aiL2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwH+6SlsJCoaJs3PVM1a9vL/Kr6JMBuIqWdtdHUbjsg=;
 b=j5CelCF9zxx2O4mZ5KLzDxqjzMTmQUxfV0I8zjxexOLvIzMmaL5aCLSL/8mHzZt6GiNsu+L7KfFDuVm6O5hMeRkdlht65rEZI/t3D4b3qCUUBN70WZPoZd3lHPJ9Gtnem4DsrQ+g/KVKE3aoZZrUHuIykMRrLqGFIfTxIJ8eT7htnMTHz4jPqf73p93ifjOEryfLeibyfZJ2zORkUkT23LaEVjU9V+z4nXzciEImcl1SBorKkMjJljETyQi+3EtsyfRrOL7EtZHt5AGa5ZEwUppIOAKco/VmcymunDySByorMm2NYd+QD87w7FuefgJrMxTA8gzu73kI2XhM4oBqrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2375.eurprd04.prod.outlook.com (2603:10a6:4:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Sun, 27 Sep
 2020 01:07:05 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 01:07:05 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 7/8] arm64: smmu: Handle arm_smmu_find_sme error properly
Thread-Topic: [PATCH 7/8] arm64: smmu: Handle arm_smmu_find_sme error properly
Thread-Index: AQHWkxjhdtBAC7X4kEefuOSRoh0kZKl7rq7Q
Date: Sun, 27 Sep 2020 01:07:05 +0000
Message-ID: <DB6PR0402MB2760D6D1E0DE74D85F1C9BF688340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
 <a38f43616d17b754095f52767f25dab4fe8b192d.1601023807.git.jan.kiszka@siemens.com>
In-Reply-To: <a38f43616d17b754095f52767f25dab4fe8b192d.1601023807.git.jan.kiszka@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d3a46905-672d-4862-13ef-08d86281a691
x-ms-traffictypediagnostic: DB6PR0401MB2375:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2375694DB98EB05FD41BAE8088340@DB6PR0401MB2375.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vDeLPfcrlZvrEOBK1zS8T7DpF9+kjrXcuND1z7miRkV2ubP4B7dO8Yr02QVHcywAWhHHc/8g6gSQT3NVDi2hvp5aCbz6u+9LfUcn8tpE2+U0eUCE6LwD52PGfN8p1IZjRqCS/pdcWibdwxGiZpIUMsc3+fv4+SK8JdZ35xk2MvAggnsKsrbovlwxkLslgelDsvkhREalH9ZEF2KWMy4pHe9zio/qJ2dwhuubxg/RAQ2iD1s+dbSej8o1IxhCDy3QWwJEYLNt5O9jTnuEz75jAXV7MamKqUvouoFZ9/SyL8MkqqpNpdhTsjqoNlSKytnfUKPrw5RmUWnUsn1hsZ6IB+Oq9nD5n+jDpTU4eKnMFSSyADSnVZre8Q1T/6QcmdxL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(52536014)(33656002)(8676002)(9686003)(26005)(2906002)(83380400001)(76116006)(66946007)(66476007)(66556008)(44832011)(478600001)(66446008)(86362001)(55016002)(64756008)(71200400001)(186003)(7696005)(8936002)(6506007)(110136005)(4326008)(316002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Sx/su5DG4cB/ah1qFxswssOHvtYNPjWBo8srXGEQjIQn9yBdqlBe2zTdKxyKqkcorQadYC+4cBGsHIkllYXYAAtytpMVxepV4M4wphxNlv/zdM0ZK7HeCNGTcsWCvX4YBhWCMlaRKbtfH6MJ8FMmG8xOgOzXztI0evGfV0HZYZ8Snep+gli39VNujG4Tjht3r/gYw9L4+QA3JNoOkNptH2io9XqVF0VNLlaYa8fmwa1Phcr2am3VhPF4cc/92oKzVviXNaiG7xIyxEVHoEgUXj7oebpTUmyuHwNuhos89hpaI3tlyJxTXTGMQ2ij4CNbGG5KHUSlg/TZlbSy5EEW4uHkLHlggLysgD21+syMQqNIlyTYcVmyz4HsHsgYp1T2xJZ7Q3zwdrAQEWoENZ26vbc1tCk9pQj2X9BmXf4Mz7YRefzHFAYrIu4jVoUnQ2VEoGL8fzj5KxDdOQJ7yDkDS7veTfttux8O4HMYseWG5eAD0UMLMmZugRIJgDQq1/H2VUNhT4WdEKUp1zgr2okoO142VnNYwsjLcMtEoCnuDx5BILbidqOgguoHrgWdcdE05MggCkOSI6Eoo9CY8ZIlKY674Adrb9MqD/leYo0qI+QfBJhzzJgVVb6hLMJGazbkzThBQ+YV5xaOHZBehOJQRw==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a46905-672d-4862-13ef-08d86281a691
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 01:07:05.6354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4DaSEwG2QPEYsPyrh8l2+3VZX/h57MwfEpVh/NbN1W0rOUWfdCY/8Q9FrSPfbRzV9XbfhN1DhbOB0OcycfNeQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2375
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=L31jUwEJ;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.13.72 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: [PATCH 7/8] arm64: smmu: Handle arm_smmu_find_sme error
> properly
> 
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Bail out if they happen during cell init - apparently configuration errors. Skip
> the entry if that happens during cell exit (unlikely).
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/arch/arm64/smmu.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index b89291e7..4c4bb279 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -863,10 +863,8 @@ static int arm_smmu_cell_init(struct cell *cell)
>  		for_each_smmu_sid(sid, cell->config, n) {
>  			ret = arm_smmu_find_sme(*sid,
>  						smmu_device[i].arm_sid_mask, i);
> -			if (ret < 0) {
> -				printk("arm_smmu_find_sme error %d\n", ret);
> -				continue;
> -			}
> +			if (ret < 0)
> +				return trace_error(-ret);
>  			idx = ret;
> 
>  			s2cr[idx].type = type;
> @@ -898,7 +896,7 @@ static void arm_smmu_cell_exit(struct cell *cell)  {
>  	const __u32 *sid;
>  	unsigned int n;
> -	int ret, idx, i;
> +	int idx, i;
>  	int cbndx = cell->config->id;
>  	struct jailhouse_iommu *iommu;
> 
> @@ -919,11 +917,10 @@ static void arm_smmu_cell_exit(struct cell *cell)
>  		arm_smmu_tlb_sync_global(&smmu_device[i]);
> 
>  		for_each_smmu_sid(sid, cell->config, n) {
> -			ret = arm_smmu_find_sme(*sid,
> +			idx = arm_smmu_find_sme(*sid,
>  						smmu_device[i].arm_sid_mask, i);
> -			if (ret < 0)
> -				printk("arm_smmu_find_sme error %d\n", ret);
> -			idx = ret;
> +			if (idx < 0)
> +				continue;
> 
>  			if (arm_smmu_free_sme(&smmu_device[i], idx))
>  				arm_smmu_write_sme(&smmu_device[i], idx);

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> --
> 2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760D6D1E0DE74D85F1C9BF688340%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
