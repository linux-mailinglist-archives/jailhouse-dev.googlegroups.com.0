Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUW5XH3AKGQE4G37BGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5302E1E4420
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 15:44:51 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id i185sf5991308lji.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 06:44:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590587091; cv=pass;
        d=google.com; s=arc-20160816;
        b=endymrVVpAnhLvA0TpfMLvbv9i7Xx/bd9CoQ8dCh4B8Wa7n9QISHi62V7694LbuiY+
         IVUSOroIEAHcbQdWI3cbkgfBL4zawVGwaVSH+5KHByILZ7J920L+x6QEawPYZvMvd2r3
         FSy2Bjxe7XNwy8VNLBe4NsbTxeM6k4oSkUfTRpTsoJ+JTKmUSK1nS42TaqnKuWOAnqwt
         5hixlfBjxbgwKIMcHjtCtLWuPJNOgi3gea8GrG/5JnsTnuVkIyyWEoXJRhBNKZVNnWk6
         Bmpk7ei5jZNBIUPHmzWe7b9rxvkILunWFuDfGncMA7xXxD2aMYobi3Dco0R/9Ibil3TI
         IhGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=G4jcoe3K3HAJOFx+1U9jLYXxWIWgIE/Eq0vGlYPQCs8=;
        b=XiwqxydvmH3TwC0Wed6mT6grbNg1pDT80YE3Pudzl6mt+N8ay7aTR/M5Led5rhgJ0U
         T2LETqBZLjd3AGmFDaLzxYQkGMlUXFoj5PToclcIvHyVyHYPlu7mjRrYE1DxEnpu8Smt
         571cWhet+lnSYO24wCn8I8QFAPq6W1HzKF1b6+yPU/eSxIaY+vaGYc0QR2DaKMo5p2mt
         hKhq3iSK7KmzP0a3FHdn4Kzu1bSIa/uoX5u0aMJJONS9Ls1oV1VyEbDtRrtX5saMRo2C
         ujacfWAXdNnrcMRqwS23FO06vGFZApK0HNVm0YUB60KmMFQ7Q7V5ZUaobE7cPPfmNBtf
         SEfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G4jcoe3K3HAJOFx+1U9jLYXxWIWgIE/Eq0vGlYPQCs8=;
        b=mRtDuLpAE6XfP75K5BMhtg/4IBaGFTNjyjeIVFb6bEelN32/mm9NLoZocmKYJuAuan
         ebnR81mw2jAkWzQS/+NLObTyfNr3Vd0EN7nXuIBQkLI+grzIhFLtJO7ZARLUjQ/syP6b
         L74qLUarjZKYANnBMqqAmYlT558882PGjztaSPAeLtIgPbVP8HGQq04dlsAaz9P7Gx3v
         uOY36cLr4Y6VkzGeisXd7kXBk3i51og3/XlBUAmCmWiMOz2fnHKksOwGatlr+qS2Aor/
         xJlOirv4zcY1Ah5OaTSiWlOPKi4Pqwt+8wgn00GLFU9MC70iohFvb9P1b7q+RCD6YDP5
         ZQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G4jcoe3K3HAJOFx+1U9jLYXxWIWgIE/Eq0vGlYPQCs8=;
        b=GukAWSsB4kOqAxX+D/pluOVY/2FvaW9IgCnsRzyYTN8ma5T7rzzlYHps75M0KN21oB
         qC0abGrk53H5eyG/nvDI8HgsjQAStKeHI7YiHwZLpxjM6QM3WzEMHkrybUZ/zxfsTdEX
         316wusMciWlqM0uKIyjyRuwhrDVrUVBtmKC/jv886jl5Sc+tges/kGIhd5BPKgyIx4MG
         Pz/sK0QbEUKNGeuLJi2+Ya70d+MXmBRcOV2rZrv5f4JiKH6EfzdoK5yJ4oSj62Us0By/
         K+bbmk0EAE4c712kdsC/4M0nr2tQWNNWia9t7qwYh+j3LuKTYY1A1cNigEPqMm1a15fU
         /9Mw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531E7t+jyXlqaRDUhU7Ag1TH6b1A//SbMezusMWVtnC/MAAuCT1L
	ELrB8beS4RJ3U8/r29erRpo=
