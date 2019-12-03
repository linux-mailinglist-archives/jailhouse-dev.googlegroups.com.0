Return-Path: <jailhouse-dev+bncBDQJNJ52ZYBBBKXUS7XQKGQEUEO3C4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93f.google.com (mail-ua1-x93f.google.com [IPv6:2607:f8b0:4864:20::93f])
	by mail.lfdr.de (Postfix) with ESMTPS id F127F10F793
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Dec 2019 07:01:15 +0100 (CET)
Received: by mail-ua1-x93f.google.com with SMTP id b19sf623761uak.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Dec 2019 22:01:15 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575352875; cv=pass;
        d=google.com; s=arc-20160816;
        b=Bd2f9oABna5llyrwgQaS7YW2RQKE+FUtHgF8dStaSLAGtmaNSlAF/m3HQhZVEIpB2T
         SjBjJuX9UD5VVsF6NZRluGnfq0rU/f0NryZrWrpHm7a9gOf/JoxRNv6PjoWZhJt1DiAG
         zwG/4cYQlyjeVWgPaZPjTn+4C5UON5pNMXInfDxO9TxHdzKg6OTyTTcRevqZdfW6j99w
         tbKY6ejzqujITpa344Ws1TjWW6H0Fp8ZfC7oR2wNqnB9cPbApl+UktDYXBBfjVBTUAH7
         Hxpoam1huQVHl/1UL86JD5uJQgX53Ji0w2FDFKyGmvQlB46mNQMkwW9oCA4Xwm8UU/rD
         /VGg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=6OTiroGXd1KqgikBfB7Sevva9EhEXmv4Q3HaZxDdjd4=;
        b=LwaJ6m2yze2YnEC1bq450Yk+8JuapVWkyOTVQcbvsn/oeWhlrUWmKl9m98kSkZc+2+
         m2tfj/O5yLlAvIkTiJzBus2GtFZWYXb/tKUEHGbpq1OTX3B72HPBOFuw0K1c1858Gp75
         OCUSNQQzTDjG/64Nef+SILddH7l2aWpSNGsLv0Z1YN85N+27LSfwcN74haGO8iPbQ8VO
         52ekQcGQnfR8y+21W9U/2wrszKwpuIjSFOB6uQEN5PBgiU3UqpuIJOXBkIb8l3x7Lxkq
         uylLucSQJza4UPlygKr1PlwOrFyLGyvQQAIASTs6SIswKhCCL8dpl5ftrtvK520LeRKo
         9s/A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=suse.com dkim=pass dkdomain=suse.com dmarc=pass fromdomain=suse.com);
       spf=pass (google.com: domain of lyan@suse.com designates 15.124.64.66 as permitted sender) smtp.mailfrom=LYan@suse.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:content-id
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6OTiroGXd1KqgikBfB7Sevva9EhEXmv4Q3HaZxDdjd4=;
        b=sGoQF6lP1cXykKKTK9DrMdMsgiS29ST6f9NCMFB+8sxe6MXENXfeRRo3yzuc+GbSXR
         2c6eMJKXsUtBHAi7TJqppX442XLWZoowbLsrFRy/Uft7NF3WWozVdE0oe0Bi/v0+6XFj
         dFmr82weqzolY7jd0EtDeeLll3f1ZF3Yxm2sXyoRuY9NfRbfnSeOuoJ9yGhozUNQ0d4Z
         +6eBjk6/lp1Y2FDFV5xuGVmy78C56A0diW0aRuableH2lobq1CgG/VuGPzhuCegiehy+
         GgZGx6DZJ/8qpwevFPPaNfLUMFysI+h1PPlod/vg+HpuOA7RZ2eu1WpmZCFv0avtwbPy
         /xYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-id:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6OTiroGXd1KqgikBfB7Sevva9EhEXmv4Q3HaZxDdjd4=;
        b=g3Kn9V+zs3iYrgkOls4O2Udhw8deCkjPrHZrLz5KkNjBBXPKiRlVCA7kZ1jW7c3Zrm
         U+sEUhijy7Gs3nal5G+LDEhR1LRtR5R20k4ez8UnAyyMRibXVyx7QX/yWdfeKi/NKXyh
         NqoW2I7pbNEht7ns2rY/2oULN9+FU7Vs9i5zxe30oq2F4BviGl+bauDD8hFuqhk4cU14
         YRA3DKNpMlQ0KMt0pYv3MCEZV2Kak5FgsO0/OV1igtjcl/sIUu6Om2HNggAabafKabPw
         YkH+LgMrsy8uqcC0+ViWpBheXJIUcDF5ZA3tCVp9OM05z/D0ioOFeTn/g4U8nymUsefu
         2jfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUdn6h2TU6nOaflxkWTMi8f0r55Gp5Fr3w0g4TSvNen8A3aHj5p
	xZrtwdsKuDZMr9bpPx01ITY=
