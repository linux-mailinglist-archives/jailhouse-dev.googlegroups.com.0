Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3EE2SAQMGQE5FUX2DY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECF2322B65
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Feb 2021 14:26:05 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id 133sf14432460ljf.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Feb 2021 05:26:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1614086764; cv=pass;
        d=google.com; s=arc-20160816;
        b=ryU/qn0UQz/osyN1n+Yw7TGaHNoNPEj1w+1YJesjwKt2c4FbiNzdqtF7cbw+MYSqqW
         A5NnQaxFButSaHbqASQcZ4ahyQcOcVn/lNnmN2uAb9SZTAKhK44bpOLVhs0wcdOGrOj2
         4GzYS/9ZO8jcpvrbQ8uigOuJjABDjCXbx7QWOUWs5d570fLqob3+/py0zL8n7ERTCFL5
         gpiAT4RuZlw5pVu6yjm5+tYbawmoAY9vnHJCJz39vaYeD8/OVwziJOk1evVg8FuqzSyY
         EqMHwNaSmPVn+7hDCAwJ26FcsFnrHKarztZs7sV+1l5uHsYBOgx976uOJ7Y466fiq+b2
         Rbww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=KiAkqFdtr52BPgZDp5R7Cr9UxYKCWMP3ZcrJ1zt51Nc=;
        b=NoXT0Kg+5Lsb6qAUYUYK+pIftrJaQ3SOOlHtzatNIccxm9trBQU79ka+/2lfR/eUe5
         bGGZefyZghZBXxH43Q8EueyisVrm/c1Z1yGtBq+EmwhZiyP5HdWQCsg28eoPdbF+GBpd
         yjhGp8hHb24hDXrZJsYHL/IEdH2qbujED/o0PQe/pf15L09skqX6wX5qa6d3QgvoCQ2O
         wqLtjaW/WWeVREji35bKQWtuPrTY6ZTpqNA5DoOFBcFUUX4vcOz90KrE2M3Zp/I9SsnW
         MqwmeoHHX/9PD+kGrs4vVq5UWRCLq1mMJZZw5qTP9tFKmfhsm8Id4qmxlnc166mrUTii
         1mtQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KiAkqFdtr52BPgZDp5R7Cr9UxYKCWMP3ZcrJ1zt51Nc=;
        b=UN69ghF1ppVcbUzJn2DyQ2so5vY5gvb3Joo8FTwWtmrR9LFzyYx5trFxVMybBxkPot
         afr2yYJTNeQaomljxdwNZGbNA1i1fn4rCBsuPT8cDYYo9WtQRO7GcYPlWCZSyqfT2pel
         pTBJh8W7gjmVG6L0FyI9Eh79giRMLHUuVLsGpash3FXit0h9Wh8LikUyjcDRzkpEnWMn
         I1mPzIXzyxS0r0xv+AP2Ldl4jxcLzVGh7BBEBWZRAuldLNjT3PVRYnqHrEdyYktQQtaB
         2ljZ4A1aC5Rv52b4z5ck1UnVB1wtMg01Mm0wZ+ImNdW62s9YvAJknmg/8evYTk1RQr9p
         He2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KiAkqFdtr52BPgZDp5R7Cr9UxYKCWMP3ZcrJ1zt51Nc=;
        b=t5cBgeKX6rJF/qdmPQQ7wHhQ3YybQCbyPlaWZgx7GNGXZ8tK6YPZx0Tf7iyteFwJ2F
         CXAANcuLdJtSGiXh3epvoDhz8vk/bYDgeK/YKS4GcCH3/gRze7AJUGKTBLQUV5s4R0Yl
         2Y8Qaf5JEgPCb8dYqPpveT69+UGSXL8EvoWSQOkcrzvy4wcyYnaaOOtU96ZJ/fWpYmiO
         3p8wwag580X/wJcztdZOGaR0KDt/GmrmUNrjBXzaKPwvb1UUaHoZ8To1kuPc9q+1DnWU
         Vrxt3RTGaiRVZXuHXNNl6Nzi5Jvq3Frj8fmH8CWfRYZg8HlBj839NSO9qWURrjyS8Mzl
         n+EQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532y0ACZicRdrgsn6MIKncWtTtSEl5DAQqy/t+BNi0RtCZHdSLmR
	24wucXaL405Bu6sZO38S6+M=
