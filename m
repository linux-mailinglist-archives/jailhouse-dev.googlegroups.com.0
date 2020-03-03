Return-Path: <jailhouse-dev+bncBAABB2XW7DZAKGQEIRP3M5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E759177522
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Mar 2020 12:11:40 +0100 (CET)
Received: by mail-qt1-x839.google.com with SMTP id v20sf461516qtk.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Mar 2020 03:11:40 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1583233899; cv=pass;
        d=google.com; s=arc-20160816;
        b=QFRp6YJ7yFFP6AJDAxjJdiUNNJFxaNEYw/dtN3ZPBHZeAfDuna7yS8docULaJqDQr+
         LnaupeapC7/OHg1P6ElS1P5hfJM4drGh9bGhwG0V9PHBZDeaHTD5XxgmGZCZSgUj3WU8
         coPMH63VCvH/2jl3eT/i6Z5oCTDlI/5tfKfpUK1wXeiq9kz37YCqXXssTthDZ/5qdvJ3
         btfJU69WpOF6/+rdx57qXxIj3youvtl1lueDabU/RnFPoSVmbX/I8lKk/vJwBGr+yYbd
         n4Ux8bd/U5VL+GuR6QP1sZTh3gEycmIpjNvH4Wx+eRgMmw0mdwqHHylDK6V7lLysfRD4
         quQg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :from:sender:dkim-signature;
        bh=qkb3EGr5RqLnMMatVyio/FQL1gUH6IRI6hvkLTIB4M0=;
        b=OD+u3b5Smya7FbxifyMhTvs5SrJd9oMvazgX0zrcED71fxwDOoixf0cnAz3mFh6mCZ
         OrkEEe25C36o2kjS6l3zHGg2h96IELhlCMNSSKIpjZvbE7tJQG/TDVpSS+Q12jBqTfB0
         fv2M/eukqAXZDq2u9J3Zj5bfl551944SO8fnoMcpR41h5zQDxdbo3ZTuscrMxi2q0TM5
         9c5K9WMFeVKC1sawA+LKJbsJpP/+r+v7WaGJ2guKt1azjpxzxSxWQXQ2eaz3or1wZLD9
         CpnzaOaowYzWfIR26cMrNyrReLuqFNtHzflasESV0fKDSK+f1Frk9MoK34JurSaPALLT
         +Z4Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@msn.com header.s=selector1 header.b=eaiFxBzz;
       arc=pass (i=1);
       spf=pass (google.com: domain of stevehill606@msn.com designates 40.92.40.89 as permitted sender) smtp.mailfrom=stevehill606@msn.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=msn.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qkb3EGr5RqLnMMatVyio/FQL1gUH6IRI6hvkLTIB4M0=;
        b=pjauUfLXa/xGTRL6Ax3aq8pVfaS7h2koIq2bt4hj7feziZhjLUgBU79obrdFga7xj1
         q1heAWgc4A7sPegcxjZ3KUgdrAE/RtLWL2OKguXbtusdTih3G4TJx0GdlUqwy7kKl/r1
         rKdWchztbQi80jpZ+T+RKR2+hODi4vWLhROBdHPHYZWLY3swXEZGchHASXA4j2om57pw
         exU2YBA3Ex/GdnDFmKebHbZKmDMcvMszSHBJZyi9j5SQ+8OZM8oYbERO2XeZ+Xk7QorW
         7cImHJVo+htTIEfi6dO6k4N/hM3DsNjByJuNs+RPt6klfHbaw69IVdI/Dw40qIfzqAkr
         UNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qkb3EGr5RqLnMMatVyio/FQL1gUH6IRI6hvkLTIB4M0=;
        b=Ks4co52Exmm0YMkpli9Qt83cvUUYHc7DcAOkOouAytWHbkMq3DTW2l3Dr87aHnKtvE
         p5QPL0ThmiZnT7eBppCRNUIU6lgDeOok+5K7Q4YQo7IRXOA0IwOkfoNHTLVdL5wGTtaQ
         vEltJ/My/t717Z5ITSjpTHritxb7qR0+3qhjlTYMI3vp849vDw0PzWJlL4/fUwRqIVjK
         B4iItKSdXvV+Irjr01XZ6YuuTTfUXtgIWXomFREavLFLSWXxBKPFrtcTqml12726mfQa
         5Yy2I4HEdK0/bCY1d3LjIolxFlVVHEZIVCSsIi5hxozZbihSji4NCiwQqM5CGiZjQzPR
         uddg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2OGbsGS0Q4eGTRKUBPLxLaNSv9XKx0I1Onxsw0gdMsW+8w+n71
	zU2mJ3HMfyS7DShdG2DKcEQ=
X-Google-Smtp-Source: ADFU+vu+rBFq4i7o74EWDtVCNxUW5BrLEvRuaQKnAQvtG+y5f8lbQst4zL3roVU7KFEfddiBtt/5Kw==
X-Received: by 2002:ac8:5642:: with SMTP id 2mr3969556qtt.348.1583233899275;
        Tue, 03 Mar 2020 03:11:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:1450:: with SMTP id b16ls681923qvy.9.gmail; Tue, 03
 Mar 2020 03:11:38 -0800 (PST)
