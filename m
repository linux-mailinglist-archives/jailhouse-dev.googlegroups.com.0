Return-Path: <jailhouse-dev+bncBCD5HYFFQEERB5WRZP2QKGQEE2F2VEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 821EE1C76BE
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 18:42:31 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id ay22sf796200edb.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 09:42:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588783351; cv=pass;
        d=google.com; s=arc-20160816;
        b=0B9AT8GCStMc7ZpzDupnzB+RrnqgtJ+KZGdOOe64gy/bBcwjjJhJdumNRqWZAFDEss
         U73twgR3igZHGqKDHOgO2Yewl1eCN5Bq8p+md8QjF6PBCiBI58WWoqAaPVCIPLgmPJii
         inOreVhi2JYC4YT1a3kul4Oq/eMbq9eh1Emyip8T8EC2FuMWDaO0CdN7pDPdkZfv/goZ
         fUXX1zVnCi0gajpXC1LOCZF2Hqn8wLN4CpYHknMaixs9c32AfVSzkOKLS0BjrFCmczxk
         4y5pKHRhJTzpmUvLHbigOP4S3Fo2/psip9y8y26HDoG0YrQDOSg6nhDL6YRlnWh/eCbg
         RxBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:mime-version:user-agent
         :date:message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature:dkim-signature;
        bh=rc3jocp9c7/7UYuKlg8P72DWhETSJKDNa/LHqMez6+Y=;
        b=BlLrdMjySTKAoeZERuKjbNXTfjBhWCgPqEaTQ9m+DjI1pUoIwuUkKdPvt3glJ34lxM
         ok/HJb7NNMtxDYmasY/265IValoUlQXyYYd3QIAQT8VVGokvqTbezK0j6FU1kQWquHd3
         Fp7Y3DZKM6+NjC5ebjbcZCsxcjUnSEVVMD4LVrNmpLGA75zadIm9pIatPINkC4ljn16W
         tZE2dyrIdhwJWVbfTPWsakP88zZAFRliDPGK1AUVydh9qsPTWh13BjrxxD/WfpHIHn4d
         KaDljp4Dg2lgC6AXhXD7aMhVGQowM54LM+PHVwFnkpOL6OSyCchYD6kINqREAHJnkYbY
         Qv1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XnGdyvog;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::444 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rc3jocp9c7/7UYuKlg8P72DWhETSJKDNa/LHqMez6+Y=;
        b=UA8NTBR/raUGRYf1+rlgigolJSs/668iOd0JMf5MIkN8uUzPYzQpLK3GiaSfawANnm
         UK/RQ4zKFGRGOmDCRQkylmunc6PlySl9R4uYS4izPO+6Bc54sOwI/PXjTMccL0tuY47A
         k9soahlZ9Oj/Q88oE6/2ZFDFltRDFN6gbb6dbdQZRVaJPc7RXiBXLM8eqOf9i+nTwVf2
         KxikvFhZ8Kr1rQBgExJ0j7olkmWr75nruZJEZk9FL+8ZOREB/50siMOhYDXd4eX+/tjp
         l+oBqyTlx5nk8KEmk1tlgFVnpfPAvy8JBJ/hWrtZzQsaTWpIHU+pzj0Awmf/phRvivAT
         xBpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rc3jocp9c7/7UYuKlg8P72DWhETSJKDNa/LHqMez6+Y=;
        b=sgMU/saI4pKBFLH7XsXfcTww5fbHDHZOAy32s1snKzk1E9/yvd24ZXYyrHQPudmbV8
         5/T7S2gdbkAhtvucY1zsPE+wBg9VOwvaNLVCUonDu7zxiFTBQ0phdbFFgGzuZ3gPsc5p
         yAMG0TxN7PnwajaeWKEe2vjL81fDrNwFGbXvXxDjC6/YIIh0Sal7vAc25npX18NHy2OC
         ktRsOHFdKkzKg+ZkV05Z1lAB5xPFs5odvSWm/jeKRZEkIn6AzwPa7BD7t+8ypXOoXxS8
         2CYHtl6IvD9FQPQxmSxxg9tMN0PUtEyPjxSrnG8MeGTHNNtNG0omvO5VXbBCs//LQNJu
         wy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rc3jocp9c7/7UYuKlg8P72DWhETSJKDNa/LHqMez6+Y=;
        b=tZy+7F9ay2b4g7fAzjQV8AOUsVPBuxFoNdHif6FUhwf4XQNeQ958e7QpR2qPmn4dNd
         1xUKhIQQjtX61Oj5bOz0rjRNsqWA3fUkr3HG4pNicCpfe8W+p8CWNKFee1L5pntcqLAL
         d5rhR9FPPvwknQ8O4fjfPGV9I6+5l5Faj6q3zD/eTq/57pTGVPoL18OhorC9WFCewyGA
         0Ihezm3BaOsHCgJgw46+Qsp/tkA5p+vyqLs58CcTq+uTUesMjPHi9Al7wkUBIV2T0xPf
         mHcXkb+dFua2DZNKIYj/t1e6jdn5Fuyc9hjmjRAwz09TCv/3JFrPccyy/uXAIdrGW+JG
         RpcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Pubk56NTpcoK7hiIEgxGmfwYxrgW/iRmyVZhStGKgUPhgpMEbbH+
	uep0fU/jKvEMXVjfIOUOnpM=