X-Google-Smtp-Source: ABdhPJza0Z9jgokxuV50mmhGmqDFhhZXXezZkLm3oUShLqSZkJpgLNI23pJemkWcH2xcNp4scOCFTg==
X-Received: by 2002:a19:ca14:: with SMTP id a20mr15665989lfg.567.1614086764504;
        Tue, 23 Feb 2021 05:26:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc11:: with SMTP id b17ls582254ljf.7.gmail; Tue, 23 Feb
 2021 05:26:03 -0800 (PST)
X-Received: by 2002:a2e:9f0e:: with SMTP id u14mr16375008ljk.16.1614086763319;
        Tue, 23 Feb 2021 05:26:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614086763; cv=none;
        d=google.com; s=arc-20160816;
        b=a+Sw/g4IJ0WRFWAYBBmSS3+1Wi5J8BAXQabkE0GmKD/XPKCoIaBkpH9girghtMycOW
         0cPXT6VNMAbIX8hNcWj8r2srK+NSE2dewSXXGNIvntdrAoOgLpLYp4FqSrTWMkWsSbsE
         jPri+Ks9kqUwUdSx3ap//oF/ndSsJ718IISKTAl5T8YdAZPZwB7/ygaEpKdS9I1XlpOV
         weDHacgc9A9oCH355FzoMPA8jxNp9Zq9i+QCmeWvWkmVFcWj8eUF+bJnJFasUPG5ysuq
         WPqbRz43zP/Rzr43l2zFN2Rn4qjsLVJDYtOJ05HWX/p/OPHx+d9bmlgHaBnmvcyDt54T
         VvBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=kjqm/LIoiZIiac4VdmJFjWFl7YJRmtdZ19KtOXNK5HE=;
        b=0J/KjQQPUo/ZAUicEZePVpNcc9X7MkYXSWxsHRnJlfWqBkWt9vi3s3W8kL6H61Ot+6
         m+a8h9sAlLno0wDIR6XZoc/ADbvwBhZplJumb9F6tjRBRD680u0m39T72iSyclr+70Aa
         cuD3xfozj6u6tGO5zZHEzjFqWqnecTa1jdflDeiU42oFVjooJ8OHu+wk7XTU7IC+Y0Ze
         me5NHIciLyHLSYRJ67g6m/Kp70RYMLZXRBqGHRxM9PtXto/Eq49+7v0Hkgq14/nfaMeN
         M0M6rXg0ffIvQjWow76no5IoVmQhMRRUn/JB8LtQ+JzOM/ZjzDMLu5xHQy2ddURgqlca
         pRIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m17si674175lfg.0.2021.02.23.05.26.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 05:26:03 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 11NDQ24G022514
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Feb 2021 14:26:02 +0100
Received: from [167.87.18.238] ([167.87.18.238])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 11NDL1vG011695;
	Tue, 23 Feb 2021 14:21:01 +0100
Subject: Re: Invalid PCI config write, port cfc, size 1, address port:
 8000f940
To: Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <4b6f864a20164d4884425ea87059a92f@spc015.packaging.ulma.es>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0d6ec3fd-adf2-d54e-57c9-99244f280538@siemens.com>
Date: Tue, 23 Feb 2021 14:21:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4b6f864a20164d4884425ea87059a92f@spc015.packaging.ulma.es>
Content-Type: multipart/alternative;
 boundary="------------0D9672338D87332934608282"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