X-Received: by 2002:a0c:ed22:: with SMTP id u2mr3495910qvq.13.1583233898644;
        Tue, 03 Mar 2020 03:11:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583233898; cv=pass;
        d=google.com; s=arc-20160816;
        b=DmbiIbgzxj7VCLYUtbqjgJz+bLQ565MGR1riJthz2NyIfRmHqNhCmfJqC4v3sJZoDx
         U0q+kp6QQq3O6h7FtqiU9cq00YZKc36aNDYHniQ9SeSyQPP7Y4pwuLrUdLpRj2em7bDe
         oaiS6jH989oh+pqGCFfm3JDbGXfMjEfDMhjc2PJF63buZGwHjrwFSOVkDMD0YgqPzny9
         4aROCnMOYI6QOUXZ/h59piDUgsKNnM8d1je4pPlbaCzWgdOlwvEFdWMx1yPjoNnQkqEx
         fHlvatIy8emrlwJezXM3fDu9eSel/GEBBZV+qbOB5NII++0L5EJ+1Zw1yM1LhsxcMBHw
         QFjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:from:dkim-signature;
        bh=Hm0GHEivPCPdpK0sAivnn6xcGLCcZg9czfv+KlnGUZI=;
        b=gzgMN8Dkc+/6cg7rhIsC49rGmvtzcZDgGhrmu3S4TnjrIB+LSFe8aWyZMzW4pnYPXX
         TsEKg9UbCQ5tRM984qy6HkHpq8oJB2ZrM+ybcoshNht1+FIwP3ebYRyRKj/T70OfM1/z
         +gbXGMEQZXETyTWIz+TJ/kArRpe1LOvMSULJQBhjItK2puxDAtJqDLwSO+mZpS6dPPn4
         LnNEs0vJUWgtTZaF2Gpzy0rghRurJ9axLK+ifPB+2LNKBphMfVYJRvlbqBoOr1mnLBFY
         Q+9vXrbHCqWLu8XoLW5vK5Z16XwldhCuuywEjOrKbLTRt6tQ0N6N700juW3URmh6i26i
         rIrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@msn.com header.s=selector1 header.b=eaiFxBzz;
       arc=pass (i=1);
       spf=pass (google.com: domain of stevehill606@msn.com designates 40.92.40.89 as permitted sender) smtp.mailfrom=stevehill606@msn.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=msn.com
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2089.outbound.protection.outlook.com. [40.92.40.89])
        by gmr-mx.google.com with ESMTPS id o21si305193qtf.5.2020.03.03.03.11.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Mar 2020 03:11:38 -0800 (PST)
Received-SPF: pass (google.com: domain of stevehill606@msn.com designates 40.92.40.89 as permitted sender) client-ip=40.92.40.89;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGCXFVze1vg2fL36aEC4Bjh81KR1H5iMlfqv7sIyXWKzMCYoaRvAwEtiWHbCbd3cXXmPR8e2LVP0aqXPoWwgpmgDguavYrKt3y0E7LO3jwdcjV0bW1Wa8f0rFfFbFTEYIjtI9b/bDnohsOL3O9GalKMPttsGxU2XW/gwNA9uPEyVKZ0qtVdAQCi1PwlgbPPNHi56lRCkXSZrbdnGfcTHehH39vQernVcs7IAsFGeNJZldknGHPzOkSX7i/cFJ9hpKbpq/rgwZRju0KmigcsfKdZskwB7WaGRO4uoaQi/1PrzPJ3BG7TwDgj3pWB7o/R9y8SGf7lI+dmr+DCtgNxO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm0GHEivPCPdpK0sAivnn6xcGLCcZg9czfv+KlnGUZI=;
 b=P+SqBJ4SeOOEIwnzgFgcQlbK32MytLgMnPlUXaebIipITPNSMlPsdCUDHzYWgYclfIqIjUlv6R27nVBESukINURXJ7M0B98nGD748hRGJTLmTplmxn/AzR6cmX6LBP88Pwn86uVeFoaadP+lZwbEyrWYuZDggrIedlFbbr6kKPKEpUskMf5JHcmIjk9vyepzVx+XH1QcvIJFGIW2IRw5oqWKYv20H6G2EaEoTc7oX8sRP6x8OCvtsGBeg1CXV0hYKPV+W9R25jOep8g0u7YWdQWK7Y2wUkNkecX8fm5ae2TOQoVlh323bneb5xwo8QygZEZcLB0LepTCTLlzwbUHcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BN7NAM10FT015.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::36) by
 BN7NAM10HT176.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::254)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Tue, 3 Mar
 2020 11:11:34 +0000