X-Google-Smtp-Source: APiQypLDu8KuTs8FhgyaG8xEUB8IS5KeP7t2GLZll6GEm0DsXsig2MQ8VdHX2z/45hwRJLHAdLkAbg==
X-Received: by 2002:aa7:d342:: with SMTP id m2mr7715669edr.130.1588783351206;
        Wed, 06 May 2020 09:42:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3da:: with SMTP id c26ls1390707eja.7.gmail; Wed, 06
 May 2020 09:42:30 -0700 (PDT)
X-Received: by 2002:a17:906:7c42:: with SMTP id g2mr8465942ejp.328.1588783350462;
        Wed, 06 May 2020 09:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588783350; cv=none;
        d=google.com; s=arc-20160816;
        b=pXE6uEJBss5aEWFfcbloj+hYyjUDXa7tMicB+LMrbjejclRO4rVCpjW6nlqxL5J4JW
         yxMkS5B56phnpFBAINSPhUOvlMBRULDiM9XKF2vm8NSC0ZT057MM1ziD6s7dQSrhuFVN
         PayuZx8hmIRXZroy8/2ZUCsAxgK3tVIgBWzXqJ8W22P0zS2vSkIcy5KHsPdS9JfwPjxV
         xVXU2DK3ZiDZUotn4pTmp/WcmhcT6TsOHq4VH2E0ExzZCtXG4FkG5OxRl4QDXFKymk0r
         i80vFzPo/5+2zEyMy/7zP5fwllM9B+fMpV13izeOb/Rl3Ur3qb5NBvfAFGvlPJjTtBnd
         vT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:autocrypt:from
         :references:to:subject:dkim-signature;
        bh=MkSD/LsgkpY5tM3OWXpEY4wprtXO+kzrwXqI1o/x7Ik=;
        b=NZUlJULyf7fIBLwdqZ9CkK9sDoU7nlHoYITbYJfPmKlW+AJmBJ7gNgcv9mYc2+MVBF
         Yktv8b4M9V8LvPLcjUDW8uXoUlcmpyksrIkNEuG8RLnxOqpiTAiW1NSEoDDoPOwwslfy
         q1G0aQlmBV7zOC95ygfWpHJ7uzq3U8dryRPfGVNWIwQeMC8s9zsfEG3bErrwZKwvb9T8
         7tgPuYdOQS/S0FPYQ/j+MW5NUflchRMl1In4w55Fl7n+hzak6lcGYbmAdypXFNz3SBhE
         jTIB8SxQBFLuS0dd+e5JQlj28FF6ulNkLog+T5xPtU7nf1TB6/s3qCWxQe3S79pkXLoS
         AlRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XnGdyvog;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::444 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com. [2a00:1450:4864:20::444])
        by gmr-mx.google.com with ESMTPS id a3si181652edn.1.2020.05.06.09.42.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::444 as permitted sender) client-ip=2a00:1450:4864:20::444;
Received: by mail-wr1-x444.google.com with SMTP id v12so1678999wrp.12
        for <jailhouse-dev@googlegroups.com>; Wed, 06 May 2020 09:42:30 -0700 (PDT)
X-Received: by 2002:adf:afd9:: with SMTP id y25mr10537087wrd.421.1588783349481;
        Wed, 06 May 2020 09:42:29 -0700 (PDT)
Received: from [192.168.1.109] ([2.234.171.104])
        by smtp.gmail.com with ESMTPSA id d1sm3326780wrx.65.2020.05.06.09.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:42:28 -0700 (PDT)
Subject: Re: [PATCH v2 2/9] hypervisor: implement
 paging_create/destroy_colored
To: Jan Kiszka <jan.kiszka@siemens.com>, Marco Solieri <ms@xt3.it>,
 jailhouse-dev@googlegroups.com
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-3-ms@xt3.it>
 <d492ee67-ee26-3533-5ca6-7c9e3e783abf@siemens.com>
From: Luca Miccio <lucmiccio@gmail.com>
Autocrypt: addr=lucmiccio@gmail.com; keydata=
 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