X-Google-Smtp-Source: APXvYqwkg1Pu6FAuDrCGWHH+ZIakkO6zC2pafUva5Y5NeV48u5Qeswjh3ngUsUbj5svuspJJFxiyDw==
X-Received: by 2002:ac5:c99c:: with SMTP id e28mr2493282vkm.52.1575352874733;
        Mon, 02 Dec 2019 22:01:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:641e:: with SMTP id y30ls91372vkb.2.gmail; Mon, 02 Dec
 2019 22:01:14 -0800 (PST)
X-Received: by 2002:a1f:8f0c:: with SMTP id r12mr2314837vkd.78.1575352873977;
        Mon, 02 Dec 2019 22:01:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575352873; cv=pass;
        d=google.com; s=arc-20160816;
        b=f1IJeiqe829v9ju1cy13j+tGGBz6zbKOySCEJ92BoKxNSN9f3i7s+zkCEV06mY1A/e
         ZHFim7Ochz1JcWz2dVjThG5BRF3XbSvIDSmlKAVBgrjl8x4ZzVhGPeR0jS+j5IHErsW1
         S7e3uCfFHjw/+bgUlpUHqXBNutiljy7mXwmBQGs/AbGuhuppudbSQGTuNFEVkf4Ol6nr
         PiemfpNuLF64JqLJWB+kglvrjlqWw2hdRnd8mtAtekm0RXXWFmRTI/bk16VtAl9ImwI+
         8V674t+LTh7gvxq9sTscMLjlu07B2OlozjsWmovUEstq0NtiZxc+zYqTrYJLXEVeppvW
         4TMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=Arqab+gVBKhBdxkhEO4kw02dHFYib2tGDl8mT41XgkE=;
        b=iignuUU4F/ZGpbw2oh1KakaUrgNYP7MLcmkRfiwhRf3YvFHg/MFDL/heXIIrFtkYs4
         uWeyB8I+uOFWeq4IE7FJpbMHFebJZj7fUMrUpgZAeQVLqQhffjvoZLv+UScrkGAJhxAT
         xjKhCbBO4BESLJNiB/6+0143Mt/btb7Ad5TU0TDFUoStCZLbJAytj8/dZE1Q8ocsHapd
         bOpFKNt0zGCyaZBZ4JyxhNB4/RMcP1V0JJtA+WpSozttvX56JJwiWGaPfaiZNJZ26duR
         MagQ8zdMcVKHOesXEVPR4NpDak+q0ry6leE6dnpCsgNiXnafhkBM3kuKK6ughmkb15Ti
         o+OQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=suse.com dkim=pass dkdomain=suse.com dmarc=pass fromdomain=suse.com);
       spf=pass (google.com: domain of lyan@suse.com designates 15.124.64.66 as permitted sender) smtp.mailfrom=LYan@suse.com
Received: from m9a0001g.houston.softwaregrp.com (m9a0001g.houston.softwaregrp.com. [15.124.64.66])
        by gmr-mx.google.com with ESMTPS id o19si103159vka.4.2019.12.02.21.54.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Dec 2019 22:01:13 -0800 (PST)