Received: from SN6PR06MB4352.namprd06.prod.outlook.com (10.13.156.57) by
 BN7NAM10FT015.mail.protection.outlook.com (10.13.157.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14 via Frontend Transport; Tue, 3 Mar 2020 11:11:34 +0000
Received: from SN6PR06MB4352.namprd06.prod.outlook.com
 ([fe80::d43d:a102:3ee5:45a]) by SN6PR06MB4352.namprd06.prod.outlook.com
 ([fe80::d43d:a102:3ee5:45a%7]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 11:11:34 +0000
From: Carlos Scevola <stevehill606@msn.com>
Subject: Urgent Information
Thread-Topic: Urgent Information
Thread-Index: AQHV7XHXLUAej6Tk40Sgqj45sJMz/w==
Date: Tue, 3 Mar 2020 11:11:34 +0000
Message-ID: <SN6PR06MB4352FFCC9E395C4385F9F0A085EB0@SN6PR06MB4352.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:B0C219988BBB51BD8152F3358990BEFD4384E8DB78A2DC40A1660F01C40AE1FC;UpperCasedChecksum:813C1CB6EE0A25CA4896A30E8A04340BDB19AA2E9D35BE1C972850C3F5FB95FD;SizeAsReceived:11449;Count:41
x-tmn: [4yutWxYWM9RbdoCDsQJQRFr9QbzHH0Oq]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: e90d1266-f196-4974-46f7-08d7bf63a291
x-ms-traffictypediagnostic: BN7NAM10HT176:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6WOorvkZRD9m4FtsQ0CNWWErFFjHmXKhvo/kod1xR2t6C0XorZMLd9TRTuw3F7HvMS6C+giyLs2dbfDfZt3ZwaB0mUE6sLMibvke+WlMgB9OljmJd4yA2efNa2MRtH/77SCK4hAwOvtc6nX9FQCqyRF4o3Ndb/vLgHHUGiCZ0+mECgOqhcrzIgt7SyTQlMQR
x-ms-exchange-antispam-messagedata: 4MTZjluC67XvJeNeYAA6R2CqI6bMcAOHsRjAB0Im0PbXPUIISyNtp4vqC6tFCQHl769Fhzm+qN/X//0RiwOtqUVO6JJ8ywi91Wpj6/OpsAJgIMhuuLavpONqd/ppddxIGNdPoYoUaT6aBmQ6IJ8dEA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_SN6PR06MB4352FFCC9E395C4385F9F0A085EB0SN6PR06MB4352namp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e90d1266-f196-4974-46f7-08d7bf63a291
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 11:11:34.4902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT176
X-Original-Sender: stevehill606@msn.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@msn.com header.s=selector1 header.b=eaiFxBzz;       arc=pass (i=1);
       spf=pass (google.com: domain of stevehill606@msn.com designates
 40.92.40.89 as permitted sender) smtp.mailfrom=stevehill606@msn.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=msn.com
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

--_000_SN6PR06MB4352FFCC9E395C4385F9F0A085EB0SN6PR06MB4352namp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Carlos Scevola solicitor
Phone- +1-443-588-5040




Good day ,




I am Carlos Scevola. I have emailed you earlier on, without any response fr=
om you. On my first email I mentioned about my late client, whose relatives=
 I cannot get in touch with. But both of you have the same last name so it =
will be very easy to front you as his official next of kin. I am compelled =
to do this because I would not want the finance house to push my client=E2=
=80=99s funds into their treasury as unclaimed inheritance. If you are inte=
rested you do let me know so that I can give you Comprehensive details on w=
hat we are to do.

Sincerely,
Carlos Scevola


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/SN6PR06MB4352FFCC9E395C4385F9F0A085EB0%40SN6PR06MB4352.namprd=
06.prod.outlook.com.

--_000_SN6PR06MB4352FFCC9E395C4385F9F0A085EB0SN6PR06MB4352namp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>Carlos Scevola solicitor<br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span></span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div>Phone- &#43;1-443-588-5040<br>
</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>Good day ,<br>
</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>I am Carlos Scevola. I have emailed you earlier on, without any respon=
se from you. On my first email I mentioned about my late client, whose rela=
tives I cannot get in touch with. But both of you have the same last name s=
o it will be very easy to front
 you as his official next of kin. I am compelled to do this because I would=
 not want the finance house to push my client=E2=80=99s funds into their tr=
easury as unclaimed inheritance. If you are interested you do let me know s=
o that I can give you Comprehensive details
 on what we are to do.<br>
</div>
<div><br>
</div>
<div>Sincerely,<br>
</div>
<div>Carlos Scevola<br>
</div>
<div><br>
</div>
<br>
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/SN6PR06MB4352FFCC9E395C4385F9F0A085EB0%40SN6PR06MB=
4352.namprd06.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/SN6PR06MB4352FFCC9E395C4385F9F0=
A085EB0%40SN6PR06MB4352.namprd06.prod.outlook.com</a>.<br />

--_000_SN6PR06MB4352FFCC9E395C4385F9F0A085EB0SN6PR06MB4352namp_--
