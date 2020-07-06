Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBCF3RT4AKGQEF3VUTLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63b.google.com (mail-ej1-x63b.google.com [IPv6:2a00:1450:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC14215792
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jul 2020 14:48:09 +0200 (CEST)
Received: by mail-ej1-x63b.google.com with SMTP id lg24sf35089369ejb.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jul 2020 05:48:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594039689; cv=pass;
        d=google.com; s=arc-20160816;
        b=UgmUC0AlsmcJE7tcVL28F/IwKhJIH0KlmuLe4hDwpV/juCxnT+/qYxo3mnYR9aO0cv
         BWhD2iG+5CMseT9rUCBTpmezKiCYOzDO9a/JPbVfC808itqzZ1XJAAmlPdLO9UnMviUN
         sbMVekCdJgWtNYvxR+685w6Hh2274ZB5Ee5mHUpC5xmjZmMdhrX6fG6z1AXHd2VEShtp
         d/E8i2MXehJKldIbns6nB+5HQ3A1XJqLcMn0Qly3XTJrGbo2dBVkPoTq5hcYYzogTDUf
         /BK1oIDtIOCEF0vZzomOzxb8m09pXQ7n/rrie/IsYZAA5AEEnSTaamvX2aYr3UIhUMXV
         gOXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=UMe4qIeA4qcf73he57Ujk95mk4H0LA+F97jufBMWGBo=;
        b=OenoiJY9RxD7KdDuGqQ42dZzPb04lUFusCEhnYuXLfA+fR5sW6j0PlaUpYi+KB+bEV
         GPL9mLgW+N2HB3XEIOkpS4DElHOVXWCGOuieHr/eHn5j4+chaR6NVImQs8MCSmWSyeXj
         s3beMpbyGUVdSUzc3acyF2uZmE3DYmd2g3LKQkpjSU47IaQ7+ydbc3t+qEzgzCqY8vxS
         zvqmvrh6znnuOrbmVMhGtguPlkQOOV0oZMzzN0zfjOo2vlZjYmDeOASXum9f7f+z8v3C
         0gF6KLvzxPRXtJyFjeiRnDKBqyV2eyqBug02ImAZTfMgjesXOoIwb23IJvQqUwh3zjz/
         jQBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=hicnxEVS;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UMe4qIeA4qcf73he57Ujk95mk4H0LA+F97jufBMWGBo=;
        b=p2YowAkeLrhczF4TwuAybJrW9/U/60b6rhANDWRgoysGT2eEwUNnJI3m0wRUbTFE7r
         F0ChTyRqZcNWdXUSychbrLHy1XF3PNtQGy5+ImTpf5uCl5Df2TMOd5t6VWujsrUHNMM2
         nHRXLLIOh7FemNAXRS5Wb7FvJaNghtYuXxN62e9UvGdNFpvWJQGn543Xit7oheojkmob
         YT2kX+05Sq27TNfSlCdULaswc9ZomqZI/TKS8dW8hSBBBuNnkczsKZp5WTjSUEYToVcL
         Ol+8Lc0b/u2rhT+vyQ4qmZZGIgfMYF60R53xbKcbusKLbHrNmJW3H420pvlIHbGM+1u4
         WxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UMe4qIeA4qcf73he57Ujk95mk4H0LA+F97jufBMWGBo=;
        b=Wx85zjEhi/ABfYelpgU0iC5yFRyds23869cmrroAGGShu8zuM4La6XUfogfuks9Uw+
         4xD4eHhD39yxZMH00oeOZspsHWSvJhbly1TFGUxtxEUW/+g/VZipEONWXS2f3Z+wSryk
         Yje5vo8L+VRYqUwBbdStUkrk1wEewJyWr5pI+oBuA6u9bLvrSgQZvRcQKZk6haPl7tfU
         v9NzvQhYzBxw3JFCzdiL8ko8E20RqdTI8VWiTkF4Hb7NCrRNQrmg796p2CxOhTawh4aY
         a0FjXR0oyLaRIJO0wKQgYd9cdNmnx9raEk1KojUZA/iJe4mDw6WzgXiOpWHdX9CWlh8G
         Y0Sw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532q3SWLp8UncFjiPJJUgYkcpjPbf6Ig7AQUEtL9e7W0bOMakQgX
	geUWgcY4v/f2C+WiDKDF86Q=
X-Google-Smtp-Source: ABdhPJw+/CqGZBiT+tC5oXf8vjWrcZbl5BnAWlpUB+5lfE0bTnI0YAp9nElefk/CvW7SxylpxdJRuA==
X-Received: by 2002:a50:a661:: with SMTP id d88mr56108452edc.34.1594039688942;
        Mon, 06 Jul 2020 05:48:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:9147:: with SMTP id y7ls3216502ejw.6.gmail; Mon, 06
 Jul 2020 05:48:08 -0700 (PDT)
X-Received: by 2002:a17:906:328d:: with SMTP id 13mr43868064ejw.71.1594039688138;
        Mon, 06 Jul 2020 05:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594039688; cv=none;
        d=google.com; s=arc-20160816;
        b=DDEQPhPFjfRQUo1nNa7j0yqIbLYJ+DNunKEPrCNYuBHESdRhJLmDCF1m9Hy3JPN38e
         32kj9E3Hk5GCz8vnu0fwsAFYPtrkfiFgdYbHsTxnJsYRKVYiYiS44DZWwStSyVSD1UhT
         QRu7Fd7vgFJ0eipCBdkM+dJWZRHH14z0M3MYPXGjNZUGI1i1T4p+rcEHdFdRlTWlTpx0
         eE1OdE7pYNfrkxBoHhWpaQWDePcBj0St8+1aoEr/V7yRHqYmJf4xjIVEYGTRKxXSQGXp
         gC6Bafmkg/HUnUzFAS+XNPXar/utnbFGRLklsEpzShF4Eh+T7MNj2oFRKvAf37JbkYJz
         oyRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=+lhXrE0swm4MRPhiqyq8wR6OJJnrrvIZZaboHtIIgK0=;
        b=pXqy2+Ub7ZY5XHVlZoW4a6Ya1XwYJKLiExgzz2l3P+8U74gmyanZlngl5j2YlRRTVY
         ltkPIQlXFcJUBM2bQ6Ap116+3AhowhYNbQQb+097aRlyqJ5IXJpQl1vxJmT5UeG73c76
         VBY74w84wgNGzyKWWsi7I6nbUS+4vi33ecnAwDObumGc9IJc/BfrPLpkSqRz+RylbQhH
         Of7Og3FgrijPtJUxaBsMncS0AP2NrVPN3ohuFxCgMb3PKvrkinf9Rlw0E+PVNROh0PhP
         vOJKgTPGO1PCA1c7ktjJezJl6NKQ0ibhGXUvMqmDDkXTl40/w6UJBHzWX188F/lDfIoG
         i7Zg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=hicnxEVS;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id k4si924822edl.4.2020.07.06.05.48.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2020 05:48:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4B0ljM4P9mzxpg;
	Mon,  6 Jul 2020 14:48:07 +0200 (CEST)
Received: from [IPv6:2003:e9:af0c:8700:e9d:92ff:fe75:492b]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 6 Jul 2020
 14:48:07 +0200
Subject: Re: [PATCH 01/11] pyjailhouse: config_parser: store binary format
 specification in struct.Struct
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
 <6229c648-1b9e-19ed-95b0-6a5fd55e12e9@siemens.com>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <80694781-86c2-3b6f-2adb-248279f1828d@st.oth-regensburg.de>
Date: Mon, 6 Jul 2020 14:48:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6229c648-1b9e-19ed-95b0-6a5fd55e12e9@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=hicnxEVS;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

SGVsbG8gSmFuLA0KDQp0aGFua3MgZm9yIHJldmlld2luZy4gSSB3aWxsIGFkZHJlc3MgdGhlIHJl
cGxpZXMgc2hvcnRseS4NCg0KT24gMzAvMDYvMjAyMCAyMToxMiwgSmFuIEtpc3prYSB3cm90ZToN
Cj4gT24gMzAuMDYuMjAgMDg6NDIsIEFuZHJlaiBVdHogd3JvdGU6DQo+PiBJbXByb3ZlcyBpdHMg
aGFuZGxpbmcgaW4gdGhlIGNvZGUgYW5kIHNsaWdodGx5IGluY3JlYXNlcyB0aGUgb3ZlcmFsbA0K
Pj4gcGVyZm9ybWFuY2UgYXMgd2VsbC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWogVXR6
IDxhbmRyZWoudXR6QHN0Lm90aC1yZWdlbnNidXJnLmRlPg0KPj4gLS0tDQo+PiDCoCBweWphaWxo
b3VzZS9jb25maWdfcGFyc2VyLnB5IHwgNTEgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRp
b25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3B5amFpbGhvdXNlL2NvbmZpZ19wYXJzZXIucHkg
Yi9weWphaWxob3VzZS9jb25maWdfcGFyc2VyLnB5DQo+PiBpbmRleCA2YjlkOTA2Ni4uYjc1Yjkz
MTIgMTAwNjQ0DQo+PiAtLS0gYS9weWphaWxob3VzZS9jb25maWdfcGFyc2VyLnB5DQo+PiArKysg
Yi9weWphaWxob3VzZS9jb25maWdfcGFyc2VyLnB5DQo+PiBAQCAtNTIsMTUgKzUyLDEzIEBAIGNs
YXNzIEpBSUxIT1VTRV9NRU0oRXh0ZW5kZWRFbnVtLCBpbnQpOg0KPj4gwqAgY2xhc3MgTWVtUmVn
aW9uOg0KPj4gLcKgwqDCoCBfUkVHSU9OX0ZPUk1BVCA9ICdRUVFRJw0KPj4gLcKgwqDCoCBTSVpF
ID0gc3RydWN0LmNhbGNzaXplKF9SRUdJT05fRk9STUFUKQ0KPj4gK8KgwqDCoCBfQklOX0ZNVCA9
IHN0cnVjdC5TdHJ1Y3QoJ1FRUVEnKQ0KPj4gwqDCoMKgwqDCoCBkZWYgX19pbml0X18oc2VsZiwg
cmVnaW9uX3N0cnVjdCk6DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgKHNlbGYucGh5c19zdGFydCwN
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYudmlydF9zdGFydCwNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHNlbGYuc2l6ZSwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgIHNlbGYuZmxhZ3MpID0g
XA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0LnVucGFja19mcm9tKE1lbVJlZ2lv
bi5fUkVHSU9OX0ZPUk1BVCwgcmVnaW9uX3N0cnVjdCkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgIHNl
bGYuZmxhZ3MpID0gc2VsZi5fQklOX0ZNVC51bnBhY2tfZnJvbShyZWdpb25fc3RydWN0KQ0KPj4g
wqDCoMKgwqDCoCBkZWYgX19zdHJfXyhzZWxmKToNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gKCLCoCBwaHlzX3N0YXJ0OiAweCUwMTZ4XG4iICUgc2VsZi5waHlzX3N0YXJ0KSArIFwNCj4+
IEBAIC0xMDYsMzcgKzEwNCwzMiBAQCBjbGFzcyBNZW1SZWdpb246DQo+PiDCoCBjbGFzcyBDYWNo
ZVJlZ2lvbjoNCj4+IC3CoMKgwqAgX1JFR0lPTl9GT1JNQVQgPSAnSUlCeEgnDQo+PiAtwqDCoMKg
IFNJWkUgPSBzdHJ1Y3QuY2FsY3NpemUoX1JFR0lPTl9GT1JNQVQpDQo+PiArwqDCoMKgIF9CSU5f
Rk1UID0gc3RydWN0LlN0cnVjdCgnSUlCeEgnKQ0KPj4gwqAgY2xhc3MgSXJxY2hpcDoNCj4+IC3C
oMKgwqAgX0lSUUNISVBfRk9STUFUID0gJ1FJSVFRJw0KPj4gLcKgwqDCoCBTSVpFID0gc3RydWN0
LmNhbGNzaXplKF9JUlFDSElQX0ZPUk1BVCkNCj4+ICvCoMKgwqAgX0JJTl9GTVQgPSBzdHJ1Y3Qu
U3RydWN0KCdRSUlRUScpDQo+PiDCoMKgwqDCoMKgIGRlZiBfX2luaXRfXyhzZWxmLCBpcnFjaGlw
X3N0cnVjdCk6DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgKHNlbGYuYWRkcmVzcywNCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNlbGYuaWQsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLnBp
bl9iYXNlLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VsZi5waW5fYml0bWFwX2xvLA0KPj4g
LcKgwqDCoMKgwqDCoMKgwqAgc2VsZi5waW5fYml0bWFwX2hpKSA9IFwNCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdC51bnBhY2tfZnJvbShzZWxmLl9JUlFDSElQX0ZPUk1BVCwgaXJx
Y2hpcF9zdHJ1Y3QpDQo+PiArwqDCoMKgwqDCoMKgwqDCoCBzZWxmLnBpbl9iaXRtYXBfaGkpID0g
c2VsZi5fQklOX0ZNVC51bnBhY2tfZnJvbShpcnFjaGlwX3N0cnVjdCkNCj4+IMKgwqDCoMKgwqAg
ZGVmIGlzX3N0YW5kYXJkKHNlbGYpOg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBzZWxm
LmFkZHJlc3MgPT0gMHhmZWMwMDAwMA0KPj4gwqAgY2xhc3MgUElPUmVnaW9uOg0KPj4gLcKgwqDC
oCBfUkVHSU9OX0ZPUk1BVCA9ICdISCcNCj4+IC3CoMKgwqAgU0laRSA9IHN0cnVjdC5jYWxjc2l6
ZShfUkVHSU9OX0ZPUk1BVCkNCj4+ICvCoMKgwqAgX0JJTl9GTVQgPSBzdHJ1Y3QuU3RydWN0KCdI
SCcpDQo+PiDCoMKgwqDCoMKgIGRlZiBfX2luaXRfXyhzZWxmLCBwaW9fc3RydWN0KToNCj4+IC3C
oMKgwqDCoMKgwqDCoCAoc2VsZi5iYXNlLCBzZWxmLmxlbmd0aCkgPSANCj4+IHN0cnVjdC51bnBh
Y2tfZnJvbShzZWxmLl9SRUdJT05fRk9STUFULA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGlvX3N0cnVjdCkNCj4+ICvCoMKgwqDCoMKgwqDC
oCAoc2VsZi5iYXNlLCBzZWxmLmxlbmd0aCkgPSBzZWxmLl9CSU5fRk1ULnVucGFja19mcm9tKHBp
b19zdHJ1Y3QpDQo+PiDCoCBjbGFzcyBDZWxsQ29uZmlnOg0KPj4gLcKgwqDCoCBfSEVBREVSX0ZP
Uk1BVCA9ICc9NnNIMzJzNHhJSUlJSUlJSUlJUTh4MzJ4Jw0KPj4gK8KgwqDCoCBfQklOX0ZNVCA9
IHN0cnVjdC5TdHJ1Y3QoJz02c0gzMnM0eElJSUlJSUlJSUlROHgzMngnKQ0KPj4gwqDCoMKgwqDC
oCBkZWYgX19pbml0X18oc2VsZiwgZGF0YSwgcm9vdF9jZWxsPUZhbHNlKToNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBzZWxmLmRhdGEgPSBkYXRhDQo+PiBAQCAtMTU1LDggKzE0OCw3IEBAIGNsYXNz
IENlbGxDb25maWc6DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYubnVtX3Bj
aV9jYXBzLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLm51bV9zdHJlYW1f
aWRzLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLnZwY2lfaXJxX2Jhc2Us
DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYuY3B1X3Jlc2V0X2FkZHJlc3MpID0g
XA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QudW5wYWNrX2Zyb20o
Q2VsbENvbmZpZy5fSEVBREVSX0ZPUk1BVCwgc2VsZi5kYXRhKQ0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzZWxmLmNwdV9yZXNldF9hZGRyZXNzKSA9IA0KPj4gc2VsZi5fQklOX0ZNVC51
bnBhY2tfZnJvbShzZWxmLmRhdGEpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBu
b3Qgcm9vdF9jZWxsOg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBz
aWduYXR1cmUgIT0gYidKSENFTEwnOg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJhaXNlIFJ1bnRpbWVFcnJvcignTm90IGEgY2VsbCBjb25maWd1cmF0aW9u
JykNCj4+IEBAIC0xNjQsNTUgKzE1Niw1MiBAQCBjbGFzcyBDZWxsQ29uZmlnOg0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJhaXNlIFJ1bnRpbWVFcnJvcign
Q29uZmlndXJhdGlvbiBmaWxlIHJldmlzaW9uIA0KPj4gbWlzbWF0Y2gnKQ0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc2VsZi5uYW1lID0gc3RyKG5hbWUuZGVjb2RlKCkpDQo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1fcmVnaW9uX29mZnMgPSANCj4+IHN0cnVjdC5jYWxjc2l6
ZShDZWxsQ29uZmlnLl9IRUFERVJfRk9STUFUKSArIFwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc2VsZi5jcHVfc2V0X3NpemUNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1lbV9yZWdpb25fb2ZmcyA9IHNlbGYuX0JJTl9GTVQuc2l6ZSArIHNlbGYuY3B1X3NldF9zaXpl
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLm1lbW9yeV9yZWdpb25zID0gW10N
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciBuIGluIHJhbmdlKHNlbGYubnVtX21l
bW9yeV9yZWdpb25zKToNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2Vs
Zi5tZW1vcnlfcmVnaW9ucy5hcHBlbmQoDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgTWVtUmVnaW9uKHNlbGYuZGF0YVttZW1fcmVnaW9uX29mZnM6XSkpDQo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbV9yZWdpb25fb2ZmcyArPSBNZW1S
ZWdpb24uU0laRQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1fcmVnaW9u
X29mZnMgKz0gTWVtUmVnaW9uLl9CSU5fRk1ULnNpemUNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlycWNoaXBfb2ZmcyA9IG1lbV9yZWdpb25fb2ZmcyArIFwNCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VsZi5udW1fY2FjaGVfcmVnaW9ucyAqIENhY2hlUmVnaW9u
LlNJWkUNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VsZi5udW1fY2FjaGVf
cmVnaW9ucyAqIENhY2hlUmVnaW9uLl9CSU5fRk1ULnNpemUNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHNlbGYuaXJxY2hpcHMgPSBbXQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZm9yIG4gaW4gcmFuZ2Uoc2VsZi5udW1faXJxY2hpcHMpOg0KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLmlycWNoaXBzLmFwcGVuZCgNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJcnFjaGlwKHNlbGYuZGF0YVtpcnFjaGlw
X29mZnM6XSkpDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlycWNoaXBfb2Zm
cyArPSBJcnFjaGlwLlNJWkUNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaXJx
Y2hpcF9vZmZzICs9IElycWNoaXAuX0JJTl9GTVQuc2l6ZQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcGlvcmVnaW9uX29mZnMgPSBpcnFjaGlwX29mZnMNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNlbGYucGlvX3JlZ2lvbnMgPSBbXQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZm9yIG4gaW4gcmFuZ2Uoc2VsZi5udW1fcGlvX3JlZ2lvbnMpOg0KPj4gICAgICAg
ICAgICAgICAgICAgDQo+PiBzZWxmLnBpb19yZWdpb25zLmFwcGVuZChQSU9SZWdpb24oc2VsZi5k
YXRhW3Bpb3JlZ2lvbl9vZmZzOl0pKQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwaW9yZWdpb25fb2ZmcyArPSBQSU9SZWdpb24uU0laRQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwaW9yZWdpb25fb2ZmcyArPSBQSU9SZWdpb24uX0JJTl9GTVQuc2l6ZQ0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGV4Y2VwdCBzdHJ1Y3QuZXJyb3I6DQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByYWlzZSBSdW50aW1lRXJyb3IoJ05vdCBhICVzY2VsbCBjb25maWd1
cmF0aW9uJyAlDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICgncm9vdCAnIGlmIHJvb3RfY2VsbCBlbHNlICcnKSkNCj4+
IMKgIGNsYXNzIFN5c3RlbUNvbmZpZzoNCj4+IC3CoMKgwqAgX0hFQURFUl9GT1JNQVQgPSAnPTZz
SDR4Jw0KPj4gK8KgwqDCoCBfQklOX0ZNVCA9IHN0cnVjdC5TdHJ1Y3QoJz02c0g0eCcpDQo+PiDC
oMKgwqDCoMKgICMgLi4uZm9sbG93ZWQgYnkgTWVtUmVnaW9uIGFzIGh5cGVydmlzb3IgbWVtb3J5
DQo+PiAtwqDCoMKgIF9DT05TT0xFX0FORF9QTEFURk9STV9GT1JNQVQgPSAnMzJ4MTJ4MjI0eDQ0
eCcNCj4+ICvCoMKgwqAgX0JJTl9GTVRfQ09OU09MRV9BTkRfUExBVEZPUk0gPSBzdHJ1Y3QuU3Ry
dWN0KCczMngxMngyMjR4NDR4JykNCj4+IMKgwqDCoMKgwqAgZGVmIF9faW5pdF9fKHNlbGYsIGRh
dGEpOg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYuZGF0YSA9IGRhdGENCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCB0cnk6DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoc2lnbmF0dXJlLA0K
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXZpc2lvbikgPSBcDQo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdC51bnBhY2tfZnJvbShTeXN0ZW1Db25maWcuX0hF
QURFUl9GT1JNQVQsIA0KPj4gc2VsZi5kYXRhKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KHNpZ25hdHVyZSwgcmV2aXNpb24pID0gc2VsZi5fQklOX0ZNVC51bnBhY2tfZnJvbShzZWxmLmRh
dGEpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBzaWduYXR1cmUgIT0gYidKSFNZ
U1QnOg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYWlzZSBSdW50aW1l
RXJyb3IoJ05vdCBhIHJvb3QgY2VsbCBjb25maWd1cmF0aW9uJykNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIHJldmlzaW9uICE9IF9DT05GSUdfUkVWSVNJT046DQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJhaXNlIFJ1bnRpbWVFcnJvcignQ29uZmlndXJh
dGlvbiBmaWxlIHJldmlzaW9uIA0KPj4gbWlzbWF0Y2gnKQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgb2ZmcyA9IHN0cnVjdC5jYWxjc2l6ZShTeXN0ZW1Db25maWcuX0hFQURFUl9GT1JNQVQp
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZmZzID0gc2VsZi5fQklOX0ZNVC5zaXplDQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLmh5cGVydmlzb3JfbWVtb3J5ID0gTWVt
UmVnaW9uKHNlbGYuZGF0YVtvZmZzOl0pDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZmZz
ICs9IHN0cnVjdC5jYWxjc2l6ZShNZW1SZWdpb24uX1JFR0lPTl9GT1JNQVQpDQo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBvZmZzICs9IA0KPj4gc3RydWN0LmNhbGNzaXplKFN5c3RlbUNvbmZp
Zy5fQ09OU09MRV9BTkRfUExBVEZPUk1fRk9STUFUKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgb2ZmcyArPSBNZW1SZWdpb24uX0JJTl9GTVQuc2l6ZQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgb2ZmcyArPSBzZWxmLl9CSU5fRk1UX0NPTlNPTEVfQU5EX1BMQVRGT1JNLnNpemUNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBleGNlcHQgc3RydWN0LmVycm9yOg0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmFpc2UgUnVudGltZUVycm9yKCdOb3QgYSByb290IGNlbGwgY29uZmln
dXJhdGlvbicpDQo+Pg0KPiANCj4gQ292ZXIgbGV0dGVyIG1pc3NpbmcsDQoNCk15IGJhZCwgd2ls
bCBpbmNsdWRlIGluIHYyLg0KDQpUaGFua3MsDQpBbmRyZWogVXR6DQoNCj4gc28gSSdtIGNvbW1l
bnRpbmcgaGVyZTogV2lsbCBoYXZlIGEgbG9vaywgYnV0IG5vdCANCj4gdGhlIG5leHQgZGF5cy4g
RGVmaW5pdGVseSBsb29raW5nIGZvcndhcmQgdG8gcGxheSB3aXRoIGl0IQ0KPiBUaGFua3MsDQo+
IEphbg0KPiANCg0KLS0gCllvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJl
IHN1YnNjcmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMgIkphaWxob3VzZSIgZ3JvdXAuClRvIHVu
c3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20g
aXQsIHNlbmQgYW4gZW1haWwgdG8gamFpbGhvdXNlLWRldit1bnN1YnNjcmliZUBnb29nbGVncm91
cHMuY29tLgpUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8v
Z3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2LzgwNjk0NzgxLTg2YzItM2I2
Zi0yYWRiLTI0ODI3OWYxODI4ZCU0MHN0Lm90aC1yZWdlbnNidXJnLmRlLgo=
