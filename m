Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ4WWSFQMGQEQZQS6TQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id A3311430FF3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 07:50:59 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id c5-20020a05600c0ac500b0030dba7cafc9sf1736277wmr.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 17 Oct 2021 22:50:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634536259; cv=pass;
        d=google.com; s=arc-20160816;
        b=XvWsnqMODu0iwDpzRCk0c63XVfROttor7bHBDMq60O/raL4rDnwJ/PBF3DuRGKn8SN
         jUN4ROCU/czbhAspBSsngXfgAMdXSbRCQj6+cTqMD6SNcxR0/+tsh16iV9TozB9rE4Ua
         c5sI6ommWEFN04XGkXg0TZ63BTj+neYX5oqX1ByNjoreHraq/bYFtSxFxGrZqPR7R6W5
         zI9E4ed5BhcDidAXfUQzrA+2MQcdh6+KagRlhTawPRsBmJT3rfNm0IjJLv+uc/7ksJ/B
         A6GTQ4H1pXOTH96RiUSCgeVY5argdbyriAqfih19Fa1Nex7GG0pm57YhrPntVDjTMG5C
         IOKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=KVuNFb6tXl5tXhzL5sI2Rcy+lAlO28EhGVS14ajJJfU=;
        b=kQPEmdBSWF7fdLQkgDyJPSuMQ0vKh86bxyBNQWeiKJMe35YxozxfAz4Gt84ej915mh
         TI4iE0gwLqZ+n79Qr0rEg9MLiOAi4c4YLnl76o/eYimAdnNETRwUyY2gzg+3laOdW6ev
         A3EyRbIHs7aiDI4In/c5L9LDRVvMdRsoCxn7e2alWbAg1XsPDtzGVKMKQoNFXjvLurLL
         znkTwOGdUv6eIKD5jPnUGHy9LOxW6RXy2L/+KbFXGcUq8X09yu7Xlr6T7C7BsHcA/J/W
         BX3f7R1EMf9HxsqfsaameQIBEfxwspJU1p9+o9tppF10MlJt0oOqWER3PXJOmFCG53Wr
         1UWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KVuNFb6tXl5tXhzL5sI2Rcy+lAlO28EhGVS14ajJJfU=;
        b=YAlrlMmKWdc2nwGNEOBpApT7Lsr/uaO1Zk8ISTnhHxHrrlpFv1Vat6CPqs5XQaYBZt
         CgVoNlehHWIgyzFebRYCuaF3SDbC0B6fOo+2AYIu3d4MDn2yZ4sQSLFbvgPFxkoLbNKn
         IGj4YXZEi3E8hVfwdLivskYq8Myo/cdgs8vatFXhuC0BjqnlxTRxBAfvx8iRhK5iUEUW
         3jzhc2FAaw1XAbduRwkUeAkt0X5b2cRO+/zxFARSqrfcrDHbue8mATf06uvW7wP939aI
         m9UaYg2vz/3JOOI1sWQQkfw6VzA9PmllcH8GgEZLnSmpD881jVv62q617PuxtBycK1nH
         Xfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KVuNFb6tXl5tXhzL5sI2Rcy+lAlO28EhGVS14ajJJfU=;
        b=FROP/Yg1VsUCOHty+NFdUDQkm+VF5Luw2Gey8HsKBz0bPlvMOQAbXyiLZFOEPBE8OA
         OFlZi478YukejX2/STbVCjaxgaJWMgzY95ZqN0KPmYhcS9+yTnYEhrt1BZM2pJNAsUwE
         XMent0UG64RfMh0MTHemXitdKhlhqVvcnzvmoh9kydJc+S9dAl+fuYv/TYL/GTvSMNy8
         TIRG05dvvKZiDIfBPXHraEWyJJTFS56YO9/kSNwGz2xW+89JVD3E0LSO1q7nVOUTrr+R
         3a667WjXCx+a55UScZgv/6CsBHoLbEjTxQ/tC6lxZXjMVcgni/qMaq8CMe+/gN2aJqsT
         CJVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530J/HamXFoi/474naGOWjxtRK1s7i4YALhnSkxPnNfOGu9fI/3J
	7fF4F+rQ7qaaZHgxulkKZAo=