X-Google-Smtp-Source: ABdhPJz931+Apx3e6SydUFkG96zzwa32drydaMpQxlU/QPiXNIyBv4ZGmgmPaUdJDDnlTFGifIO1CQ==
X-Received: by 2002:a19:ed17:: with SMTP id y23mr3223612lfy.162.1590587090804;
        Wed, 27 May 2020 06:44:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:860d:: with SMTP id a13ls2893916lji.11.gmail; Wed, 27
 May 2020 06:44:50 -0700 (PDT)
X-Received: by 2002:a2e:920b:: with SMTP id k11mr3263212ljg.395.1590587089930;
        Wed, 27 May 2020 06:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590587089; cv=none;
        d=google.com; s=arc-20160816;
        b=tRM9oEKEvRYlpU+Feqc3qkCajvnFcy9+D8AiAV3QEWQKx3RybqUONpJBSBwM5qLROI
         eg2ah0sH1gt+xn16jxZbY8Ud4BNqlpukgqkhEhvoNjGZMMykFCbDHhyT2a3ibiiOZkyU
         2sPSjeNqWPCITLed274OpGZvbMgQPNdVbIqVNYzUqDKnUNjxdB3NjDBUYyIkMmPfCR+w
         UTlxdXxUE6DWTenkYnOJ8rwtVk44/AvZQ9GIX7xpJPCbsTZV6OT/m0trqeLb3QG0/5PT
         DmTR9MQh1vT2asRjtamvNwG7SM17jGaIA7VtT/WqK+HfHI01exufgNkMoQyrVGigqLy3
         zisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Q4IrlcaAhQ09a1YtHHepFQ0ydEbFYLFnHsMX4CqTpf0=;
        b=g++HgXbyizt8bAro04NyOsmoeJD81vVaeyQN/EAPfq/8Cc7NUMm+iGW93i1Y+0XsV9
         xqAvwlWdOfnya++/khIO5haTLZH8QmogsgTw+AoeJ5Gil8QWCZ/LOn8Xcpq++MOjGQfC
         e7J8EbhkFHZndE91orrGtDTB5HGRb6rzMa7gwjDzFSPTNoQA+Tfih3bhgBZKHxTKveeE
         ARPpNnIaAPuba+TbQtC5rRFcY6qPWr9DMredAZZtmMIbr23QCvMe6ZioGyr2joX0sJxZ
         RCb40OXMWVnvGSOMe2q+R9RhU4nEcPtGkAK8kYDrPvluzvZKn3pLvOU06vZOGozDcM3m
         puZg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id o10si157324ljp.3.2020.05.27.06.44.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 06:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 04RDimJf016362
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 15:44:49 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04RDimKp025170;
	Wed, 27 May 2020 15:44:48 +0200
Subject: Re: [PATCH v1 1/4] configs: k3-j721e-evm: Describe separate IVSHMEM
 regions for demo
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-2-nikhil.nd@ti.com>
 <bb32dba1-73ca-e01c-f894-e24f482516ea@siemens.com>
 <b1ec21e9-b341-0634-2ca9-90891d156e53@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <10b61617-a707-a00f-52c8-91cf0c2cd36a@siemens.com>
Date: Wed, 27 May 2020 15:44:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b1ec21e9-b341-0634-2ca9-90891d156e53@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: base64
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