Message-ID: <2146f95d-2c71-db9d-810a-764f1c68d81d@gmail.com>
Date: Wed, 6 May 2020 18:42:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d492ee67-ee26-3533-5ca6-7c9e3e783abf@siemens.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BAw3E0OnqmmPQWDm669QCYqMJP0tCpk7J"
X-Original-Sender: LucMiccio@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=XnGdyvog;       spf=pass
 (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::444
 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BAw3E0OnqmmPQWDm669QCYqMJP0tCpk7J
Content-Type: multipart/mixed; boundary="CSSeHe7UCk5kjgmW31ptXvU56rSq5yzvU"

--CSSeHe7UCk5kjgmW31ptXvU56rSq5yzvU
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: base64

DQoNCk9uIDUvNC8yMCA4OjMyIFBNLCBKYW4gS2lzemthIHdyb3RlOg0KPiBPbiAyMS4wNC4yMCAx
MjowMywgJ01hcmNvIFNvbGllcmknIHZpYSBKYWlsaG91c2Ugd3JvdGU6DQo+PiBGcm9tOiBMdWNh
IE1pY2NpbyA8bHVjbWljY2lvQGdtYWlsLmNvbT4NCj4+DQo+PiBBZGQgZnVuY3Rpb25zIGZvciBj
b2xvcmVkIHBhZ2UgY3JlYXRpb24gYW5kIGRlc3RydWN0aW9uIGFuZCBpbml0aWFsaXplDQo+PiBj
b2xvcmluZyBvbiB0aGUgcGxhdGZvcm0uDQo+Pg0KPj4gVGhlIHN0b3J5IG9mIHRoZSBsaWZlIG9m
IGEgY29sb3JpbmcgcGFnZSBjYW4gYmUgc3VtbWFyaXplZCBhcyBmb2xsb3dzLg0KPj4NCj4+IDEu
IEJpdHMgaW4gdGhlIGFkZHJlc3MgdGhhdCBhcmUgdXNlZnVsIGZvciBkZWZpbmluZyBjb2xvcnMg
YXJlIGNvbXB1dGVkLA0KPj4gwqDCoMKgIGFuZCB1c2VkIGZvciBhbGwgbWFwcGluZ3MuIFRoZSBw
YWdlIHNpemUgdXNlZCB0byBvYnRhaW4gdGhlIGxvd2VyDQo+PiBsaW1pdA0KPj4gwqDCoMKgIGlz
IGFzc3VtZWQgdG8gYmUgYWxpZ25lZCB3aXRoIHRoZSBgUEFHRV9TSVpFYCBjb25zdGFudCBkZWZh
dWx0aW5nIGF0DQo+PiDCoMKgwqAgNEtpQiwgYW5kIGFsc28gYXMgdGhlIHVuaXQgZm9yIHRoZSBt
YXBwaW5nIG9wZXJhdGlvbiwgZXZlbiB3aGVuDQo+PiDCoMKgwqAgY29uc2VjdXRpdmUgcGFnZXMg
d291bGQgYmUgcG9zc2libGUuDQo+Pg0KPj4gMi4gVGhlIGNvbG9yZWQgcmVnaW9ucyBjYW4gdGhl
biBtYXBwZWQgd2l0aCBhIG5ldyBwYWdpbmcgZnVuY3Rpb24gYW5kDQo+PiDCoMKgwqAgZGVzdHJ1
Y3RlZCB3aXRoIHRoZSBvbGQgb25lLCBiZWNhdXNlIGBwYWdpbmdfZGVzdHJveSpgIGFjdHMgb24N
Cj4+IHZpcnR1YWwNCj4+IMKgwqDCoCBhZGRyZXNzZXMgd2hpbGUgY29sb3JpbmcgaGFwcGVucyBv
biB0aGUgcGh5c2ljYWwgb25lcy4NCj4+IMKgwqDCoCBQYWdpbmdfY3JlYXRlIGhhcyB0byBoYW5k
bGUgdGhlIHJlbWFwIHRvIHJvb3RfY2VsbCB0b28gd2hlbiBlLmcuDQo+PiDCoMKgwqAgZGVzdHJv
eWluZyBjZWxscy4NCj4+DQo+PiAzLiBUaGUgY29sb3JlZCB1bm1hcCBmdW5jdGlvbiBpcyBpbnN0
ZWFkIHVzZWQgb25seSB3aGVuIGRlc3Ryb3lpbmcgdGhlDQo+PiDCoMKgwqAgcm9vdCBjZWxsIG1h
cHBpbmcsIHNpbmNlIHdlIGFzc3VtZSB0aGF0IHRoZSByb290IGNlbGwgdXNlcyBhIDE6MQ0KPj4g
bWFwcGluZw0KPj4gwqDCoMKgIGZvciBtZW1vcnkgcmVnaW9ucy4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBMdWNhIE1pY2NpbyA8bHVjbWljY2lvQGdtYWlsLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6
IE1hcmNvIFNvbGllcmkgPG1zQHh0My5pdD4NCj4+IC0tLQ0KPj4gwqAgaHlwZXJ2aXNvci9pbmNs
dWRlL2phaWxob3VzZS9wYWdpbmcuaCB8wqAgMTEgKysNCj4+IMKgIGh5cGVydmlzb3IvcGFnaW5n
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNTUgKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTY2IGluc2VydGlvbnMoKykN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvaHlwZXJ2aXNvci9pbmNsdWRlL2phaWxob3VzZS9wYWdpbmcu
aA0KPj4gYi9oeXBlcnZpc29yL2luY2x1ZGUvamFpbGhvdXNlL3BhZ2luZy5oDQo+PiBpbmRleCA1
NTEzYzRlYy4uMDMyYTNhMDQgMTAwNjQ0DQo+PiAtLS0gYS9oeXBlcnZpc29yL2luY2x1ZGUvamFp
bGhvdXNlL3BhZ2luZy5oDQo+PiArKysgYi9oeXBlcnZpc29yL2luY2x1ZGUvamFpbGhvdXNlL3Bh
Z2luZy5oDQo+PiBAQCAtMjY3LDYgKzI2NywxNyBAQCBpbnQgcGFnaW5nX2Rlc3Ryb3koY29uc3Qg
c3RydWN0IHBhZ2luZ19zdHJ1Y3R1cmVzDQo+PiAqcGdfc3RydWN0cywNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHZpcnQsIHVuc2lnbmVkIGxvbmcgc2l6ZSwNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHBhZ2luZ19mbGFncyk7DQo+
PiDCoCAraW50IHBhZ2luZ19jcmVhdGVfY29sb3JlZChjb25zdCBzdHJ1Y3QgcGFnaW5nX3N0cnVj
dHVyZXMgKnBnX3N0cnVjdHMsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgbG9uZyBwaHlzLCB1bnNpZ25lZCBsb25nIHNpemUsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdW5zaWduZWQgbG9uZyB2aXJ0LCB1bnNpZ25lZCBsb25nIGFjY2Vzc19mbGFncywN
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHBhZ2luZ19mbGFn
cywNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nICpjb2xvcl9i
aXRtYXNrLCBib29sIGlkZW50aXR5X21hcCk7DQo+PiArDQo+PiAraW50IHBhZ2luZ19kZXN0cm95
X2NvbG9yZWQoY29uc3Qgc3RydWN0IHBhZ2luZ19zdHJ1Y3R1cmVzICpwZ19zdHJ1Y3RzLA0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyB2aXJ0LCB1bnNpZ25l
ZCBsb25nIHNpemUsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBs
b25nIHBhZ2luZ19mbGFncywNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2ln
bmVkIGxvbmcgKmNvbG9yX2JpdG1hc2spOw0KPj4gKw0KPj4gwqAgdm9pZCAqcGFnaW5nX21hcF9k
ZXZpY2UodW5zaWduZWQgbG9uZyBwaHlzLCB1bnNpZ25lZCBsb25nIHNpemUpOw0KPj4gwqAgdm9p
ZCBwYWdpbmdfdW5tYXBfZGV2aWNlKHVuc2lnbmVkIGxvbmcgcGh5cywgdm9pZCAqdmlydCwgdW5z
aWduZWQNCj4+IGxvbmcgc2l6ZSk7DQo+PiDCoCBkaWZmIC0tZ2l0IGEvaHlwZXJ2aXNvci9wYWdp
bmcuYyBiL2h5cGVydmlzb3IvcGFnaW5nLmMNCj4+IGluZGV4IDg3NmYxNTIxLi5lOGY3NDFjMiAx
MDA2NDQNCj4+IC0tLSBhL2h5cGVydmlzb3IvcGFnaW5nLmMNCj4+ICsrKyBiL2h5cGVydmlzb3Iv
cGFnaW5nLmMNCj4+IEBAIC01LDYgKzUsOCBAQA0KPj4gwqDCoCAqDQo+PiDCoMKgICogQXV0aG9y
czoNCj4+IMKgwqAgKsKgIEphbiBLaXN6a2EgPGphbi5raXN6a2FAc2llbWVucy5jb20+DQo+PiAr
ICrCoCBMdWNhIE1pY2NpbyA8bHVjbWljY2lvQGdtYWlsLmNvbT4gKGNhY2hlIGNvbG9yaW5nIHN1
cHBvcnQpDQo+PiArICrCoCBNYXJjbyBTb2xpZXJpIDxtc0B4dDMuaXQ+IChjYWNoZSBjb2xvcmlu
ZyBzdXBwb3J0KQ0KPj4gwqDCoCAqDQo+PiDCoMKgICogVGhpcyB3b3JrIGlzIGxpY2Vuc2VkIHVu
ZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgdmVyc2lvbiAyLsKgDQo+PiBTZWUNCj4+IMKg
wqAgKiB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5Lg0KPj4gQEAg
LTE0LDYgKzE2LDcgQEANCj4+IMKgICNpbmNsdWRlIDxqYWlsaG91c2UvcHJpbnRrLmg+DQo+PiDC
oCAjaW5jbHVkZSA8amFpbGhvdXNlL3N0cmluZy5oPg0KPj4gwqAgI2luY2x1ZGUgPGphaWxob3Vz
ZS9jb250cm9sLmg+DQo+PiArI2luY2x1ZGUgPGphaWxob3VzZS9jb2xvcmluZy5oPg0KPj4gwqAg
wqAgI2RlZmluZSBCSVRTX1BFUl9QQUdFwqDCoMKgwqDCoMKgwqAgKFBBR0VfU0laRSAqIDgpDQo+
PiDCoCBAQCAtNDM4LDYgKzQ0MSwxNTMgQEAgaW50IHBhZ2luZ19kZXN0cm95KGNvbnN0IHN0cnVj
dA0KPj4gcGFnaW5nX3N0cnVjdHVyZXMgKnBnX3N0cnVjdHMsDQo+PiDCoMKgwqDCoMKgIHJldHVy
biAwOw0KPj4gwqAgfQ0KPj4gwqAgKy8qKg0KPj4gKyAqIENyZWF0ZSBvciBtb2RpZnkgYSBjb2xv
cmVkIHBhZ2UgbWFwLg0KPj4gKyAqIEBwYXJhbSBwZ19zdHJ1Y3RzwqDCoMKgIERlc2NyaXB0b3Ig
b2YgcGFnaW5nIHN0cnVjdHVyZXMgdG8gYmUgdXNlZC4NCj4+ICsgKiBAcGFyYW0gcGh5c8KgwqDC
oMKgwqDCoMKgIFBoeXNpY2FsIGFkZHJlc3Mgb2YgdGhlIHJlZ2lvbiB0byBiZSBtYXBwZWQuDQo+
PiArICogQHBhcmFtIHNpemXCoMKgwqDCoMKgwqDCoCBTaXplIG9mIHRoZSByZWdpb24uDQo+PiAr
ICogQHBhcmFtIHZpcnTCoMKgwqDCoMKgwqDCoCBWaXJ0dWFsIGFkZHJlc3MgdGhlIHJlZ2lvbiBz
aG91bGQgYmUgbWFwcGVkIHRvLg0KPj4gKyAqIEBwYXJhbSBhY2Nlc3NfZmxhZ3PCoMKgwqAgRmxh
Z3MgZGVzY3JpYmluZyB0aGUgcGVybWl0dGVkIHBhZ2UgYWNjZXNzLA0KPj4gc2VlDQo+PiArICog
QHJlZiBQQUdFX0FDQ0VTU19GTEFHUy4NCj4+ICsgKiBAcGFyYW0gY29sb3JfYml0bWFza8KgwqDC
oCBCaXRtYXNrIHNwZWNpZnlpbmcgdmFsdWUgb2YgY29sb3JpbmcuDQo+PiArICogQHBhcmFtIGlk
ZW50aXR5X21hcMKgwqDCoCBJZiB0cnVlIHRoZSBtYXBwaW5nIHdpbGwgYmUgMToxLg0KPj4gKyAq
DQo+PiArICogQHJldHVybiAwIG9uIHN1Y2Nlc3MsIG5lZ2F0aXZlIGVycm9yIGNvZGUgb3RoZXJ3
aXNlLg0KPj4gKyAqDQo+PiArICogQG5vdGUgVGhlIGZ1bmN0aW9uIHVzZXMgb25seSA0IEtpQiBw
YWdlIHNpemUgZm9yIG1hcHBpbmcuDQo+PiArICoNCj4+ICsgKiBAc2VlIHBhZ2luZ19kZXN0cm95
X2NvbG9yZWQNCj4+ICsgKiBAc2VlIHBhZ2luZ19nZXRfZ3Vlc3RfcGFnZXMNCj4+ICsgKi8NCj4+
ICtpbnQgcGFnaW5nX2NyZWF0ZV9jb2xvcmVkKGNvbnN0IHN0cnVjdCBwYWdpbmdfc3RydWN0dXJl
cyAqcGdfc3RydWN0cywNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBs
b25nIHBoeXMsIHVuc2lnbmVkIGxvbmcgc2l6ZSwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB1bnNpZ25lZCBsb25nIHZpcnQsIHVuc2lnbmVkIGxvbmcgYWNjZXNzX2ZsYWdzLA0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgcGFnaW5nX2ZsYWdzLA0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgKmNvbG9yX2JpdG1h
c2ssIGJvb2wgaWRlbnRpdHlfbWFwKQ0KPj4gK3sNCj4+ICsNCj4+ICvCoMKgwqAgcGh5cyAmPSBQ
QUdFX01BU0s7DQo+PiArwqDCoMKgIHZpcnQgJj0gUEFHRV9NQVNLOw0KPj4gK8KgwqDCoCBzaXpl
ID0gUEFHRV9BTElHTihzaXplKTsNCj4+ICsNCj4+ICvCoMKgwqAgd2hpbGUgKHNpemUgPiAwKSB7
DQo+PiArwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IHBhZ2luZyAqcGFnaW5nID0gcGdfc3Ry
dWN0cy0+cm9vdF9wYWdpbmc7DQo+PiArwqDCoMKgwqDCoMKgwqAgcGFnZV90YWJsZV90IHB0ID0g
cGdfc3RydWN0cy0+cm9vdF90YWJsZTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBwdF9lbnRyeV90IHB0
ZTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpbnQgZXJyOw0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKg
IHBoeXMgPSBuZXh0X2NvbG9yZWQocGh5cywgY29sb3JfYml0bWFzayk7DQo+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKGlkZW50aXR5X21hcCkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZpcnQg
PSBwaHlzOw0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgIHdoaWxlICgxKSB7DQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwdGUgPSBwYWdpbmctPmdldF9lbnRyeShwdCwgdmlydCk7DQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocGFnaW5nLT5wYWdlX3NpemUgPT0gUEFHRV9TSVpF
KSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhZ2luZy0+c2V0X3Rlcm1p
bmFsKHB0ZSwgcGh5cywgYWNjZXNzX2ZsYWdzKTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZmx1c2hfcHRfZW50cnkocHRlLCBwYWdpbmdfZmxhZ3MpOw0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH0NCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIExvb3AgdW50aWwgNEsgcGFnZSBzaXpl
IGJ5IHNwbGl0dGluZyBodWdlcGFnZXMgKi8NCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChwYWdpbmctPmVudHJ5X3ZhbGlkKHB0ZSwgUEFHRV9QUkVTRU5UX0ZMQUdTKSkgew0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBzcGxpdF9odWdlcGFnZShwZ19zdHJ1
Y3RzLT5odl9wYWdpbmcsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHBhZ2luZywgcHRlLCB2aXJ0LA0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYWdpbmdfZmxhZ3MpOw0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZXJyKQ0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBlcnI7DQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB0ID0gcGFnaW5nX3BoeXMyaHZpcnQoDQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnaW5nLT5nZXRfbmV4dF9wdChwdGUp
KTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7DQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHB0ID0gcGFnZV9hbGxvYygmbWVtX3Bvb2wsIDEpOw0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXB0KQ0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOw0KPj4gKw0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYWdpbmctPnNldF9uZXh0X3B0KHB0ZSwgcGFnaW5n
X2h2aXJ0MnBoeXMocHQpKTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmx1
c2hfcHRfZW50cnkocHRlLCBwYWdpbmdfZmxhZ3MpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnaW5nKys7DQo+PiArwqDCoMKgwqDC
oMKgwqAgfQ0KPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChwZ19zdHJ1Y3RzID09ICZodl9wYWdpbmdf
c3RydWN0cykNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFyY2hfcGFnaW5nX2ZsdXNoX3Bh
Z2VfdGxicyh2aXJ0KTsNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoCBwaHlzICs9IHBhZ2luZy0+
cGFnZV9zaXplOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHZpcnQgKz0gcGFnaW5nLT5wYWdlX3NpemU7
DQo+PiArwqDCoMKgwqDCoMKgwqAgc2l6ZSAtPSBwYWdpbmctPnBhZ2Vfc2l6ZTsNCj4+ICvCoMKg
wqAgfQ0KPj4gK8KgwqDCoCByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+IA0KPiBJc24ndCBwYWdp
bmdfY3JlYXRlKC4uLikgdGhlIHNhbWUgYXMNCj4gcGFnaW5nX2NyZWF0ZV9jb2xvcmVkKC4uLiwg
Y29sb3JfYml0bWFzaz1mdWxsLCBpZGVudGl0eV9tYXA9ZG9udC1jYXJlKT8NCj4gU2FtZSBmb3Jl
IHBhZ2luZ19kZXN0cm95LiBUaGlzIGR1cGxpY2F0aW9uIG9mIGhpZ2hseSBzZW5zaXRpdmUgY29k
ZSBtdXN0DQo+IGJlIGF2b2lkZWQuDQo+IA0KDQpBY3R1YWxseSBwYWdpbmdfY3JlYXRlX2NvbG9y
ZWQgZm9yY2VzIHRoZSB1c2FnZSBvZiBQQUdFX1NJWkUNCmdyYW51bGFyaXR5LiBDb25zaWRlcmlu
ZyB0aGF0IG5leHRfY29sb3JlZCBjYW4gYmUgImJ5cGFzc2VkIiBpZiB3ZSB1c2UgMA0KZm9yIGNv
bG9yX2JpdG1hc2ssIHdlIGNhbiBjaG9vc2UgYmV0d2VlbiBwYXNzaW5nIDAgb3IgZnVsbCBhcw0K
Y29sb3JfYml0bWFzayBpZiB3ZSB3YW50IHRvIGF2b2lkIGV4ZWN1dGluZyB1bm5lY2Vzc2FyeSBj
b2RlLiBTbyBJIHRoaW5rDQp0aGF0IHBhZ2luZ19jcmVhdGUgc2hvdWxkIGJlIHRoZSBzYW1lIGFz
IHBhZ2luZ19jcmVhdGVfY29sb3JlZCguLi4sDQpjb2xvcl9iaXRtYXNrPVswfGZ1bGxdLCBpZGVu
dGl0eV9tYXA9ZG9udC1jYXJlKSBvbmx5IGlmIFBBR0lOR19IVUdFIGlzDQpub3Qgc2V0IGluIHBh
Z2luZ19mbGFncy4gQW0gSSByaWdodD8NCklmIHNvLCBJIHRoaW5rIHRoYXQgd2UgY2FuIGludGVn
cmF0ZSB0aGUgY29sb3JpbmcgcGFydCBpbnRvDQpwYWdpbmdfY3JlYXRlIGlmIGl0J3Mgb2sgZm9y
IHlvdS4gVGhpcywgb2YgY291cnNlLCB3aWxsIHJlcXVpcmUNCm1vZGlmeWluZyBhbGwgaXRzIG9j
Y3VycmVuY2VzLg0KDQpPbiB0aGUgb3RoZXIgaGFuZCBwYWdpbmdfZGVzdHJveV9jb2xvcmVkIGRv
ZXMgbm90IHNlZW0gdG8gYmUgdGhlIHNhbWUgYXMNCnRoZSBub24tY29sb3JlZCB2ZXJzaW9uLiBB
cyBJIHNhaWQgd2UgbmVlZCB0byB1c2UgUEFHRV9TSVpFIGdyYW51bGFyaXR5DQpidXQgbG9va2lu
ZyBhdCBwYWdpbmdfZGVzdHJveSwgaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgaXQgY2hlY2tz
IG9ubHkNCmlmIHRoZSBzaXplIHRvIHVuYW1wIGZ1bGx5IGNvdmVycyB0aGUgaHVnZXBhZ2UuIFNv
IEkgdGhpbmsgdGhhdCBpZiB3ZQ0KdHJ5IHRvIHVubWFwIGEgY29sb3JlZCByZWdpb24gYmlnZ2Vy
IHRoYW4gMiBNaUIgKHBhZ2UgZW50cnkgc2l6ZSBhZnRlcg0KUEFHRV9TSVpFIGlmIHRoZSBsYXR0
ZXIgaXMgNEtpQiksIHRoZSBmdW5jdGlvbiB3aWxsIG5vdCBzcGxpdCB0aGUNCmh1Z2VwYWdlLiBD
b3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcuDQoNCg0KVGhhbmtzLA0KTHVjYQ0KPj4gKy8qKg0KPj4g
KyAqIERlc3Ryb3kgYSBjb2xvcmVkIHBhZ2UgbWFwLg0KPj4gKyAqIEBwYXJhbSBwZ19zdHJ1Y3Rz
wqDCoMKgIERlc2NyaXB0b3Igb2YgcGFnaW5nIHN0cnVjdHVyZXMgdG8gYmUgdXNlZC4NCj4+ICsg
KiBAcGFyYW0gdmlydMKgwqDCoMKgwqDCoMKgIFZpcnR1YWwgYWRkcmVzcyB0aGUgcmVnaW9uIHRv
IGJlIHVubWFwcGVkLg0KPj4gKyAqIEBwYXJhbSBzaXplwqDCoMKgwqDCoMKgwqAgU2l6ZSBvZiB0
aGUgcmVnaW9uLg0KPj4gKyAqIEBwYXJhbSBwYWdpbmdfZmxhZ3PCoMKgwqAgRmxhZ3MgZGVzY3Jp
YmluZyB0aGUgcGFnaW5nIG1vZGUsIHNlZSBAcmVmDQo+PiBQQUdJTkdfRkxBR1MuDQo+PiArICog
QHBhcmFtIGNvbG9yX2JpdG1hc2vCoMKgwqAgQml0bWFzayBzcGVjaWZ5aW5nIHZhbHVlIG9mIGNv
bG9yaW5nLg0KPj4gKyAqDQo+PiArICogQHJldHVybiAwIG9uIHN1Y2Nlc3MsIG5lZ2F0aXZlIGVy
cm9yIGNvZGUgb3RoZXJ3aXNlLg0KPj4gKyAqDQo+PiArICogQHNlZSBwYWdpbmdfY3JlYXRlX2Nv
bG9yZWQNCj4+ICsgKi8NCj4+ICtpbnQgcGFnaW5nX2Rlc3Ryb3lfY29sb3JlZChjb25zdCBzdHJ1
Y3QgcGFnaW5nX3N0cnVjdHVyZXMgKnBnX3N0cnVjdHMsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHZpcnQsIHVuc2lnbmVkIGxvbmcgc2l6ZSwNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgcGFnaW5nX2ZsYWdzLA0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyAqY29sb3JfYml0
bWFzaykNCj4+ICt7DQo+PiArwqDCoMKgIHNpemUgPSBQQUdFX0FMSUdOKHNpemUpOw0KPj4gKw0K
Pj4gK8KgwqDCoCB3aGlsZSAoc2l6ZSA+IDApIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBjb25zdCBz
dHJ1Y3QgcGFnaW5nICpwYWdpbmcgPSBwZ19zdHJ1Y3RzLT5yb290X3BhZ2luZzsNCj4+ICvCoMKg
wqDCoMKgwqDCoCBwYWdlX3RhYmxlX3QgcHRbTUFYX1BBR0VfVEFCTEVfTEVWRUxTXTsNCj4+ICvC
oMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHBhZ2Vfc2l6ZTsNCj4+ICvCoMKgwqDCoMKgwqDC
oCBwdF9lbnRyeV90IHB0ZTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpbnQgbiA9IDA7DQo+PiArwqDC
oMKgwqDCoMKgwqAgaW50IGVycjsNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoCB2aXJ0ID0gbmV4
dF9jb2xvcmVkKHZpcnQsIGNvbG9yX2JpdG1hc2spOw0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKg
IC8qIHdhbGsgZG93biB0aGUgcGFnZSB0YWJsZSwgc2F2aW5nIGludGVybWVkaWF0ZSB0YWJsZXMg
Ki8NCj4+ICvCoMKgwqDCoMKgwqDCoCBwdFswXSA9IHBnX3N0cnVjdHMtPnJvb3RfdGFibGU7DQo+
PiArwqDCoMKgwqDCoMKgwqAgd2hpbGUgKDEpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHB0ZSA9IHBhZ2luZy0+Z2V0X2VudHJ5KHB0W25dLCB2aXJ0KTsNCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICghcGFnaW5nLT5lbnRyeV92YWxpZChwdGUsIFBBR0VfUFJFU0VOVF9GTEFH
UykpDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKHBhZ2luZy0+Z2V0X3BoeXMocHRlLCB2aXJ0KSAhPSBJTlZB
TElEX1BIWVNfQUREUikgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
cGFnaW5nLT5wYWdlX3NpemUgPT0gUEFHRV9TSVpFKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlcnIgPSBzcGxpdF9odWdlcGFnZShwZ19zdHJ1Y3RzLT5odl9wYWdpbmcsDQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcGFnaW5nLCBwdGUsIHZpcnQsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnaW5nX2ZsYWdzKTsNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVycikNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHRbKytuXSA9IHBhZ2luZ19waHlzMmh2aXJ0
KHBhZ2luZy0+Z2V0X25leHRfcHQocHRlKSk7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBw
YWdpbmcrKzsNCj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+PiArwqDCoMKgwqDCoMKgwqAgLyogYWR2
YW5jZSBieSBwYWdlIHNpemUgb2YgY3VycmVudCBsZXZlbCBwYWdpbmcgKi8NCj4+ICvCoMKgwqDC
oMKgwqDCoCBwYWdlX3NpemUgPSBwYWdpbmctPnBhZ2Vfc2l6ZSA/IHBhZ2luZy0+cGFnZV9zaXpl
IDogUEFHRV9TSVpFOw0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgIC8qIHdhbGsgdXAgYWdhaW4s
IGNsZWFyaW5nIGVudHJpZXMsIHJlbGVhc2luZyBlbXB0eSB0YWJsZXMgKi8NCj4+ICvCoMKgwqDC
oMKgwqDCoCB3aGlsZSAoMSkgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnaW5nLT5j
bGVhcl9lbnRyeShwdGUpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmx1c2hfcHRfZW50
cnkocHRlLCBwYWdpbmdfZmxhZ3MpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG4g
PT0gMCB8fCAhcGFnaW5nLT5wYWdlX3RhYmxlX2VtcHR5KHB0W25dKSkNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBw
YWdlX2ZyZWUoJm1lbV9wb29sLCBwdFtuXSwgMSk7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwYWdpbmctLTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB0ZSA9IHBhZ2luZy0+Z2V0
X2VudHJ5KHB0Wy0tbl0sIHZpcnQpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAocGdfc3RydWN0cyA9PSAmaHZfcGFnaW5nX3N0cnVjdHMpDQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBhcmNoX3BhZ2luZ19mbHVzaF9wYWdlX3RsYnModmlydCk7DQo+PiAr
DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHBhZ2Vfc2l6ZSA+IHNpemUpDQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqDCoMKgwqDCoCB2aXJ0ICs9IHBhZ2Vfc2l6
ZTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBzaXplIC09IHBhZ2Vfc2l6ZTsNCj4+ICvCoMKgwqAgfQ0K
Pj4gK8KgwqDCoCByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiDCoCBzdGF0aWMgdW5zaWduZWQg
bG9uZw0KPj4gwqAgcGFnaW5nX2d2aXJ0MmdwaHlzKGNvbnN0IHN0cnVjdCBndWVzdF9wYWdpbmdf
c3RydWN0dXJlcyAqcGdfc3RydWN0cywNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNp
Z25lZCBsb25nIGd2aXJ0LCB1bnNpZ25lZCBsb25nIHRtcF9wYWdlLA0KPj4gQEAgLTcwMiw2ICs4
NTIsMTEgQEAgaW50IHBhZ2luZ19pbml0KHZvaWQpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gZXJyOw0KPj4gwqDCoMKgwqDCoCB9DQo+PiDCoCArwqDCoMKgIC8qIFNldHVw
IGNvbG9yaW5nICovDQo+PiArwqDCoMKgIGlmDQo+PiAoY29sb3JpbmdfcGFnaW5nX2luaXQoc3lz
dGVtX2NvbmZpZy0+cGxhdGZvcm1faW5mby5sbGNfd2F5X3NpemUpKSB7DQo+IA0KPiBGb2xkIHRo
ZSBzZXR1cCBpbiBoZXJlLCBpdCBkb2Vzbid0IGxvb2sgYXJjaC1zcGVjaWZpYyB0byBtZS4gU29t
ZSBvZiBpdHMNCj4gcGFyYW1ldGVycyBtYXkgYmUsIGJ1dCB0aGF0IGNhbiBiZSBoYW5kbGVkIHZp
YSBhcmNoIGluY2x1ZGVzLg0KPiANCj4+ICvCoMKgwqDCoMKgwqDCoCBwcmludGsoIkVycm9yOiBV
bmFibGUgdG8gaW5pdCBjYWNoZSBjb2xvcmluZyBkYXRhXG4iKTsNCj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gLUVOT01FTTsNCj4+ICvCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsN
Cj4+IMKgIH0NCj4+IMKgDQo+IA0KPiBKYW4NCj4gDQoNCi0tIApZb3UgcmVjZWl2ZWQgdGhpcyBt
ZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBHb29nbGUgR3JvdXBzICJK
YWlsaG91c2UiIGdyb3VwLgpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3Ag
cmVjZWl2aW5nIGVtYWlscyBmcm9tIGl0LCBzZW5kIGFuIGVtYWlsIHRvIGphaWxob3VzZS1kZXYr
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbS4KVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24g
dGhlIHdlYiB2aXNpdCBodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNl
LWRldi8yMTQ2Zjk1ZC0yYzcxLWRiOWQtODEwYS03NjRmMWM2OGQ4MWQlNDBnbWFpbC5jb20uCg==
--CSSeHe7UCk5kjgmW31ptXvU56rSq5yzvU--

--BAw3E0OnqmmPQWDm669QCYqMJP0tCpk7J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+VQtGnhP9TTQ2NnBI/rjb1Ch6KsFAl6y6PMACgkQI/rjb1Ch
6Kukbg//ZzNlRMDcamlRT2RFuvOnVo5rmY9OJXe6FCfzIx6PXeRiOYfymvgioIt0
WNeIbkKxAVymvxUhSK/GJyHBDEu2PQj9wP91LcZZhCCJlk5pdOKuhN6vMCME+CIW
UW/QG853mWKA60axzyxdXbqDhA7kxhWs1Hg9Wj17TKL31EGA/ZQhmxoMWlqIgCBK
+swdD3uAag9sUlpwQMGkHVzpIMrXWnCfvx0azQO9XbS7jN87Au/rNU3ZCeLbKvrg
p0SRQVjg3XuwNCWsGyiy1mLCrUdYBWMPpM3g8moKFLEGP/64L6FzIaYoHMOYSNNA
ddFgPkgG/mMknwNEg3cR5x2UITmG/J/iGpApWTf+nOxcWZenrzuykr3pAKpG7GD+
ivelboerZtXVADEVdgLgQ17vmZpgfuwVN/LMVRN42S1TRPu2jxiqAX3pktkU6sIQ
4rxOX1S/9OoKGEoZ/zZIZbiHJS/4ginGiB8DdeajNpfETDEwbQOm1r6TB7yBBgQ9
NWEGn9LTN+SKxHyFwWwBBqKU8QcfBdR0qUrri0OtNB/CDb+jqX+dZ0kqo1NA/Irb
HP/aKRLsKp3Vb9Q2aEOE0fNuB14TI51wbTgmI0ZL4Xt+EZ3e8+FjTDfHDWKU50FS
Z0F95lD6GifTlExqJWMd3qHpKrvGIX1tSLpxMENgCW7zCQt0VhY=
=eM6z
-----END PGP SIGNATURE-----

--BAw3E0OnqmmPQWDm669QCYqMJP0tCpk7J--
