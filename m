Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBA7SYT5QKGQEZP56HYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103b.google.com (mail-pj1-x103b.google.com [IPv6:2607:f8b0:4864:20::103b])
	by mail.lfdr.de (Postfix) with ESMTPS id A72AA27A527
	for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Sep 2020 03:14:45 +0200 (CEST)
Received: by mail-pj1-x103b.google.com with SMTP id d21sf2091104pjw.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 18:14:45 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601255684; cv=pass;
        d=google.com; s=arc-20160816;
        b=R0Xqp/LwMyhW+0ICz8apKczOw7/K1c9uW1miOQqIrUWU5ZBrO6koFwHHqP7gi2JYk6
         k7K5vpzBtcNlbUtm3XzcqNDEPJNfpvmXiT3/LFnj2hYycbQfN4AMPkvUviwGp+tHRC8F
         cDr02uIyaDGXaKkdl65mCHkLm4q5WP55fmY8e3ocWvbphbl4eHTx8gGJrcOjdPm7b6KI
         uwoIZgQDiZqzA8GeLs/dBZHnGEOshyd/9UIUKH5Xegk/Ymtccv6ubsorBsqTQx257DqY
         3nQ8cuoB1knBg3UT5M+kTOm0fzlUO+H/Bk/z/eUUQDHeDiXwZWz6iraJDTakNWAZ2+mY
         XTuw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=Qk8S7NADIEYlVVMUHy6U3mTHgee3q8B01XO2IqiQlqw=;
        b=IEojPcT0rr1fo8H7m9USg+PuY2NO7sAlOE8YZOekSRYFC4134/5x1coBnq1m30BgbT
         qt6/Ie2MVyaDsj/eeoPAKGOF7TTPbO45TMC2FaKlh2Ku4fRBeL2JPCRSLL6LwXHDdLTo
         MPtEb56i5E583f9Cg3jPhHrfQPQ5Ao3lXsbFobsQyL0tQDp02suJNvop+E4MgXhAr6J2
         W6fVUkrhGrIL7NkZ4FHUza70r/Z9F246MZCjidBbt5QaAwld51tSH6E20xdEAbRmSllF
         nINYuU1bVBFbgfcBn/ivHY5zq+E0FclLzZLGzB3t2dUNDesNWkJ90advpAMo4zwXIlKD
         FfgQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=UUCM9zwP;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.73 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Qk8S7NADIEYlVVMUHy6U3mTHgee3q8B01XO2IqiQlqw=;
        b=n0vmGsVb5QYA9in1/df5L3waAU/vsmgm5GkxdrHOMC0FtCgAozEMaVPCz+gEhyl5DN
         tqvjr4at+Juew0ySP6IJohtNMQ/8fRLT5yEJlylUCi4e1J2KSbtZkql31omnnhTHI1ua
         7KC10ND2+Ryj5YVwr1D35cFUfFe+0jMlnm+GvKF/+/dlqRTdunmdh442Zbm4rg2RuAP2
         xsUHQp49pXU3HJFnpvwg3LnkqRGyu4GDTNgYv12d9jpgbXOqR8/M1TAAbBIqVfnV6yoS
         TUbdS4umnQtrw0kN1LComH3QixOaMivostoO1NU1mVSbEERXPttw77AeUjXq+clQWLFj
         J6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Qk8S7NADIEYlVVMUHy6U3mTHgee3q8B01XO2IqiQlqw=;
        b=OPx+w/IWIo0E5erclA0x7shbSXVnl/8QdbdlG236XfqsB4Iddzsh+/UsXddruuHEXg
         DUM2HQtYNoBRsxAHmExa6k419SqJvvUm1YLnqZV3YxZO4wvYkmcxFsQIkhISaLR0kdzA
         +McNIqS+FGOtHPNkuo44YOVa/N+YgLhUKr47LCxq4vFyrrB6zdqFL8071DjZ6zsx440Z
         YLCxm7tw6b/liIhitU1/9igKz2WgZxXdCCvf8jJO76wkNnFcd22WvYip0ONrFYTkQL6g
         YboW0R57K3cSvCSihkm4xFzcXJMbIms0Z2BNKzTsPvQv4VNCI+HoVf74Yab8RZW3/BTm
         YCiQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ihNZLIHykseR96acP/wwY5Hnx8m6H7sHErMQY7XkoIntQCGh1
	BOAmHd3iFlYHWrRY/FzIpik=