T24gMjcuMDUuMjAgMTU6MzEsIE5pa2hpbCBEZXZzaGF0d2FyIHdyb3RlOg0KPiANCj4gDQo+IE9u
IDI3LzA1LzIwIDY6NTggcG0sIEphbiBLaXN6a2Egd3JvdGU6DQo+PiBPbiAyNy4wNS4yMCAxNDoz
MiwgbmlraGlsLm5kQHRpLmNvbSB3cm90ZToNCj4+PiBGcm9tOiBOaWtoaWwgRGV2c2hhdHdhciA8
bmlraGlsLm5kQHRpLmNvbT4NCj4+Pg0KPj4+IEN1cnJlbnQgSVZTSE1FTSByZWdpb25zIGFyZSBk
ZXNjcmliZWQgdG8gYmUgdXNlZCBmb3IgaXZzaG1lbS1uZXQNCj4+PiBkcml2ZXIuIEZvciBzdGFu
ZGFsb25lIGl2c2htZW0gY29tbXVuaWNhdGlvbiwgdGhlc2UgcmVnaW9ucyBuZWVkIHRvDQo+Pj4g
YmUgYWRkZWQgZXhwbGljaXRseSBpbnN0ZWFkIG9mIHVzaW5nIHRoZSBtYWNyby4NCj4+Pg0KPj4+
IEFkZCByZWdpb25zIGZvciBhIDIgcGVlciBJVlNITUVNIGNvbW11bmljYXRpb24NCj4+PiDCoCAo
MCA9IHJvb3QgY2VsbCwgMSA9IGJhcmVtZXRhbCAvIGxpbnV4LWRlbW8pDQo+Pj4NCj4+PiBBbHNv
IGNoYW5nZSB0aGUgcHJvdG9jb2wgdG8gVU5ERUZJTkVEIHNvIHRoYXQgdGhlIGl2c2htZW0tbmV0
IGRyaXZlcg0KPj4+IGRvZXMgbm90IGdldCBlbmdhZ2VkLiBTd2l0Y2ggYmRmID0gMCBmb3IgY29u
c2lzdGVuY3kgYWNyb3NzIGFsbA0KPj4+IHBsYXRmb3Jtcy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYt
Ynk6IE5pa2hpbCBEZXZzaGF0d2FyIDxuaWtoaWwubmRAdGkuY29tPg0KPj4+IC0tLQ0KPj4+IMKg
IGNvbmZpZ3MvYXJtNjQvazMtajcyMWUtZXZtLWxpbnV4LWRlbW8uYyB8IDMzICsrKysrKysrKysr
KysrKysrKysrKystLS0NCj4+PiDCoCBjb25maWdzL2FybTY0L2szLWo3MjFlLWV2bS5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDMzICsrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4+PiDCoCAy
IGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9hcm02NC9rMy1qNzIxZS1ldm0tbGludXgtZGVtby5jDQo+
Pj4gYi9jb25maWdzL2FybTY0L2szLWo3MjFlLWV2bS1saW51eC1kZW1vLmMNCj4+PiBpbmRleCBj
ZGExNjE0YS4uYjZhNTZlMmUgMTAwNjQ0DQo+Pj4gLS0tIGEvY29uZmlncy9hcm02NC9rMy1qNzIx
ZS1ldm0tbGludXgtZGVtby5jDQo+Pj4gKysrIGIvY29uZmlncy9hcm02NC9rMy1qNzIxZS1ldm0t
bGludXgtZGVtby5jDQo+Pj4gQEAgLTU2LDggKzU2LDMzIEBAIHN0cnVjdCB7DQo+Pj4gwqDCoMKg
wqDCoCB9LA0KPj4+IMKgIMKgwqDCoMKgwqAgLm1lbV9yZWdpb25zID0gew0KPj4+IC3CoMKgwqDC
oMKgwqDCoCAvKiBJVlNITUVNIHNoYXJlZCBtZW1vcnkgcmVnaW9uIGZvciAwMDowMS4wICovDQo+
Pj4gLcKgwqDCoMKgwqDCoMKgIEpBSUxIT1VTRV9TSE1FTV9ORVRfUkVHSU9OUygweDg5ZmUwMDAw
MCwgMSksDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qIElWU0hNRU0gc2hhcmVkIG1lbW9yeSByZWdp
b25zIGZvciAwMDowMC4wIChkZW1vKSAqLw0KPj4+ICvCoMKgwqDCoMKgwqDCoCB7DQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnBoeXNfc3RhcnQgPSAweDg5ZmUwMDAwMCwNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAudmlydF9zdGFydCA9IDB4ODlmZTAwMDAwLA0KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5zaXplID0gMHgxMDAwMCwNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1JPT1RT
SEFSRUQsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0sDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHsNCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucGh5c19zdGFydCA9IDB4ODlmZTEwMDAwLA0KPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC52aXJ0X3N0YXJ0ID0gMHg4OWZlMTAwMDAsDQo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNpemUgPSAweDEwMDAwLA0KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1f
Uk9PVFNIQVJFRCB8DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEpBSUxI
T1VTRV9NRU1fV1JJVEUgLA0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9LA0KPj4+ICvCoMKgwqDCoMKg
wqDCoCB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnBoeXNfc3RhcnQgPSAweDg5ZmUy
MDAwMCwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAudmlydF9zdGFydCA9IDB4ODlmZTIw
MDAwLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaXplID0gMHgxMDAwMCwNCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlM
SE9VU0VfTUVNX1JPT1RTSEFSRUQsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0sDQo+Pj4gK8KgwqDC
oMKgwqDCoMKgIHsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucGh5c19zdGFydCA9IDB4
ODlmZTMwMDAwLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC52aXJ0X3N0YXJ0ID0gMHg4
OWZlMzAwMDAsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNpemUgPSAweDEwMDAwLA0K
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8
IEpBSUxIT1VTRV9NRU1fUk9PVFNIQVJFRCB8DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEpBSUxIT1VTRV9NRU1fV1JJVEUgLA0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9LA0K
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBjdHJsIG1tciAqLyB7DQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLnBoeXNfc3RhcnQgPSAweDAwMTAwMDAwLA0KPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC52aXJ0X3N0YXJ0ID0gMHgwMDEwMDAwMCwNCj4+PiBAQCAtMjEyLDEy
ICsyMzcsMTIgQEAgc3RydWN0IHsNCj4+PiDCoMKgwqDCoMKgIC5wY2lfZGV2aWNlcyA9IHsNCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogMDA6MDEuMCAqLyB7DQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfSVZTSE1FTSwNCj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAuYmRmID0gMSA8PCAzLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC5iZGYgPSAwIDw8IDMsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmJh
cl9tYXNrID0gSkFJTEhPVVNFX0lWU0hNRU1fQkFSX01BU0tfSU5UWCwNCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAuc2htZW1fcmVnaW9uc19zdGFydCA9IDAsDQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLnNobWVtX2Rldl9pZCA9IDEsDQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLnNobWVtX3BlZXJzID0gMiwNCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAuc2htZW1fcHJvdG9jb2wgPSBKQUlMSE9VU0VfU0hNRU1fUFJPVE9fVkVUSCwNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAuc2htZW1fcHJvdG9jb2wgPSBKQUlMSE9VU0VfU0hNRU1fUFJP
VE9fVU5ERUZJTkVELA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9LA0KPj4+IMKgwqDCoMKgwqAg
fSwNCj4+PiDCoCBkaWZmIC0tZ2l0IGEvY29uZmlncy9hcm02NC9rMy1qNzIxZS1ldm0uYw0KPj4+
IGIvY29uZmlncy9hcm02NC9rMy1qNzIxZS1ldm0uYw0KPj4+IGluZGV4IGRiZjBjYTdjLi4wYmUw
ZTE5ZiAxMDA2NDQNCj4+PiAtLS0gYS9jb25maWdzL2FybTY0L2szLWo3MjFlLWV2bS5jDQo+Pj4g
KysrIGIvY29uZmlncy9hcm02NC9rMy1qNzIxZS1ldm0uYw0KPj4+IEBAIC05OCw4ICs5OCwzMSBA
QCBzdHJ1Y3Qgew0KPj4+IMKgwqDCoMKgwqAgfSwNCj4+PiDCoCDCoMKgwqDCoMKgIC5tZW1fcmVn
aW9ucyA9IHsNCj4+PiAtwqDCoMKgwqDCoMKgwqAgLyogSVZTSE1FTSBzaGFyZWQgbWVtb3J5IHJl
Z2lvbiBmb3IgMDA6MDEuMCAqLw0KPj4+IC3CoMKgwqDCoMKgwqDCoCBKQUlMSE9VU0VfU0hNRU1f
TkVUX1JFR0lPTlMoMHg4OWZlMDAwMDAsIDApLA0KPj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBJVlNI
TUVNIHNoYXJlZCBtZW1vcnkgcmVnaW9ucyBmb3IgMDA6MDAuMCAoZGVtbykgKi8NCj4+PiArwqDC
oMKgwqDCoMKgwqAgew0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5waHlzX3N0YXJ0ID0g
MHg4OWZlMDAwMDAsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnZpcnRfc3RhcnQgPSAw
eDg5ZmUwMDAwMCwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2l6ZSA9IDB4MTAwMDAs
DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFE
LA0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9LA0KPj4+ICvCoMKgwqDCoMKgwqDCoCB7DQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnBoeXNfc3RhcnQgPSAweDg5ZmUxMDAwMCwNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAudmlydF9zdGFydCA9IDB4ODlmZTEwMDAwLA0KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5zaXplID0gMHgxMDAwMCwNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRF
LA0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9LA0KPj4+ICvCoMKgwqDCoMKgwqDCoCB7DQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnBoeXNfc3RhcnQgPSAweDg5ZmUyMDAwMCwNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAudmlydF9zdGFydCA9IDB4ODlmZTIwMDAwLA0KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5zaXplID0gMHgxMDAwMCwNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRF
LA0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9LA0KPj4+ICvCoMKgwqDCoMKgwqDCoCB7DQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnBoeXNfc3RhcnQgPSAweDg5ZmUzMDAwMCwNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAudmlydF9zdGFydCA9IDB4ODlmZTMwMDAwLA0KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5zaXplID0gMHgxMDAwMCwNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQsDQo+Pj4gK8KgwqDCoMKgwqDCoMKg
IH0sDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGN0cmwgbW1yICovIHsNCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAucGh5c19zdGFydCA9IDB4MDAxMDAwMDAsDQo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnZpcnRfc3RhcnQgPSAweDAwMTAwMDAwLA0KPj4+IEBAIC0z
OTYsMTQgKzQxOSwxNCBAQCBzdHJ1Y3Qgew0KPj4+IMKgwqDCoMKgwqAgfSwNCj4+PiDCoCDCoMKg
wqDCoMKgIC5wY2lfZGV2aWNlcyA9IHsNCj4+PiAtwqDCoMKgwqDCoMKgwqAgLyogMDAwMzowMDow
MS4wICovIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgLyogMDA6MDAuMCAqLyB7DQo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfSVZTSE1FTSwN
Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuYmRmID0gMSA8PCAzLA0KPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC5iZGYgPSAwIDw8IDMsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLmJhcl9tYXNrID0gSkFJTEhPVVNFX0lWU0hNRU1fQkFSX01BU0tfSU5UWCwNCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2htZW1fcmVnaW9uc19zdGFydCA9IDAsDQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNobWVtX2Rldl9pZCA9IDAsDQo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNobWVtX3BlZXJzID0gMiwNCj4+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuc2htZW1fcHJvdG9jb2wgPSBKQUlMSE9VU0VfU0hNRU1fUFJPVE9fVkVUSCwN
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2htZW1fcHJvdG9jb2wgPSBKQUlMSE9VU0Vf
U0hNRU1fUFJPVE9fVU5ERUZJTkVELA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9LA0KPj4+IMKg
wqDCoMKgwqAgfSwNCj4+PiDCoA0KPj4NCj4+IERvIG5vdCBkaXNhYmxlIHRoZSB2ZXRoIGxpbmss
IGFkZCB0aGUgZGVtbyBkZXZpY2UgaW5zdGVhZC4NCj4+DQo+IA0KPiBXaWxsIGRvLiBKdXN0IHRv
IGNvbmZpcm0sIEknbGwga2VlcCB0aGUgYmRmIDAgZGV2aWNlIGZvciBWRVRIIGFuZCBiZGYgMQ0K
PiBmb3IgaXZzaG1lbSB0byBiZSBjb25zaXN0ZW50IHdpdGggb3RoZXIgcGxhdGZvcm1zLg0KPiAN
Cg0KQWxtb3N0OiAwMDowMC4wIGlzIHRoZSBkZW1vIGRldmljZSwgMDA6MDEuMCBpcyB2ZXRoIGlu
IGdlbmVyYWwuDQoNCkphbg0KDQotLSANClNpZW1lbnMgQUcsIENvcnBvcmF0ZSBUZWNobm9sb2d5
LCBDVCBSREEgSU9UIFNFUy1ERQ0KQ29ycG9yYXRlIENvbXBldGVuY2UgQ2VudGVyIEVtYmVkZGVk
IExpbnV4DQoNCi0tIApZb3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBz
dWJzY3JpYmVkIHRvIHRoZSBHb29nbGUgR3JvdXBzICJKYWlsaG91c2UiIGdyb3VwLgpUbyB1bnN1
YnNjcmliZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWlscyBmcm9tIGl0
LCBzZW5kIGFuIGVtYWlsIHRvIGphaWxob3VzZS1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBz
LmNvbS4KVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhlIHdlYiB2aXNpdCBodHRwczovL2dy
b3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi8xMGI2MTYxNy1hNzA3LWEwMGYt
NTJjOC05MWNmMGMyY2QzNmElNDBzaWVtZW5zLmNvbS4K
