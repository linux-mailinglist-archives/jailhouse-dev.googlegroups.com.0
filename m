Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB4V65D6AKGQEH44MPGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id D584029E101
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 02:48:34 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id f4sf593393ljn.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 18:48:34 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1603936114; cv=pass;
        d=google.com; s=arc-20160816;
        b=efDr3CgobjWarropZ8W3u0Rz1PUtwTx+zvXpVD8x5YvAohpJm+Dc2MiYkz+5WTJvam
         VDu/JmP6bB4vNQ49zDPj7w+ddM/FVejTkgFMZCA6Fy5OUEq0T4jDmQkF/wn3Rrk8wPJY
         Vq41SvkmlsjwDSxnflhrQQfEZJ8A/Y+1mPzDxWMlOg21j9DqePbW/Q5/vLqgtGV3LuOT
         DhG28erEZPo2ZjCFd19IK/R+xWKKsVDfa6IScayxIx+o5kxfv33rv1DqQ0vBw//iNUCm
         dZKds0l8SXFsDk1z0uV+IybpWqfGPfnFxz3dGpDGi9f+/FWjCmhX0xPrQO8k7S8yElto
         SlxQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=0f+lpH0HvEmqMuhjudsgllmkgX11FbSrJrp5ZE3KcFQ=;
        b=PoFiC+scgYDcx7z+DucPkYtre7fL+mFLn0TAplW08geLWiJMzNL5D7lC8QdvApjPkq
         iPuUFEXpfx5Le00b8AuYj/gESA45+dw/Y4D2eqK/PlxFMOHKhRxL7s24/eYWN7TQPav+
         01TrOpsoCgd68KLoQinc4/4fXJ9AIKMZgFUh0TUlzmpMAx1MBiSr6xkIn4VA2FZgSqNV
         gBHQuf7laR7yUXSsjheQ15nLHUbCNLTBYwNDJEhgA563oaa3AFHuuM2HAFXSH+qYF0l3
         saQxTUxs93iiH2D9eRzyXK4CNbPOdiM9Z+75G78JPm4HgfHFGZ1W55ipgYDpMS9QQgvH
         5ieA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ZGkEaJDj;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.68 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0f+lpH0HvEmqMuhjudsgllmkgX11FbSrJrp5ZE3KcFQ=;
        b=ZNvBha8l9yBEtNBdsXwFLY66TuJXpRrPR6XBQ/EaYcSMB4M98WXdbecsWan9HtMvlr
         hGFCv0Dyzj7znz0vx62gT4R1wAArRtVcIfmZK8jMKMCVGzYGbZK0ftabJs8Z+AuHbPiv
         ZZeeWF+ki1klCMkXoISaz4w+HHpO3/9pn2Lyi4TclPsP31heSq74biQBGGWy0Qj2us2X
         ku0OMqBO8QUxyOzuiLsAhpAe4qkpG0Kt5IzPMxkUlb+MWjBwQt7am4M+rLGqsNIPiYab
         ZmVL6q+/wcxtOGWJzfgT/atPuQLE/hfP8vvyQQnEip97YrSd2ZWJZ/gnmVvYLhhiYqfC
         SQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0f+lpH0HvEmqMuhjudsgllmkgX11FbSrJrp5ZE3KcFQ=;
        b=c2m8yxWvnNfC4mz5VdM/B+d4Ukm03koQuKayMhMox98PiNIH17jNfXURt/Q4L9npEr
         Kcu4K1NqHSASg5FJUDxYy40SUq6SxDJBC6X+gYPwp84WX4S6Di94iwF4ofITV/rD5Lga
         ejFLBCttLFpTrr4GC7H2A6I6l2oL9l2xGekUJkn+bS3y+KBne8hSJlJYevv7MtZGDn2E
         DDR5lcRyXxH86wjy9Tc03S5NiSB0/38cwga3GKTvkcf8OmTKH8CxKGZN6Zbq79B8GS9S
         rY0eGCYf8mPpNGY5rne2onCzFnB7FbsQmOfPsartLBL+RlnZA7Zwt9OCPsRW+ixfc+K6
         S+fQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530FF02Di8H/fLK+yfxK/txAEKhESC4dd4uzUMldBmTAsO6P19bW
	EtRcDhe1gojM5GPnDR92d8c=
X-Google-Smtp-Source: ABdhPJz0l9n+LzjAKt7Jcu5hdu1Xh6DJxPgh+1yx7h6QTLIRoggHkbrhBn7DhyIa1qVcsAbjXkFCAA==
X-Received: by 2002:ac2:5283:: with SMTP id q3mr710550lfm.462.1603936114394;
        Wed, 28 Oct 2020 18:48:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls571634lff.1.gmail; Wed, 28 Oct
 2020 18:48:33 -0700 (PDT)
