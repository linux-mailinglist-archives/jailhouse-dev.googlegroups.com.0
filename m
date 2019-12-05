Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB6UGUPXQKGQEUML5GPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BC5113D3E
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 09:44:43 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id f1sf642599ljp.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Dec 2019 00:44:43 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575535482; cv=pass;
        d=google.com; s=arc-20160816;
        b=T2L1ySl4nldz6SMXmCgADpopgT9u3dMMx6/0LLW9rEDSU0u+K5lgRHxOy8nwRa2XOV
         SqVmB34WKzr03ioxNPgGEsrgbjyl1127u+tAp05Vjg86C7+VEGGRwmpiasOmoRfd+oxa
         ioS0VSaBFs6wP7KIrqXTyKslLAkmTF3GbPa3PBmpz17haTM1e0sUwGCEdy4SIofyZETR
         5Wle6r59HzGkLumiXRXO+9q0RDf73e8iZC4Womn4Qnvr3Z0TFiAZcf//eniq06OVIWtW
         zw9vNqMIExZT7IZ/LiY2lJAUAjYuYH6uo4yImU5V8R9vBtF2p0WDBsTsj5yYAHQYKK3r
         kgAA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=KQZRpoWlFq8O2uBeWm7V4DvNCK1EKtkj9rqkQLkO7A8=;
        b=Tr6JfrJ3mXcenlFgT3cwoVZpPT4tcQaiRWICnRqFrtkEr/6zfa37c/02bg7cMr8OTB
         RDCwjUESMnwlX0qZSMLX4odK36K3TmZi5CMHu+DUeSkT7m4sM+k3dlE0ufIbkOeFvsQg
         rHc06KeXYeV3N6O63TjtNp536xX6iMbGj5rrf9i2ydF1W/0jmf3l58JMc1GWhIZq2UMl
         vB/1qH+BA2S9eDwnKwsY428cntRN1AHF0P4KyyIvqED87HnopHlduMtPtONZegzbnpk/
         iGD3I2W7bh3B4p9VbqJPpmZ7Q6djQc3C7O/7pdHpataZGyipgUmRlqPPO3EH8T5rayM7
         7fYQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="gIeqR/Sb";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KQZRpoWlFq8O2uBeWm7V4DvNCK1EKtkj9rqkQLkO7A8=;
        b=XtY7+9IpmvPeC4H6nRHdWTS89MgP/34MxObJox16xeEpvJTScOEoTBUx4bTjh/BOrR
         CAm97gpPVGJsh2m8RKB8uyYNH2xbywWSe0Io0rV2v7EjFPstV0yBg99MN9eFq5tVUjUX
         beHvy1cGUwwW9gZa6d6pItFIw5hAv9u07rULhd6J8B6hMwCFQYc7iL749I6Kp75ZZ4Ua
         eSxtwCg4aXDbJy9oUzaokqi0Sej6hAbwyP4SWXKzX37WPZZ08qQvLp2AMENbEot5iBqx
         YA5vTuPCj1BUqJvgCyfv70xD1V7thV7vGYkM9ztsiGmeMm5p4Llnf8PpwXExe4ULaBDa
         klLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KQZRpoWlFq8O2uBeWm7V4DvNCK1EKtkj9rqkQLkO7A8=;
        b=X6uQwE7NK8nolrs91lRQm1YFdemBuwASGyA7khQ2znFlyGeFk54TfY1WklQ7RdLg/I
         nSjdQc4X5QKXDrSXmIRJxIDpZ3jF/VCYwvpGLeHg+SmZrm7n6vX6ot8hzRdePOb2feID
         qbFgtZZCMgxRJoat3+DwUWM5vymBmRYi1iAQr1qvQx01dgLDJp6JnBQMWH1N8FtP7GKG
         ZgnJWwL7jgl2SpgSLTvLuAwAUal8yXWJQ//Cw0FP7Z8bslkhadGJbx/qB8Lpir7YUlRE
         PKrSm4GasHfMKcOOfBQJbVphJAhzVab2JKDa0eODsnMCkYzChSJOU6MDEtVHlSNfufNk
         8l4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVTZyGYkNVSoOsHZHANQ9poA/icii4wVsnV4CfJg/HloiyDsQze
	ts4EbxhavFv53m25mxAYH9g=
X-Google-Smtp-Source: APXvYqzIN+bkLyUx2Aa/BeyufLKW1UsFhStKylGf2c76fkZacxkBgSQmQnyr6MQFyiaj87AK+QVkUg==
X-Received: by 2002:a2e:6e03:: with SMTP id j3mr4820698ljc.32.1575535482732;
        Thu, 05 Dec 2019 00:44:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:46f3:: with SMTP id q19ls212113lfo.10.gmail; Thu, 05 Dec
 2019 00:44:42 -0800 (PST)