This is a multi-part message in MIME format.
--------------0D9672338D87332934608282
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gMjIuMDIuMjEgMDk6MjcsIFJhaW11bmRvIFNhZ2FyemF6dSB3cm90ZToNCj4NCj4gSGkgYWxs
LA0KPg0KPiDCoA0KPg0KPiBJJ20gdHJ5aW5nIHRvIGdpdmUgU01idXMgYWNjZXNzIHRvIGFuIGlu
bWF0ZSBjZWxsIGJ1dCB0aGUgc3lzdGVtIGhhbmdzDQo+IG9uIHRoaXMgZXJyb3I6IOKAnEludmFs
aWQgUENJIGNvbmZpZyB3cml0ZSwgcG9ydCBjZmMsIHNpemUgMSwgYWRkcmVzcw0KPiBwb3J0OiA4
MDAwZjk0MOKAnSB3aGVuIEkgdHJ5IHRvIGxvYWQgdGhlIGNlbGwuDQo+DQo+IMKgDQo+DQo+IEl0
4oCZcyBhIHg4NiBob3N0IGFuZCB3ZSBhbHJlYWR5IGhhdmUgamFpbGhvdXNlIHJ1bm5pbmcgd2l0
aCB0d28gaW5tYXRlDQo+IGNlbGxzIGdpdmluZyBhY2Nlc3MgdG8gbmV0IGRldmljZXMsIHNoYXJp
bmcgbWVtb3J5LCBldGMuDQo+DQo+IMKgDQo+DQo+IEZyb20gImxzcGNpIiwgSSBoYXZlOg0KPg0K
PiDCoA0KPg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwMDoxZi4xIFNNQnVzOiBJbnRl
bCBDb3Jwb3JhdGlvbiBDZWxlcm9uIE4zMzUwL1BlbnRpdW0NCj4gTjQyMDAvQXRvbSBFMzkwMCBT
ZXJpZXMgU01CdXMgQ29udHJvbGxlciAocmV2IDBiKQ0KPg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRGV2aWNlTmFtZTogT25ib2FyZCAt
IE90aGVyDQo+DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBTdWJzeXN0ZW06IEludGVsIENvcnBvcmF0aW9uIERldmljZSA3MjcwDQo+DQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBG
bGFnczogbWVkaXVtIGRldnNlbCwgSVJRIDIwDQo+DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNZW1vcnkgYXQgOTE2MTYwMDAgKDY0LWJp
dCwNCj4gbm9uLXByZWZldGNoYWJsZSkgW3NpemU9MjU2XQ0KPg0KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSS9PIHBvcnRzIGF0IGYwNDAg
W3NpemU9MzJdDQo+DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBLZXJuZWwgZHJpdmVyIGluIHVzZTogaTgwMV9zbWJ1cw0KPg0KPiDCoA0K
Pg0KPiBGcm9tICJqYWlsaG91c2UgY29uZmlnIGNyZWF0ZSAuLi4iOg0KPg0KPiDCoA0KPg0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBNZW1SZWdpb246IDkxNTE2MDAwLTkxNTE2MGZm
IDogMDAwMDowMDoxZi4xICovDQo+DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsNCj4N
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5waHlzX3N0YXJ0ID0gMHg5MTUxNjAwMCwNCj4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC52aXJ0X3N0YXJ0ID0gMHg5MTUxNjAwMCwN
Cj4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC5zaXplID0gMHgxMDAwLA0KPg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwNCj4g
SkFJTEhPVVNFX01FTV9XUklURSwNCj4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSwN
Cj4NCj4gLi4uDQo+DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFBvcnQgSS9POiBm
MDQwLWYwNWYgOiAwMDAwOjAwOjFmLjEgKi8NCj4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgUElPX1JBTkdFKDB4ZjA0MCwgMHgyMCksDQo+DQo+IC4uLg0KPg0KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAvKiBQQ0lEZXZpY2U6IDAwOjFmLjEgKi8NCj4NCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgew0KPg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLA0K
Pg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLmlvbW11ID0gMSwNCj4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5kb21haW4gPSAweDAsDQo+DQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuYmRmID0gMHhmOSwNCj4NCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5i
YXJfbWFzayA9IHsNCj4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweGZmZmZmZjAwLCAw
eGZmZmZmZmZmLA0KPiAweDAwMDAwMDAwLA0KPg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDB4MDAwMDAwMDAsIDB4ZmZmZmZmZTAsDQo+IDB4MDAwMDAwMDAsDQo+DQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LA0KPg0KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNhcHNf
c3RhcnQgPSAwLA0KPg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLm51bV9jYXBzID0gMCwNCj4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5udW1fbXNpX3ZlY3RvcnMgPSAwLA0K
Pg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLm1zaV82NGJpdHMgPSAwLA0KPg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLm1zaV9tYXNrYWJsZSA9IDAsDQo+DQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubnVtX21zaXhf
dmVjdG9ycyA9IDAsDQo+DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwNCj4NCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5tc2l4X2FkZHJl
c3MgPSAweDAsDQo+DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0sDQo+DQo+IMKgDQo+
DQo+IEZpcnN0IHRoaW5nIEkgY2FuIHNlZSBpcyB0aGF0IGxzcGNpIHNob3dzIHRoYXQgZGV2aWNl
J3MgbWVtb3J5IHJlZ2lvbiBpczoNCj4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTWVt
b3J5IGF0IDkxNjE2MDAwICg2NC1iaXQsIG5vbi1wcmVmZXRjaGFibGUpIFtzaXplPTI1Nl0NCj4N
Cj4gwqANCj4NCj4gV2hpbGUgImphaWxob3VzZSBjb25maWcgY3JlYXRlIC4uLiIgc2hvd3M6DQo+
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1lbVJlZ2lvbjogOTE1MTYwMDAtOTE1MTYw
ZmYgOiAwMDAwOjAwOjFmLjENCj4NCj4gwqANCj4NCj4gSXMgdGhhdCBjb3JyZWN0Pw0KPg0KPiDC
oA0KPg0KPiBBbnl3YXksIGRpZ2dpbmcgaW4gdGhlIGNvZGUgSSBjYW4gc2VlIHRoYXQgdGhlIGVy
cm9yIGNvbWVzIG9uDQo+ICJoeXBlcnZpc29yL3BjaS5jLCBwY2lfY2ZnX3dyaXRlX21vZGVyYXRl
KCkgLi4uIiwgd2hlbiB0cnlpbmcgdG8NCj4gYWNjZXNzIGFkZHJlc3MgMHg0MCBidXQgZGV2aWNl
IGhhcyBubyBjYXBhYmlsaXRpZXMuDQo+DQo+IMKgDQo+DQo+IEdpdmluZyBhY2Nlc3MgdG8gdGhp
cyBkZXZpY2UgaXMgbm90IGEgYmlnIGlzc3VlIGZvciB1cyBiZWNhdXNlIHdlIGNhbg0KPiBzaGFy
ZSAiL2Rldi9pMmMtMCIgc3RhdHVzIG92ZXIgSVZzaG1lbSBidXQgSSdkIGxpa2UgdG8ga25vd24g
aWYNCj4gdGhlcmUncyBzb21ldGhpbmcgZWxzZSBJIGNhbiBkbyBvciBpdCBqdXN0IGNhbid0IGJl
IGRvbmUuDQo+DQo+IMKgDQo+DQoNClRoaXMgY29uZmlnIHNwYWNlIHJlZ2lzdGVyIG1pZ2h0IGJl
IGEgc2lkZS1iYW5kIHJlZ2lzdGVyLiBZb3UgY291bGQNCnBlcm1pdCBhY2Nlc3MgYnkgbW9kZWxs
aW5nIGl0IGxpa2UgYSBjYXBhYmlsaXR5LCBpZS4gY3JlYXRlIG9uZSBhdCAweDA0DQpvZiB0aGUg
bmVlZGVkIHNpemUgKGF0IGxlYXN0IDEgYnl0ZSkgYW5kIHdpdGggd3JpdGUgcGVybWlzc2lvbnMu
IENhcCBJRA0KY2FuIGJlIDAgb3IgYW55dGhpbmcgZWxzZSBpbnZhbGlkLg0KDQpKYW4NCg0KLS0g
DQpTaWVtZW5zIEFHLCBUIFJEQSBJT1QNCkNvcnBvcmF0ZSBDb21wZXRlbmNlIENlbnRlciBFbWJl
ZGRlZCBMaW51eA0KDQotLSAKWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBh
cmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAiSmFpbGhvdXNlIiBncm91cC4KVG8g
dW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJv
bSBpdCwgc2VuZCBhbiBlbWFpbCB0byBqYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdy
b3Vwcy5jb20uClRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6
Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvMGQ2ZWMzZmQtYWRmMi1k
NTRlLTU3YzktOTkyNDRmMjgwNTM4JTQwc2llbWVucy5jb20uCg==
--------------0D9672338D87332934608282
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 22.02.21 09:27, Raimundo Sagarzazu
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:4b6f864a20164d4884425ea87059a92f@spc015.packaging.ulma.es=
">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]-->
      <style>@font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}span.EstiloCorreo18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></spa=