X-Received: by 2002:a19:ae04:: with SMTP id f4mr712627lfc.436.1603936113202;
        Wed, 28 Oct 2020 18:48:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603936113; cv=pass;
        d=google.com; s=arc-20160816;
        b=rWoB/iGXHqSIBrK1ASJLoEhBub/+n13GUapRna68jwgY0ivOjw8r9ZsmH8g9zOE/rM
         X3j3TkL0sE6QPdvwHjQzWXchzLYxBfyS0Ho8MEzIwaYBsPaNqxF0kMAnAFb5qPCwaBIl
         7k1crDzOqS2t1g0nM+k/twsbKAMU1NvXzbhJH+uZGsLjLlBnkpobl72Pkw80BJeDU2dX
         ZUlMH9VnCj9XcEEbKZQacpJ24sQ4EWqIq3mqJ+v9nHS1mzvcEjkMBH56mydhDV+tyR2F
         ja/OnAHQAX42bQn2AKJfbGU796O2m7kyYPfcYx+wR0bxEtAVNhzkIKsFeef7qB500WaG
         vfig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=uE8FMwSjHRuHXuhXXpBNNj+OVaGJfVZOyIAlCWlhqos=;
        b=JoZ121klN4Y9ogTZ8ElBNej0iIoIImljvsHkleML1m3j+0cT4OI9eYww72xNPaFWQe
         uc0Ct/D5zsiYhOykjAQWSgdf3ww3cetibWbE2O2pJGO86BcuxuINL46D6PP+04sAEALw
         e8gDBb2XBvqfZ3W6JEspqlR30kijJGM7d9meIbjz+GNWl1+j/saSU885C5TBPyVdaAnl
         FcmwXNauy+AiwRZ7LxF05YUgo/Zii6eqodx62/vmYQlM+fp3QtsRMaKIJnFy3srl9QLc
         EYNOv855iAH6kpsmJ2wzEOMMpvFH51Xkpg3e7bDLGZQUaCXKsbNZctyxcDTXik3sKKuE
         TpAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ZGkEaJDj;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.68 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2068.outbound.protection.outlook.com. [40.107.22.68])
        by gmr-mx.google.com with ESMTPS id a16si27810lfr.5.2020.10.28.18.48.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 18:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.68 as permitted sender) client-ip=40.107.22.68;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3WLHifTuxz8PDEHTxR/Xt4rxlUuhgOk0aujkI4jghpBnMAOkOdSBWEDsesTnhfEqZmmRCirgSV2TnTENcnSvwQb3T8Egiag1ObZIXKkgbMMvDPH8/2QCM8A4ROY4VKg99hDcPjvdYjZIky6WXVbF3G26/h3NEgfEt7LQnbl3MP3LIVgCgzMBudm7nWu5bVXdqONdVIFU8s931Vsr4wTj6ezdRKn/9+qgfcHJZzzriYzokb4ADW12lCH5mX+4/qYCyN3jYODn8Pza4VvCxe4oWPFPtTjvPrrRhd1JvbZ06BGp88uh41QXtV3pdrxSQCusWzs9fYn7RLZxPeQ8Xz52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uE8FMwSjHRuHXuhXXpBNNj+OVaGJfVZOyIAlCWlhqos=;
 b=hjGjBpRLCa8MZvngnF45MEvO5qfsDNCkhXU0f7blEhZRmUrx2n24RZPrlaLTHxi/BiNr9khXOzVAiK7pKLu/2tjaUfIiI4eioAbYq61VEEsXShg1stryBD59RYjB9p5GtsiwQ2ytmgpx88V5CUrOVtO+SpzkWsxReQyoK5+wkHiypqBQnYAuj6vx2yMIsKdnsv7QjsmVtn7ai0odlerW9wg8L733pXtymj4TXDZuyngI8VQdQddaDkGUz71f93Yy4i3BaW4zB2LFBNVVQ351XV7TQGpFIWs4bhbkuGZQqTwK+hgfCnrA+tzU1sJ5VXfACgSzQZJ17xprjBLdeOoh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3658.eurprd04.prod.outlook.com (2603:10a6:8:2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 29 Oct
 2020 01:48:30 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef%8]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 01:48:30 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH] driver: Adjust type of __hyp_stub_vectors declaration