X-Google-Smtp-Source: ABdhPJyYMwtKHZFPvcIQL3T81hC5SktnAjDyZKbVQr8YHK2tMVRC//uuSRKt5RFR9NYROKS9JtLWZQ==
X-Received: by 2002:adf:b1d7:: with SMTP id r23mr33856073wra.145.1634536259398;
        Sun, 17 Oct 2021 22:50:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4ed1:: with SMTP id g17ls2268362wmq.1.canary-gmail;
 Sun, 17 Oct 2021 22:50:58 -0700 (PDT)
X-Received: by 2002:a05:600c:378f:: with SMTP id o15mr13910936wmr.63.1634536258493;
        Sun, 17 Oct 2021 22:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634536258; cv=none;
        d=google.com; s=arc-20160816;
        b=NyLaP3n1mu/tq1DjabF/ELIc3UEo2t5bDN6IcskyLYApS2Qw23x9GgPfjad7TuuGg8
         JnGpGQPJOHj9TYUsfegO7cFVx6j+pgqbcwqQEY3Z7pzS2CLMEU+p1L1bIUr4ObfqdmhA
         dva/1nrpQ51Df7AFDRAlHZJkmpq3SFaQKwEkg+vywA2ZXecyOixJRsz04kSihCWQ+a81
         VOegtyFkiToJBpVYDVSRT455+uQakb7aCgsfI4YnAzArYElbspEJCBSztML9yyAai2q9
         Vkwv56OIO0OPOKvcHYUURRqbb7JzCFjRqiUOvnC5V63KLlAe+Sf3VBOWwtdhe5KJOKwZ
         bXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=lvQZhRRL7stXVezupvh7eUiz33cEitMnPPtrrdwHTDY=;
        b=X9q+PG1J5SMFwWsyZMaHGEBLfmh4yQDpeRMAqR8vJ+AQJkCyrVPjO8r+aTSHuhKgfY
         4B6/r+KxxWdcyfVaqJfznvFQJJ4140gt9gUNsDmfiIU8biszx8CxuT6mkRT2lk1TjRNM
         xqDLqj/rv4VxwohKQjZI36qwqlZhis3HDakwGt2ACY+xnlY965uca6eyEA4AYYw09dQ4
         GjqgIqohRfn3gGyiTUVXb+sXon7ydQr77Sl6fFc06JoIzhfSaVheAX0YBOTCHIytFWKC
         3+t7A8hwBnp2J9GtzU7qxfH+WS6dXAEb8lF9hAX7GHD+m5RWDKb1N7gSiyaXrhlAitu/
         utSw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id g2si1522029wmc.4.2021.10.17.22.50.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 22:50:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 19I5ovFW002825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Oct 2021 07:50:57 +0200
Received: from [167.87.73.119] ([167.87.73.119])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 19I5ovkj018186;
	Mon, 18 Oct 2021 07:50:57 +0200
Subject: Re: how to enable real PCIe device with MSI-X on arm64 platform in
 jailhouse none-root cell?
To: Changming Huang <huangcm.huang@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <b4ba42c6-b69b-44c2-895a-944fc30237c0n@googlegroups.com>
 <e282cac2-2939-b868-afef-7b266b251e50@siemens.com>
 <5032fae9-5e5c-4526-a777-94ede22ac17an@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <43b81a76-02f9-204d-059e-03aa53568d2f@siemens.com>
Date: Mon, 18 Oct 2021 07:50:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5032fae9-5e5c-4526-a777-94ede22ac17an@googlegroups.com>
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