n></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>=C2=A0</o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">I'm trying to give SMbu=
s
            access to an inmate cell but the system hangs on this error:
            =E2=80=9CInvalid PCI config write, port cfc, size 1, address po=
rt:
            8000f940=E2=80=9D when I try to load the cell.<o:p></o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>=C2=A0</o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">It=E2=80=99s a x86 host=
 and we
            already have jailhouse running with two inmate cells giving
            access to net devices, sharing memory, etc.<o:p></o:p></span></=
p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>=C2=A0</o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">From "lspci", I have:<o=
:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>=C2=A0</o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00:1f.1
            SMBus: Intel Corporation Celeron N3350/Pentium N4200/Atom
            E3900 Series SMBus Controller (rev 0b)<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            DeviceName: Onboard - Other<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            Subsystem: Intel Corporation Device 7270<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            Flags: medium devsel, IRQ 20<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            Memory at 91616000 (64-bit, non-prefetchable) [size=3D256]<o:p>=
</o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            I/O ports at f040 [size=3D32]<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            Kernel driver in use: i801_smbus<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>=C2=A0</o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">From "jailhouse config
            create ...":<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>=C2=A0</o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
            MemRegion: 91516000-915160ff : 0000:00:1f.1 */<o:p></o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<o:p></o:p></spa=