X-Google-Smtp-Source: ABdhPJwdAP1T6TzjVexDmuvjxD78v18xJ2V2LCkV+q7UxBZQdjzaPoNoq9k78iJZ82USahFMhZSrjg==
X-Received: by 2002:a63:e252:: with SMTP id y18mr7262054pgj.153.1601255684050;
        Sun, 27 Sep 2020 18:14:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:fe0d:: with SMTP id g13ls2303795plj.8.gmail; Sun, 27
 Sep 2020 18:14:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4018:: with SMTP id ie24mr7424152pjb.9.1601255683154;
        Sun, 27 Sep 2020 18:14:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601255683; cv=pass;
        d=google.com; s=arc-20160816;
        b=OpS5sbPhUZp6SdtGwEOekN89kQ6k5T5JLCSCB0gh9+K+fI6YwJxFFu+p9Y/lELTa8H
         KHwQQXTxI/dB6c24D3qf2RvzG7VPvVsx+fkzA/l9xlv7AL1BFQrLdOlhEUJGVJ/IMei1
         EGhHm4pSqYlsdXINXdweoPbGQ6rCM/c/U3W2w7CspXA9To/FNzL2mInnqX8TWDO5HpUj
         MQ/UDygeItNwDb+SFiDPhJq+Xv7LEfIUCpXtHt2Z05J7QLCIErBjK5hnqcoai9G9Hs6n
         4dDynQ7rBx/lJNtoHIHWF64hUaWjk2bkxkfpL10LEibUjAU/oZfFJTn6CFSln+AEk7bU
         paKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=LZoOWAsBFoU+U4ghO4APCFEpFW7ZKLY8shWlOMW2ehs=;
        b=potxnAze3xwXVSzSR1nr3GOQfiS9LlBxSl2ozpvDVb3/s8sMV2s4uuhnK6gZ3BZaFz
         Lpp4+mHeRs/zcB8E0hnWMafyCGA4rZZvUPVo5hgpn4E5JKwe4tkYAMAebGRN6hmO+tNF
         IzawkW0l+EAu/m7UoONQMFH9p9c6O3fGNj2W2YjrC3g8qpik45FfsVRjH+CyBiUR+uLs
         eIj1EPucwjKdWUswqP2hm29/534qT4co9N2ApMvLsKb5OJhQqfT+RsE4F+XHc1eD2aeW
         LJ4HPIMloEF9T1desgO2+Eggthnx2Mz6oXKN0fdwsb4WxYFot88MSsvUhCAX43LLLHLN
         ouTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=UUCM9zwP;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.73 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20073.outbound.protection.outlook.com. [40.107.2.73])
        by gmr-mx.google.com with ESMTPS id iq17si230086pjb.3.2020.09.27.18.14.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Sep 2020 18:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.73 as permitted sender) client-ip=40.107.2.73;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BK4HuLaVb48HUZWx7F+0i2jw8nwsgLh2GLcaDC70HazXa6Ga1WTtgM+TvGNfNPuI8Rt5QqFEW+r53SWA6s4or5AOdUd9wzroY1JBd+xDLa67ZgwRzkusWEWiHzGwIrXAqBRX4GFfaZcLmjNgeUj3ArEcp8wjH6uHiAP3FQ5bUD7Q2d7UrKh1eWgqQUuXhe09QH3M2IrE4nkTgikeyWLxxv8ukOFgzxc9Hr11PaYd6yKfuYK+AOsx257tRPAhrdvooSGRh7zCu4ZllalfHkDgCnRBI4Bi7fh9bNuc3mKk3e5+3F1PDVSnbutJKOaI0rrD9sqelMNI8oR2hbap7+yyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZoOWAsBFoU+U4ghO4APCFEpFW7ZKLY8shWlOMW2ehs=;
 b=dWwy1Gmn2ZOX5jHrW9W7lgsDqLuisN++TP3O9XNRUj3Jrnbe+HLvhHU00lzrKelIrP7dL3QPdrGYcyY9jY+HRgsZ33od1F7RJDCXGy3UcOBCigyBH0OfpOjUVxF4E49gzAakUFthOTWfnB5hevw7Nzb2U/7PoMGsvtMBHBfqMKtf6XNk9sKG5eT2qoKnoqHK/to+sM3z2Enm34+xQQibGsWS2dUaXI5uT/xeMv7BzzK1MZWGU34wXtWT8MZoFSVt0DmIuLZMXtl/ZdMlvN1/Nlug3l16Uk/ehrdSzhZsoz86fBzIPxdoOXNNL/pY4/zkomtzNz58RBukp+TwHeG0iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB5032.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Mon, 28 Sep
 2020 01:14:40 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::60de:f778:6d17:3cdd]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::60de:f778:6d17:3cdd%10]) with mapi id 15.20.3412.029; Mon, 28 Sep
 2020 01:14:40 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@web.de>, Alice Guo <alice.guo@nxp.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH V5 5/5] configs: imx8qm: add configuration files