Received-SPF: pass (google.com: domain of lyan@suse.com designates 15.124.64.66 as permitted sender) client-ip=15.124.64.66;
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY m9a0001g.houston.softwaregrp.com WITH ESMTP;
 Tue,  3 Dec 2019 05:53:54 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 3 Dec 2019 05:53:34 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 3 Dec 2019 05:53:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7oAZF7x9hv/UjAhQQHWC+wYvS+FwT/eF0S3TLb8O7itI1dTduGS8H//kN71hkeBxsO2Nvtr+Ouf40gNHOoAvUd63YAS462nwAlSt3witG4AJraNnWpW1CFMUnyoegYGNjE//6qDw4xmHTHKianuS+bGM+/eWd6NztijQjRD7unqsZ95BsCyTABPz747j0EN0Lok9P6MNP8Lgm9rQHDDeLcabhPKzJv9ZI7ci9uHoMwPoqDo5Dqr3BzD1QdG8Ryqx9x06vRgTzOyeEQVs8GICkUZb4ghJt04Yg07VNldkcqfv+Iag9R54kJTSCZLTOcp//RyP9691eq7e9fXwwolHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Arqab+gVBKhBdxkhEO4kw02dHFYib2tGDl8mT41XgkE=;
 b=RlRpg9g8hCcq+NJKur4OA2qvIvqFq1XvBfVxUKmShXEn8z/0+DDtLpliJaXDo6LuvvTb3JIeJ2BBzNRqvvu9YE+anvwpMphmdu7Spd00QjRCES2U2Q3TtABGCb/M62OUtNSUpMKnxYQvm6gpPHSdL5Cgtp1ony4yY+Br1CSWj2aGbBH547hT4d7kgbn13adZs9tW2JBz4YzEG90Cbl1yNvkcjipYn19vQmDDit4QZ/SvSAR0dEeG2nP9LvH5R7KPcVtEmZkCF3GAfrIDDJ36vPH5Kb7wkmRCNmDGTFE9m3Q9xchiJXUZW4CbGdTFYP1g9PXQJoJo2RENBOFaq/wVeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2888.namprd18.prod.outlook.com (20.179.58.203) by
 BYAPR18MB2502.namprd18.prod.outlook.com (20.179.94.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.21; Tue, 3 Dec 2019 05:53:33 +0000
Received: from BYAPR18MB2888.namprd18.prod.outlook.com
 ([fe80::cdfc:2174:93af:9e5]) by BYAPR18MB2888.namprd18.prod.outlook.com
 ([fe80::cdfc:2174:93af:9e5%5]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 05:53:32 +0000
From: Liang Yan <LYan@suse.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>
CC: Markus Armbruster <armbru@redhat.com>, Claudio Fontana
	<claudio.fontana@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Michael
 S . Tsirkin" <mst@redhat.com>, Hannes Reinecke <hare@suse.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
Subject: Re: [RFC][PATCH 0/3] IVSHMEM version 2 device for QEMU
Thread-Topic: [RFC][PATCH 0/3] IVSHMEM version 2 device for QEMU
Thread-Index: AQHVmI/KIQtCt3MU0EuTRnTT0BFR+aee6awAgABy4wCAByKEgIABi8aA
Date: Tue, 3 Dec 2019 05:53:32 +0000
Message-ID: <877b0cd9-d1c5-00c9-c4b6-567c67740962@suse.com>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <efd5fa87-90de-fccc-97a5-a4fc71a050c8@suse.com>
 <fb213f9e-8bd8-6c33-7a6e-47dda982903d@siemens.com>
 <0c6969db-848f-f05b-2dc0-589cb422aa56@siemens.com>
In-Reply-To: <0c6969db-848f-f05b-2dc0-589cb422aa56@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR19CA0001.namprd19.prod.outlook.com
 (2603:10b6:208:178::14) To BYAPR18MB2888.namprd18.prod.outlook.com
 (2603:10b6:a03:10d::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2605:a000:160e:228::f65]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7301b48-5b81-4a08-52aa-08d777b520f9
x-ms-traffictypediagnostic: BYAPR18MB2502:
x-microsoft-antispam-prvs: <BYAPR18MB2502C04C49C5FA84A22F2EE2BF420@BYAPR18MB2502.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(199004)(189003)(71200400001)(6246003)(110136005)(54906003)(66946007)(66476007)(186003)(66556008)(11346002)(71190400001)(102836004)(6486002)(86362001)(53546011)(6506007)(386003)(5660300002)(52116002)(31696002)(6306002)(256004)(966005)(25786009)(36756003)(498600001)(66446008)(64756008)(76176011)(2906002)(446003)(80792005)(46003)(4326008)(6436002)(14444005)(8676002)(31686004)(81156014)(81166006)(2616005)(7736002)(229853002)(6512007)(8936002)(14454004)(6116002)(99286004)(305945005);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR18MB2502;H:BYAPR18MB2888.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zcE6S3P0tDbK00yMDSTIW1BgWR08CRi7Yj8ZDWlgK+TcmhhcPl8zpcntwHGyBsMrD4xAxtokAfzmplM5wyiyxolYkWrlE+INaw+9T5bbbExEfrvr8MM3FIrJPh5DUQe1eEbpKQqXbZLNYxOUd88fKVZ7Cc47Q3598vOWywfrt57KSSPdpTCClzNsHOKk0ii1tlwC5tUEbXl2sRlS0Z4MTDGDBnC7hDNg4AnqAnBYLpfJHVuoZx33oQrr3sySaqhHPyOeaCynyquayXRYiMr5Whtn1xFA1AebGe1U3vSGYYhEpw1jxyr0HevwdX0wGM5wfXBwR/2lQKJTj08YWOO1zt71xnMfqYFoVkZxqDx59WxwhZed1SpDfXbvFUluHDLN3/jQ+uUGG7vH/RwSnrfiGuL63xicokkHdCSCzYGxsgTSDgEyYk7IUiiNO4s+b8bBchYShzjLj/DzFlL/yWcIMPwC+meNhcKoa/HTDZDy59o=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-ID: <18157A80E867034F852A5448242D24EB@namprd18.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a7301b48-5b81-4a08-52aa-08d777b520f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 05:53:32.6578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /bP1pNtlhpXuT6kVDh+BUSTiK7kiNytd1qoNWi8nnYlQosY2QiLEgIVPiN9+nkNs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2502
X-OriginatorOrg: suse.com
X-Original-Sender: lyan@suse.com
X-Original-Authentication-Results: gmr-mx.google.com;       arc=pass (i=1
 spf=pass spfdomain=suse.com dkim=pass dkdomain=suse.com dmarc=pass
 fromdomain=suse.com);       spf=pass (google.com: domain of lyan@suse.com
 designates 15.124.64.66 as permitted sender) smtp.mailfrom=LYan@suse.com
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


On 12/2/19 1:16 AM, Jan Kiszka wrote:
> On 27.11.19 18:19, Jan Kiszka wrote:
>> Hi Liang,
>>
>> On 27.11.19 16:28, Liang Yan wrote:
>>>
>>>
>>> On 11/11/19 7:57 AM, Jan Kiszka wrote:
>>>> To get the ball rolling after my presentation of the topic at KVM Foru=
m
>>>> [1] and many fruitful discussions around it, this is a first concrete
>>>> code series. As discussed, I'm starting with the IVSHMEM implementatio=
n
>>>> of a QEMU device and server. It's RFC because, besides specification
>>>> and
>>>> implementation details, there will still be some decisions needed abou=
t
>>>> how to integrate the new version best into the existing code bases.
>>>>
>>>> If you want to play with this, the basic setup of the shared memory
>>>> device is described in patch 1 and 3. UIO driver and also the
>>>> virtio-ivshmem prototype can be found at
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0
>>>> http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queue=
s/ivshmem2
>>>>
>>>>
>>>> Accessing the device via UIO is trivial enough. If you want to use it
>>>> for virtio, this is additionally to the description in patch 3
>>>> needed on
>>>> the virtio console backend side:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 modprobe uio_ivshmem
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 echo "1af4 1110 1af4 1100 ffc003 ffffff" >
>>>> /sys/bus/pci/drivers/uio_ivshmem/new_id
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 linux/tools/virtio/virtio-ivshmem-console /de=
v/uio0
>>>>
>>>> And for virtio block:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 echo "1af4 1110 1af4 1100 ffc002 ffffff" >
>>>> /sys/bus/pci/drivers/uio_ivshmem/new_id
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 linux/tools/virtio/virtio-ivshmem-console /de=
v/uio0
>>>> /path/to/disk.img
>>>>
>>>> After that, you can start the QEMU frontend instance with the
>>>> virtio-ivshmem driver installed which can use the new /dev/hvc* or
>>>> /dev/vda* as usual.
>>>>
>>>> Any feedback welcome!
>>>
>>> Hi, Jan,
>>>
>>> I have been playing your code for last few weeks, mostly study and test=
,
>>> of course. Really nice work. I have a few questions here:
>>>
>>> First, qemu part looks good, I tried test between couple VMs, and devic=
e
>>> could pop up correctly for all of them, but I had some problems when
>>> trying load driver. For example, if set up two VMs, vm1 and vm2, start
>>> ivshmem server as you suggested. vm1 could load uio_ivshmem and
>>> virtio_ivshmem correctly, vm2 could load uio_ivshmem but could not show
>>> up "/dev/uio0", virtio_ivshmem could not be loaded at all, these still
>>> exist even I switch the load sequence of vm1 and vm2, and sometimes
>>> reset "virtio_ivshmem" could crash both vm1 and vm2. Not quite sure thi=
s
>>> is bug or "Ivshmem Mode" issue, but I went through ivshmem-server code,
>>> did not related information.
>>
>> If we are only talking about one ivshmem link and vm1 is the master,
>> there is not role for virtio_ivshmem on it as backend. That is purely
>> a frontend driver. Vice versa for vm2: If you want to use its ivshmem
>> instance as virtio frontend, uio_ivshmem plays no role.
>>
Hi, Jan,

Sorry for the late response. Just came back from Thanksgiving holiday.

I have a few questions here.
First, how to decide master/slave node? I used two VMs here, they did
not show same behavior even if I change the boot sequence.

Second, in order to run virtio-ivshmem-console demo, VM1 connect to VM2
Console. So, need to install virtio frontend driver in VM2, then install
uio frontend driver in VM1 to get "/dev/uio0", then run demo, right?
Could you share your procedure?

Also, I could not get "/dev/uio0" all the time.


>> The "crash" is would be interesting to understand: Do you see kernel
>> panics of the guests? Or are they stuck? Or are the QEMU instances
>> stuck? Do you know that you can debug the guest kernels via gdb (and
>> gdb-scripts of the kernel)?
>>

They are stuck, no kernel panics, It's like during console connection, I
try to load/remove/reset module from the other side, then two VMs are
stuck. One VM could still run if I killed the other VM. Like I said
above, it may be just wrong operation from my side. I am working on
ivshmem-block now, it is easier to understand for dual connection case.


>>>
>>> I started some code work recently, such as fix code style issues and
>>> some work based on above testing, however I know you are also working o=
n
>>> RFC V2, beside the protocol between server-client and client-client is
>>> not finalized yet either, things may change, so much appreciate if you
>>> could squeeze me into your develop schedule and share with me some
>>> plans, :-)=C2=A0 Maybe I could send some pull request in your github re=
po?
>>
>> I'm currently working on a refresh of the Jailhouse queue and the
>> kernel patches to incorporate just two smaller changes:
>>
>> =C2=A0=C2=A0- use Siemens device ID
>> =C2=A0=C2=A0- drop "features" register from ivshmem device
>>
>> I have not yet touched the QEMU code for that so far, thus no conflict
>> yet. I would wait for your patches then.
>>
>> If it helps us to work on this together, I can push things to github
>> as well. Will drop you a note when done. We should just present the
>> outcome frequently as new series to the list.

Yeah, this would be easier this way, I will just send pr in your github
and let you handle mailing list in the future.

>=20
> I've updated my queues, mostly small changes, mostly to the kernel bits.
> Besides the already announced places, you can also find them as PR
> targets on
>=20
> https://github.com/siemens/qemu/commits/wip/ivshmem2
> https://github.com/siemens/linux/commits/queues/ivshmem2
>=20
Yeah, I saw them, including the linux.git side, just did a rebase today,
will send my stuff ASAP.


> To give the whole thing broader coverage, I will now also move forward
> and integrate the current state into Jailhouse - at the risk of having
> to rework the interface there once again. But there are a number of
> users already requiring the extended features (or even using them), plus
> this gives a nice test coverage of key components and properties.
>=20

Yeah, that would be nice to have a summary, looking forward to it.


Best,
Liang

> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/877b0cd9-d1c5-00c9-c4b6-567c67740962%40suse.com.