n></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .phys_start =3D 0x91516000,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .virt_start =3D 0x91516000,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .size =3D 0x1000,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p>=
</span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },<o:p></o:p></sp=
an></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">...<o:p></o:p></span></=
p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Port
            I/O: f040-f05f : 0000:00:1f.1 */<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            PIO_RANGE(0xf040, 0x20),<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">...<o:p></o:p></span></=
p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
            PCIDevice: 00:1f.1 */<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<o:p></o:p></spa=
n></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .type =3D JAILHOUSE_PCI_TYPE_DEVICE,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .iommu =3D 1,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .domain =3D 0x0,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .bdf =3D 0xf9,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .bar_mask =3D {<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            0xffffff00, 0xffffffff, 0x00000000,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            0x00000000, 0xffffffe0, 0x00000000,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            },<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .caps_start =3D 0,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .num_caps =3D 0,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .num_msi_vectors =3D 0,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .msi_64bits =3D 0,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .msi_maskable =3D 0,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .num_msix_vectors =3D 0,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .msix_region_size =3D 0x0,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            .msix_address =3D 0x0,<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },<o:p></o:p></sp=
an></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>=C2=A0</o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">First thing I can see i=
s
            that lspci shows that device's memory region is:<o:p></o:p></sp=
an></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Memory at
            91616000 (64-bit, non-prefetchable) [size=3D256]<o:p></o:p></sp=
an></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>=C2=A0</o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">While "jailhouse config
            create ..." shows:<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MemRegion:
            91516000-915160ff : 0000:00:1f.1<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>=C2=A0</o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">Is that correct?<o:p></=
o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>=C2=A0</o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">Anyway, digging in the
            code I can see that the error comes on "hypervisor/pci.c,
            pci_cfg_write_moderate() ...", when trying to access address
            0x40 but device has no capabilities.<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>=C2=A0</o:p></span=
></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">Giving access to this
            device is not a big issue for us because we can share
            "/dev/i2c-0" status over IVshmem but I'd like to known if
            there's something else I can do or it just can't be done.<o:p><=
/o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>=C2=A0</o:p></span=
></p>
      </div>
    </blockquote>
    <br>
    This config space register might be a side-band register. You could
    permit access by modelling it like a capability, ie. create one at
    0x04 of the needed size (at least 1 byte) and with write
    permissions. Cap ID can be 0 or anything else invalid.<br>
    <br>
    Jan<br>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
</pre>
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
om/d/msgid/jailhouse-dev/0d6ec3fd-adf2-d54e-57c9-99244f280538%40siemens.com=
?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/=
jailhouse-dev/0d6ec3fd-adf2-d54e-57c9-99244f280538%40siemens.com</a>.<br />

--------------0D9672338D87332934608282--