Thread-Topic: [PATCH] driver: Adjust type of __hyp_stub_vectors declaration
Thread-Index: AQHWrVUCuVm8aBYQrkOkZ3tDN6rwp6mt0HMQ
Date: Thu, 29 Oct 2020 01:48:30 +0000
Message-ID: <DB6PR0402MB27600E71C7FDDEF16DC24C9688140@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <93f4aa0b-d2bf-040d-25c9-d3698975c600@siemens.com>
In-Reply-To: <93f4aa0b-d2bf-040d-25c9-d3698975c600@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b91ed7c4-9813-403f-534c-08d87bacbce1
x-ms-traffictypediagnostic: DB3PR0402MB3658:
x-microsoft-antispam-prvs: <DB3PR0402MB36586948E3F96AEA4DFB21D788140@DB3PR0402MB3658.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n175wY0QVeBpSFlXfI6P5VfJiVJe9lITJTCGGqHFPQ2WSm9ANzfqTiYIOmEjKtOcwoBlWOpEH/ZjsDV70ndazulx6sBf/k+Y9XehZ6cH+MVNjh+rXf6ddjj45YimV4d3Vel/YZ4j/PcX7lB69HSVDQT33kyYIUYFJlIt3poQHqywbUii/vzyyB7pUs1GFf4OcjVwFotAb3wLvVGy2SvExBT86JVYkCMvmavYOKZbfE9l5KkuluIKS6XBQ+UOhdgBF7MphSFc7aWho4mfMzgTI6BPQckGrCONSUSufszpV2X3Qt1Z23HXoPmLfgC7FDSfyBMhAYAQG3YKnbzQy2hwIQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(83380400001)(2906002)(186003)(7696005)(26005)(6506007)(9686003)(86362001)(55016002)(478600001)(5660300002)(4744005)(64756008)(76116006)(33656002)(66946007)(66556008)(66476007)(66446008)(71200400001)(44832011)(8936002)(316002)(8676002)(52536014)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: TaI5ckewPMKwQm4qP1TfF/CsK4OYad0RkaVVCWMUu4SCaC6pQO7rsJMuPNZd8IqEUJ9LcVot6gyLt1gymA/R3AkjvIHk7s52nQGIpgepxXA4H+v0l6o2ZnMnWeFpQNDs7eGvqwpQASD+Kh8SLsvFskS0T4azxSjX1fkwqJrg2tNZd8PAP2ob1+Fbay1wmvsxSv94GQUImPSEpssMBtB1ma98liu9m6mrkRy36SPJwNbWlXoXi/idlQvyC1WXUWS8NQxR3rlFYjnEX5Jgh5p5L91I9b7dI8aenhGZxFpFVL8LFPpls04YTcQsWdwsh5yxBdwhaz7Z5bIRdeT+ksDq1mvbDUvuL3DvfBhyfij8LWgFV75euPSWPvlbKg28pISXSBcySx9D+Y0TwUSw/+jf/VWbRrNi9ldTBj8ZJHd5sz15YGX0ENUC5vVgCSokqpICaI+2TJF3vMLJ9CxhAHd7YC1I5xkR/ZsYk2C21c0JzEXwoVi65HVxEYYlfnbCZfiwhrsiB/vJooj28Qf8dHMzoJb47o+xQWE+CPHGGPX8/epXZ+XWHgTfWx4ozmlM9Uooh141ApTUu3nuCe+KT6OePgMHbxWCdpWXN5FmDFAsNUs9VpZs7MKIcPc9O7Shv/PhwqfxNgFPe2Oj7sOwh1Zb6Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91ed7c4-9813-403f-534c-08d87bacbce1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 01:48:30.5430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wrUMBkYqFRiUO5u1G0ClZ23q9X+aExK+CspRVha63oGTP8dD+x+vbrXs22vAxflhrv7XvbE6xW1rq8Ngkob+nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3658
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=ZGkEaJDj;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.68 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: [PATCH] driver: Adjust type of __hyp_stub_vectors declaration
> 
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Aligns us with an internal declaration in upstream
> linux/arch/arm64/kernel/hibernate.c and with an external one in the
> linux-imx downstream kernel.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> ---
>  driver/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/driver/main.c b/driver/main.c index edb1e4d4..78af8e97 100644
> --- a/driver/main.c
> +++ b/driver/main.c
> @@ -86,7 +86,7 @@ MODULE_FIRMWARE(JAILHOUSE_FW_NAME);
>  #endif
>  MODULE_VERSION(JAILHOUSE_VERSION);
> 
> -extern unsigned int __hyp_stub_vectors[];
> +extern char __hyp_stub_vectors[];
> 
>  struct console_state {
>  	unsigned int head;
> --
> 2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB27600E71C7FDDEF16DC24C9688140%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