X-Received: by 2002:a19:c210:: with SMTP id l16mr4854368lfc.35.1575535482137;
        Thu, 05 Dec 2019 00:44:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575535482; cv=pass;
        d=google.com; s=arc-20160816;
        b=LdZiPh/jgXub3Y/FoUS5j0cqzxzE09lj9TRKRfoF7HqKeMKH1uXOPtn3YiLAfBnrLq
         +MFB6YzuDWr2oW03QaLOkuUpv3V0oYheQsOGTsig8X5hl72siPb2p9+jEwvZL+XUUUsi
         DpwGyxydffS5iGoAG2sH3onMR7MPIvLx2GbRzBkddWJC3b5UeI7K7eFjYC8QJ7Ws1f4b
         934KrTqWWYiMcuk27z3oiRYl8PilH5U3FBKt0w5k0fHjrMnUaDNvmXgh+IUSwblQKk0e
         OcBqucGUyaEm+q+qioMoHaiaLbTj5uAEh6NYgr+1d8XYA3RIIbTaZEvWVPdLNKMT65eq
         JEAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=Yxb6uJd9FZqErc1cZ9fb4pw1ehC6stbwR7f0HXHhxQw=;
        b=yfxr1sW0VqJF7sgLcvzToWMdml1sKgNGmMSUPsBSywaFhP/IFrXds5yap5UJA279FP
         zgq8LEP9GbOic9Kp7y6uNLVa5raY3e9hDkER62tNt2WEJTtXL+z6IzXacfi5T/XDAEdt
         kR1iWYuhMZWi8cTjXsq7YIqlMf9eqCHlVQhXSo6hkg8DOSxTHXu9I/3dc8ViPCTDwdzp
         ZuoKH4IUNfXBS3zfmo6mdOAEtbgMwr260sus5r/VZW7CuZZygtWyHze7v/kcQXGYsvbq
         BUTtzX8/f6YoMPDD8Q39CqgkweU5WiZLwvJdNfpjqj1DXWU3RAeRc1w+a2FRxWTq8MUk
         3F/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="gIeqR/Sb";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00081.outbound.protection.outlook.com. [40.107.0.81])
        by gmr-mx.google.com with ESMTPS id j30si618199lfp.5.2019.12.05.00.44.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 00:44:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.81 as permitted sender) client-ip=40.107.0.81;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWFD87AIOQbLhz4Ujr4WFAi5rlo+ynFfeZufrOFdeu9yKCJ2I/egYDsUUms9m5VzxcvbFYejUPMNfvZdZPf4T53BHaqd2FOVaJ6Jwp86XlLSi+b2Jv/NpTfMQecvie73eMhknPoE6tHn1wwHkgmE6u86HWVR1hGFSuEZpwNE2jQ6DDcAgHR+zRMYwjz8/aGvk2xgn/p8ck+hxYTmedbS5ZgjI6nB1UILJOd8mPQ5Sla7y9p5Jr4j1pG8R+wBOHpoMGftH+78mu5LuUwNjXyUkoKSqxFcGKfoYcZZUR5Tp3VQBlNuXclyOkjflrOhJ50CoVlKzyR3DbCdvV2o0mVmZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yxb6uJd9FZqErc1cZ9fb4pw1ehC6stbwR7f0HXHhxQw=;
 b=UMJpoPz0RCDox77O50UEWue4hgMy0T9eCp6wIk+TX8kbemG0mzx62zqT2gNUW8NGYILfFGpq7b1+jo5/UgcPfGaYVeiXCqhH/TD+1SCx6NgURCaNXzsm9t5jAgzrFWqbriUx4hVGbmqJ66x6GiuoojJJGbrvHCeP1uBPWQHTY6TQd3yUk1kDc6oonDYJIBztGT3e8nzdKQCjII9EARdvCOajbtKQxWr/QcBjX5FEmb70swqWgy0yZJn1GvAAN773biOoL07w+jfPYQyLds//CjKJ+YVrqNxfWurRq60HUhM+qMEAxscDjASV2Pxy03bolshQhKAzsA3mmgkW8FOIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4954.eurprd04.prod.outlook.com (20.176.235.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Thu, 5 Dec 2019 08:44:40 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0%6]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 08:44:40 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mani Sadhasivam <manivannanece23@gmail.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: RE: Zephyr as a Jailhouse inmate
Thread-Topic: Zephyr as a Jailhouse inmate
Thread-Index: AQHVqUBzY/GIA4/SRE6M0V7PIgZgcqerInUAgAACL4CAABiv0A==
Date: Thu, 5 Dec 2019 08:44:40 +0000
Message-ID: <DB7PR04MB4490F52695B91268CBB45E78885C0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <e4de0ebb-83e6-4010-8f17-7cbbdafec19f@googlegroups.com>
 <ae19eed5-afc4-ddf2-1855-4bd474790065@siemens.com>
 <CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ@mail.gmail.com>