Thread-Topic: [PATCH V5 5/5] configs: imx8qm: add configuration files
Thread-Index: AQHWkKwNK0JWEvsu4kGyPQM5pp+tJal49wyAgAACHmCAAAgQgIAACeoAgAKpIPCAAKGaAIAA8YoA
Date: Mon, 28 Sep 2020 01:14:39 +0000
Message-ID: <AM5PR0402MB2756949C49DAC709F669D7F388350@AM5PR0402MB2756.eurprd04.prod.outlook.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
 <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
 <DB6PR0402MB2760ADEA2D5A37133E5A1D9388360@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <27f73d85-f64c-fa29-0524-1fa360c6385a@siemens.com>
 <88609d72-f571-ad84-78ed-28fcec0198e0@siemens.com>
 <DB6PR0402MB2760EF8A41AFC17F8571BB5B88340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <143f5a37-9cdc-d2ef-581e-7f7144b6a709@web.de>
In-Reply-To: <143f5a37-9cdc-d2ef-581e-7f7144b6a709@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 479ae6b8-550b-4c8c-cc6b-08d8634bdfc0
x-ms-traffictypediagnostic: AM6PR04MB5032:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB50327DF6548B6A0DCBEDA6B388350@AM6PR04MB5032.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OJ4c2KPi+Mrtd5owiAEFHB77EgKKZvOOtoHGrRxSjTi766sRI2S51dQRzdtcqJZLqwTpGegU5FfJRaWlxQfrpAiNG+FnS00u0LhOepaDjs0YnfHOU/BuWLjyomFbeFQwHAc0MULWAbgSMhlIhQS6Co595eXzQoPuwGiHj7F4Lzswv7TwwCHbqpLmFietHpJ6q7wFTX1yhroXHcgNPi87wI7oUSUQbhRZ6w4mLST1X/bO+CyhHukBt25gJNcJ0BzZN6KeUEBPWlnpb35nZ+f3jRwQ4ZmPkqWRn6NlpvKyDpTki1i01ph/Fyo0MRSVD/NRvWW0pY99DNEbiFK1jX/BjPQVC26PPZq2uLx2ORS8V4UTLDygRrCXxXGnJz7wI4s3wHV0Brt2JZDkBq9mAaF+zwuGa9aZ1h+/iElUd0CLvbCMrzvCOodHOYIzCt5PR7dTzh4owX0DS5B+BvRairtEdaRkoWHOihCmCKEBt+IKLvnx2bHawIIAAVAuVgs+/eN8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(66446008)(64756008)(66556008)(45080400002)(478600001)(52536014)(66476007)(316002)(5660300002)(44832011)(110136005)(186003)(53546011)(6506007)(76116006)(66946007)(8676002)(71200400001)(8936002)(7696005)(2906002)(33656002)(966005)(26005)(86362001)(83080400001)(83380400001)(55016002)(9686003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: vPjNSGNHmcZOTt3sT/TlRFhaqWH5vyj5FPfmlZEUY1cLcsOpK+v3fv7GVZsvXGA0SIaQGzm4UlStLbY1E0g85YIItDPGiKuJ0H6n/jiLjV8/PtvlBGd4Ep3cRH6idpxCdjDaxJIp7zMvq+w3PlMwhZTdnik6V7O5fPK8Z9LdF0pxoDwQ5xpYXJUDbcJFqY+SsvoJ5cwnAoBqVrnEp/9u+O7MF+RL0LT70cALTuwfc8+p+qjjqHa9ecs43Vymkar0CHz/KQcY1R0/gtXUh9Dp7/WY72u2wP3GKpzAWn84vYZMKa+MuDUtIGP0jDQaaAD2Dojbtf3FkGJkpuZx2TIZapbI0iH9k/PBsDuklcep0XrT0YlFJWV/flRkB/5Yo1wzNDsmEsDVtWokZFYSh6Sqd0ol9kkkGb+8IJxhBgIMmhRNcA081H57yPO70TNpa+WWV+a4Qkl7L1w2UgO6WVaW/IOIQ1AzGs3NBRkFZkJxMTk3z+WTrW9eglxA+BEzyVHzk9gxSlA+3pRXES798yl/vxZeutvK0BSiGJeaIky/vUlVyWkQVK2QwP496QbcUw/koIjSQ0I6x3ui1k1SCSLvZ8hFBm5tmQVb+908VZ8V6aepI60QC0cCoFciusBT3IrcNBBx3IIG6ZkoZFIEeSeXPw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479ae6b8-550b-4c8c-cc6b-08d8634bdfc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 01:14:39.8587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UerNkfuk3iFJZbIlXFBlT8AgY7XZEVwCsdtnR96MVf/oiLFDddCWBO0kqzzm6YUbXp6WXfe3cLajnveHy0i5Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5032
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=UUCM9zwP;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.2.73 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
>=20
> On 27.09.20 03:13, Peng Fan wrote:
> >> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
> >>
> >> On 25.09.20 09:55, Jan Kiszka wrote:
> >>> On 25.09.20 09:30, Peng Fan wrote:
> >>>>> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration
> >>>>> files
> >>>>>
> >>>>> On 22.09.20 08:45, Alice Guo wrote:
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .platform_info =3D {
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /*
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * .pci_mmconfig_base is fixed; if you change it,
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * update the value in mach.h
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * (PCI_CFG_BASE) and regenerate the inmate
> >> library
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 */
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .pci_mmconfig_base =3D 0xfd700000,
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .pci_mmconfig_end_bus =3D 0x0,
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .pci_is_virtual =3D 1,
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .pci_domain =3D 0,
> >>>>>> +
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .iommu_units =3D {
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D
> >> JAILHOUSE_IOMMU_ARM_MMU500,
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .base =3D 0x51400000,
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x40000,
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .arm_mmu500.sid_mask =
=3D 0x7f80,
> >>>>>
> >>>>> How is the sid_mask of a platform retrieved? Can this be derived
> >>>>> from information in a normal device tree?
> >>>>
> >>>> This could be get from device tree, to i.MX8QM, iommus =3D <&smmu
> >>>> 0x12
> >>>> 0x7f80>;
> >>>> 0x12 is sid, 0x7f80 is sid mask.
> >>>>
> >>>> Sid mask is use to get the extract the exact sid from SOC internal
> >>>> BUS, You could think as below:
> >>>> Bus signal & 0x7f80 =3D 0x12
> >>>>
> >>>
> >>> Understood - but there seems to be nothing like this on zynqmp, so I
> >>> tried both 0 and ~0, so far without any sids assigned to the cell. I
> >>> would have expected that something breaks then, MMC e.g. There is no
> >>> error reporting in the SMMU code so, thus I will simply see stuck
> >>> DMA requests?
> >>>
> >>> I guess I need to study that SoC to understand what can be expected
> >>> there, i.e. which devices are under SMMU regime. Unfortunately, I do
> >>> not have the MX8QM running here yet to check your setup.
> >>>
> >>
> >> I do understand now how the 14-bit IDs on the zynqmp look like and
> >> that they cover all units, including the SD interfaces that I'm
> >> currently using for mmc and wifi. But leaving those stream IDs out
> generates no apparent error.
> >>
> >> The SMMU seems to initialize fine (I've already cleaned up the output)=
:
> >>
> >> [...]
> >> Initializing unit: ARM SMMU
> >> ARM MMU500 at 0xfd800000 with:
> >>   stream matching with 48 SMR groups
> >>   16 context banks (0 stage 2 only)
> >>   supported page sizes: 0x61311000
> >>   stage-2: 40-bit IPA -> 48-bit PA
> >> Initializing unit: PVU IOMMU
> >> Initializing unit: PCI
> >> Adding virtual PCI device 00:00.0 to cell "Ultra96"
> >> Adding virtual PCI device 00:01.0 to cell "Ultra96"
> >> Page pool usage after late setup: mem 63/991, remap 37/131072
> >> Activating hypervisor
> >>
> >> But that's it. DMA is still happily flowing. What could that mean?
> >> What do you get on the imx8qm when dropping the sids from the root cel=
l?
> >
> > I am not sure how zynqmp use SMMU and how their bus signal looks like.
>=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.
> xilinx.com%2Fsupport%2Fdocumentation%2Fuser_guides%2Fug1085-zynq-ult
> rascale-trm.pdf&amp;data=3D02%7C01%7Cpeng.fan%40nxp.com%7C7d10728c
> 715d4d712a0908d862d2bebb%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C
> 0%7C1%7C637368004563253765&amp;sdata=3DkD0%2BEz%2Bavbv6YUM0hvx
> kcSoDGqZarTmIngdHLVbehcg%3D&amp;reserved=3D0,
> Figure 1-1: There are 6 Translation Buffer Units (TBUs), managed by the
> Translation Control Unit. Those TBUs seems to intercept all interesting D=
MA
> transfers, including the SDIOs I was testing.
>=20
> >
> > To i.MX8QM, if the IP DMA has SID, but without SMMU context
> > programmed, the smmu will bypass the translation per the configuration
> > is bypass in smmu driver, so if dropping the sids from the root cell, i=
t will
> work well, no error.
> > Same to inmate cell.
>=20
> If I take your configs/arm64/imx8qm.c, remove SID 0x13 e.g., will DMA
> requests from that source be blocked with the current setup?

No.

 And if I remove
> all SIDs, will nothing work? That would be my expectation. If that is not=
 the
> case, we have an issue. How to isolate a device from a cell or the comple=
te
> system then?

Ok, then we need to think of change s2cr_init_val to default FAULT or trans=
late.

>=20
> >
> > You could try to not bypass SMMU transition in smmu driver, then the
> > system might not work well.
>=20
> Where is this bypass controlled? In the SMMU settings? Or is that
> platform-specific?

S2CR_TYPE_BYPASS, smmu settings currently.

Thanks,
Peng.

>=20
> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM5PR0402MB2756949C49DAC709F669D7F388350%40AM5PR0402MB2756.eu=
rprd04.prod.outlook.com.