T24gMTguMTAuMjEgMDQ6MTMsIENoYW5nbWluZyBIdWFuZyB3cm90ZToNCj4gTVNJLVggdmVjdG9y
cyB0cmFuc2xhdGVzIHRoZSBpbnRlcnJ1cHQgdGhyb3VnaCBpdHMsIHRoZSBHSUMgYW5kIG15DQo+
IG5ldHdvcmsgZGV2aWNlIERUUyBub2RlIGluIHJvb3QgY2VsbDoNCj4gwqAgwqAgwqAgwqAgwqBn
aWM6IGludGVycnVwdC1jb250cm9sbGVyQDYwMDAwMDAgew0KPiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNvbXBhdGlibGU9ICJhcm0sZ2ljLXYzIjsNCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAj
c2l6ZS1jZWxscyA9IDwyPjsNCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByYW5nZXM7DQo+
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnPSA8MHgwIDB4MDYwMDAwMDAgMCAweDEwMDAw
PiwgLyogR0lDIERpc3QgKi8NCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqA8MHgwIDB4MDYwNDAwMDAgMCAweDQwMDAwPjsgLyogR0lDIFJlZGlzdHJpYnV0b3IgKi8NCj4g
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjaW50ZXJydXB0LWNlbGxzPSA8Mz47DQo+IMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LWNvbnRyb2xsZXI7DQo+IMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9IDxHSUNfUFBJIDkgKEdJQ19DUFVfTUFTS19SQVco
MHhmKSB8DQo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgSVJRX1RZUEVfTEVWRUxfTE9XKT47DQo+IMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGl0czogZ2ljLWl0c0A2MDIwMDAwIHsNCj4gwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgY29tcGF0aWJsZSA9ICJhcm0sZ2ljLXYzLWl0cyI7DQo+IMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1zaS1jb250cm9sbGVyOw0KPiDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9IDwweDAgMHgwNjAyMDAw
MCAwIDB4MjAwMDA+Oy8qIEdJQw0KPiBUcmFuc2xhdGVyICovDQo+IMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTsNCj4gwqAgwqAgwqAgwqAgwqB9Ow0KPiANCj4gwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBlbmV0Y19wY2llOiBwY2llQDFmMDAwMDAwMCB7IC8qIEludGVncmF0ZWQgRW5kcG9p
bnQNCj4gUm9vdCBDb21wbGV4ICovDQo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY29tcGF0aWJsZSA9ICJwY2ktaG9zdC1lY2FtLWdlbmVyaWMiOw0KPiDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9IDwweDAxIDB4ZjAwMDAwMDAgMHgwIDB4
MTAwMDAwPjsNCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVz
cy1jZWxscyA9IDwzPjsNCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAj
c2l6ZS1jZWxscyA9IDwyPjsNCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBtc2ktcGFyZW50ID0gPCZpdHM+Ow0KPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGRldmljZV90eXBlID0gInBjaSI7DQo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgYnVzLXJhbmdlID0gPDB4MCAweDA+Ow0KPiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGRtYS1jb2hlcmVudDsNCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBtc2ktbWFwID0gPDAgJml0cyAweDE3IDB4ZT47DQo+IMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLi4uDQo+IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIH0NCj4gDQo+IGFuZCBJIGNvcHkgdGhlbSBhbGwgcmVsYXRlZCBub2RlcyBpbnRvIGNl
bGwgRFRTLg0KPiANCj4gc28sIEkgbmVlZCBtb3JlIGVmZm9ydCBvbiBNU0ktWCBpbiBjZWxsPw0K
DQpUaGlzIGlzIGNvbmNlcHR1YWxseSB0aGUgcmlnaHQgdGhpbmcsIGJ1dCBzb21ldGhpbmcgbXVz
dCBiZSBtaXNzaW5nLg0KDQpJcyB0aGUgSVRTIHJlY29nbml6ZWQgYnkgdGhlIG5vbi1yb290IExp
bnV4IGtlcm5lbD8gSXMgdGhhdCBrZXJuZWwNCmlkZW50aWNhbCB0byB0aGUgcm9vdC1jZWxsIG9u
ZSAoanVzdCB0byBleGNsdWRlIGNvbmZpZ3VyYXRpb24gaXNzdWVzKT8NCkNvbXBhcmUgdGhlIGJv
b3QgbG9ncy4NCg0KSmFuDQoNCi0tIA0KU2llbWVucyBBRywgVCBSREEgSU9UDQpDb3Jwb3JhdGUg
Q29tcGV0ZW5jZSBDZW50ZXIgRW1iZWRkZWQgTGludXgNCg0KLS0gCllvdSByZWNlaXZlZCB0aGlz
IG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMg
IkphaWxob3VzZSIgZ3JvdXAuClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3Rv
cCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8gamFpbGhvdXNlLWRl
dit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tLgpUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBv
biB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91
c2UtZGV2LzQzYjgxYTc2LTAyZjktMjA0ZC0wNTllLTAzYWE1MzU2OGQyZiU0MHNpZW1lbnMuY29t
Lgo=