In-Reply-To: <CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 526bb638-28b6-4b48-76a8-08d7795f5e62
x-ms-traffictypediagnostic: DB7PR04MB4954:
x-microsoft-antispam-prvs: <DB7PR04MB495439E581F6C78FAB75B22B885C0@DB7PR04MB4954.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(199004)(189003)(64756008)(53546011)(186003)(66446008)(66556008)(66476007)(6506007)(102836004)(26005)(9686003)(11346002)(4326008)(25786009)(55016002)(110136005)(74316002)(71200400001)(71190400001)(33656002)(5660300002)(52536014)(229853002)(6306002)(6246003)(316002)(7736002)(99286004)(7696005)(86362001)(2906002)(66946007)(76116006)(6436002)(8936002)(14454004)(6116002)(966005)(3846002)(305945005)(81166006)(76176011)(8676002)(45080400002)(81156014)(478600001)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4954;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: amyoshVqlTFypNqJ21oITYgCwa5ac6KEElzQQz5S0vGBXeGixsYHFnIfMc1356G/Wo9tVOCsCHAlGPRPJGlwylJouMZww/ywlVE5tmjcJVmqJo/x62dm+OIlFWEKDiMzkuZ3Glbp3a7eTsFQ5/HsfGgooZ6OrJY5FB9PLwf/ivTthbN36XKzVeG/9quumP7MIBo+3FHFgx6/IY5ivnJSte8ZVGSU7ww7WpO2+mW9YVhgrHzuBK3Ov62ecXUnJJF+LRWBRH2uzy2dROS1sV7ZIaaN69W0Ay3K06vUvTestnFcF8c9lMDTySTi5NsZqfp7NDGQ13PFhiPfoYGfiCoo3bk63ZJ3rjSRogvVq+WSaYzR+Q4fhh61R3L/sX2Ya9g7Xt0g01mThODnxQIa70eAafaLD/VDgn7O/V3NfhQqBhrIVnel1VQjznnXYS6qJkk1RonsOj7vxkt9cTlp4lNymi6fH+ztvPdf83RwpFk87TM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526bb638-28b6-4b48-76a8-08d7795f5e62
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 08:44:40.7960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bDbLxBKcZrh8QYv/ERWkH72pPxtp6cXR47PqaxK+tqmTTMmTtXs6MDHVW3W7Y5Ip99cccmQcEFWruAyrx8M5QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4954
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="gIeqR/Sb";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.0.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Sorry for top post.

Would you mind share what products would you use i.MX8M EVK for?

Also Could you please share the armv8 PR for zephyr?

Thanks,
Peng.

From: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com> On Be=
half Of Mani Sadhasivam
Sent: 2019=E5=B9=B412=E6=9C=885=E6=97=A5 15:14
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Zephyr as a Jailhouse inmate

Hi Jan,

On Thu, Dec 5, 2019 at 12:36 PM Jan Kiszka <mailto:jan.kiszka@siemens.com> =
wrote:
On 02.12.19 19:43, Manivannan Sadhasivam wrote:
> Hello,
>=20
> I can see that the Zephyr RTOS has been mentioned in the FAQ as
> one of the ported OS for non-root cells.
>=20
> Is there any reference code I can look into?

There is x86 support for Zephyr as Jailhouse "inmate". Check out
zephyr/boards/x86/x86_jailhouse/doc/board.rst. If you run into trouble,
report to the communities.

Ah, just noticed that it got removed some=C2=A0time ago:
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fzephyrproject-rtos%2Fzephyr%2Fcommit%2Ff3611fdd0c8ca54a9f19bc56a14b4a=
2fdadaffe3%23diff-bb9445fa64739ef6a5a6b59d520deb07&data=3D02%7C01%7Cpeng.fa=
n%40nxp.com%7C3e79e9ef68d24b68d9b808d77952bcf3%7C686ea1d3bc2b4c6fa92cd99c5c=
301635%7C0%7C0%7C637111268572956815&sdata=3D8SkuxLhNQarhgoTD8u1%2BvD6HJtByb=
%2BNhaTxiUbGIDIw%3D&reserved=3D0

But this could be helpful!
=C2=A0

We could probably also easily support ARM, but the last time this
question came up, there was still not A-core support in Zephyr which is
a precondition.

That's what I'm trying to do on IMX8M EVK in spare time. There is an ongoin=
g
PR for adding Cortex-A support in Zephyr, so I'm planning to utilize that.

Thanks,
Mani
=C2=A0

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux



--=20
=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=E0=
=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=E0=
=AF=8D
--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to mailto:jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://eur01.safelinks.protection=
.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.google.com%2Fd%2Fmsgid%2Fjailhouse=
-dev%2FCANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ%2540mail.gmail.c=
om%3Futm_medium%3Demail%26utm_source%3Dfooter&data=3D02%7C01%7Cpeng.fan%40n=
xp.com%7C3e79e9ef68d24b68d9b808d77952bcf3%7C686ea1d3bc2b4c6fa92cd99c5c30163=
5%7C0%7C0%7C637111268572966810&sdata=3DCoOfSEdyP2GQjOiwCvjWQ9UlrD0vqtKTYuae=
SYca96k%3D&reserved=3D0.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB7PR04MB4490F52695B91268CBB45E78885C0%40DB7PR04MB4490.eurprd=
04.prod.outlook.com.
