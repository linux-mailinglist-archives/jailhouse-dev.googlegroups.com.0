Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBIPBZDWAKGQEJEEAVUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 17420C2557
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 18:43:14 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id c7sf2375928lfh.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 09:43:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569861793; cv=pass;
        d=google.com; s=arc-20160816;
        b=b1ttb68WB1vX1ZndG6tVyin4h3q0b5NCVNCPpRxDveb3Y2ZLqNmJSVv/6u19Y5Tbe6
         G/R6zNWnJWg0Z3qe4hKQ8OCbv/Bv+272zJzCUtB4TR5NoKSnzJPJ6T8+Uq1fLNXqrn1B
         8G8zlspQJo+SC8bOjuolAx7u12ELr/nsfGUo39n8A3qFQ4gqC2nZUbbxHm9dVjssABlo
         kEayDfULayf25sdX57Qj/Dc39U1t3eldj9iZj5GA9+Kt2XkFtNJQr3/lxN+66mW+CbBj
         OTDjnQ+xK17X6WXqwlPcSxZcrBpWJ+bKT/Ns+IhhtKlEITRREWGU7qr5T9YO9RmHQC3f
         Uqbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Phr3WtFMtp32KIXoUU1eLnbH0HaFDrFWoHLD+FkfvNs=;
        b=wJ8+cWME1BtveVa/33LDlGC/rx0pthCp/2I0RBrnIcG5VnT5r+aaiqLkmI6vQIQHmd
         cno0rUoxFcHUzllZRHAKG+7P2iECCSSHAMM3SieAEOwOIUhZfwlzNbHGLNeJx7E8dj3d
         ROXSaNNTsZgYdbpYpiAhQf+skKYlEEVW+rkrC9M6NldVYsQzQuCMg1km9otbJKZLn1oi
         TyqJSA6idgSOmVwoASA8IdjB6GBOgSFNPgBOeX6ZFiqhoc3f+NQwPyPINgaQ2H0ERCMw
         p7vbUZ3wTI4yOPK0PlNYcp5l15253+CvallDKzuVV5DSTozs1Al0sm/JD13CQgNgJg8s
         0d5g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=i1AR9TKK;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Phr3WtFMtp32KIXoUU1eLnbH0HaFDrFWoHLD+FkfvNs=;
        b=gmV+B9Ymz5hGTLwxJ26A9t0+FBqrz4XMnxrWsgJKWI9TvHOBZt8XqH8btqbtCozub2
         K6n0/NyDgdLVjfnxMw7nX752Cn/mZ1+UEYVMHdcOhzdKtrwQbOwt2qNrTgwSFbLgTuIN
         cSUoyjmitPAy76VSRpZYfDALbt9k4kuGL9ZjarioVc5ZlQCOgM9MP2DseVmUdlCcK2U2
         cOy5jEDD00wFuNQPVMuqelOcXOfI8RzEnjOL/FjiS+22S+YfKycsmOGrlW5RQjyvfJvd
         Gw1hZ0zvhUE6nKxUio6AgDvDb6NQW9F1rbi/keIWf7232YBPfxqtZe1ArQTGRD2vl6mM
         JEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Phr3WtFMtp32KIXoUU1eLnbH0HaFDrFWoHLD+FkfvNs=;
        b=AWu0WwmlkJjIQzAGcKB4oOGTWyrcaFeiNPOaO42rtjZTCCCv0o7sTN9Orj/0yQQFio
         +PgvuTVe5wuOPM0UEY8JqfhDuUULXlfR0XDxY9d8EEweC1G8fFFzdAHCQ7YhnrsQ7N2Q
         vX6M3cUkJ0zo2SvjWRVpbtMlL4qfMiioE/F5MbnJ0NqNCNql4Xvdix5Gq0Xp/nBWwzqQ
         C4kFNzjO7vqk/hGk5ZLWmhXi3JGJtWotkPjshvK5DcyuTqsXrdiYBGOU9Ph9oM9rlhC0
         sB704p/Q42O98tlO/fn8LaqvEl8Ejc1oq7hS4kLbkx6eeF/lY2hd7B2OuZk+d6VmvNZw
         EvPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX7FFlfd5Xs46hq7fZVO4+UzO6VM3TYlvNTb+YK6DzION3elGuC
	164XJmgLo27B7AIBeJ8SCk8=
X-Google-Smtp-Source: APXvYqzKOnJsip46aeXLNihuxHzEKXgXfFHtzrPj6kbojnpKSLhenGa3TmO0j+0dMhS1ALPwZjU8rg==
X-Received: by 2002:a2e:9215:: with SMTP id k21mr12680040ljg.20.1569861793599;
        Mon, 30 Sep 2019 09:43:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:95d4:: with SMTP id y20ls1590511ljh.15.gmail; Mon, 30
 Sep 2019 09:43:12 -0700 (PDT)
X-Received: by 2002:a2e:3808:: with SMTP id f8mr12696911lja.7.1569861792928;
        Mon, 30 Sep 2019 09:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569861792; cv=none;
        d=google.com; s=arc-20160816;
        b=pjwLrNHwwwkP3WAo73BT4aJhG/1/B91ce81Cq1Dw3TTu8uJjD3MyxRcfI79nUGuNjH
         Q31DMLNOu7HE7mng7cOLj1mgaGEv6/GWupK07/OvrpHnCaUDBFEv05kMx7a+dbvukFS4
         MCuUTMY1mf+Or/CL7P1UT9y36Hh3MwM9ZdLMfMLN46j6UPAtmTmT0+rs59m015ZU3gyQ
         OVuunMrF05+yLPxkaM4/yMAlulXOYKzmU61U0936URMf+N+XKc6LzyrAHGg5d7+0JuE+
         7wFmL0fOqnnkVTvo4ZunZP9uCQFtzD9ikrvfMAx9xlhvqHLr5dDCPN6ae4TgOcbPMrdF
         ey1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=VeSsaOcnYtSGpmvIhYZqtahwTEF9SkUzFIZGDeR1LN8=;
        b=APC1nWqIEKbbTyDbJ6RRwxqhu9Q2caltCa1gwRTKjaRHB36vgeSGF26W+Whx1q/Qs8
         MRaZibRBT8/pyP3XUlfMHzz9mgdZrqD/I9UT9jDfPTWecO4+5Qxuf0Egf4zHe3Gq14yq
         0zB6NRcm7Tdg9pP4jXbDYF+jZXZXgP+JYtP1+CL5SXuGPGLeMm3L15MeuEKSLBIayr5D
         pLgxU3ibkXKClU/Zx6hRT3Q0LKfH1490jjYfkacKllAb2gMRIw2PrFESjAqWz+VtKpV2
         HMAdg7WyheFaP0zp5oTBdHTGDkJ5nfhVgP5IPqxVp2cwRv98BsU8hq7s91HUFGE7cAAu
         tZtA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=i1AR9TKK;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id c8si896979lfm.4.2019.09.30.09.43.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 09:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46hp9q4y9Pzxyn;
	Mon, 30 Sep 2019 18:43:11 +0200 (CEST)
Received: from [192.168.178.79] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 30 Sep
 2019 18:43:11 +0200
Subject: Re: [PATCH] pyjailhouse: Remove superfluous definition and fix linter
 warnings
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <20190930145239.16506-1-andrej.utz@st.oth-regensburg.de>
 <d644b734-1892-14c6-8af3-86f506cd019a@siemens.com>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <49c87e4d-7600-4180-5f2f-b7525385237c@st.oth-regensburg.de>
Date: Mon, 30 Sep 2019 18:43:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <d644b734-1892-14c6-8af3-86f506cd019a@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: de-CH
Content-Transfer-Encoding: base64
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=i1AR9TKK;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

SGkgSmFuLA0KDQpPbiAzMC4wOS4xOSAxODozNywgSmFuIEtpc3prYSB3cm90ZToNCj4gT24gMzAu
MDkuMTkgMTY6NTIsIEFuZHJlaiBVdHogd3JvdGU6DQo+PiAndmVjdG9yX3NpemUnIHdhcyBzZXQs
IGJ1dCBub3QgdXNlZC4NCj4+DQo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4+DQo+PiBGaXhl
czogZjZmZWY5MmZmYWJhICgicHlqYWlsaG91c2U6IHN5c2ZzX3BhcnNlcjogQWRkIG1vcmUgcHJl
Y2lzZSANCj4+IGxlbmd0aCBvZiBzb21lIGV4dGVuZGVkIGNhcHMiKQ0KPj4gU2lnbmVkLW9mZi1i
eTogQW5kcmVqIFV0eiA8YW5kcmVqLnV0ekBzdC5vdGgtcmVnZW5zYnVyZy5kZT4NCj4+IC0tLQ0K
Pj4gwqAgcHlqYWlsaG91c2Uvc3lzZnNfcGFyc2VyLnB5IHwgOSArKysrKy0tLS0NCj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL3B5amFpbGhvdXNlL3N5c2ZzX3BhcnNlci5weSBiL3B5amFpbGhvdXNlL3N5c2Zz
X3BhcnNlci5weQ0KPj4gaW5kZXggNjdkYzg1ZDAuLmU2YjA3NzE2IDEwMDY0NA0KPj4gLS0tIGEv
cHlqYWlsaG91c2Uvc3lzZnNfcGFyc2VyLnB5DQo+PiArKysgYi9weWphaWxob3VzZS9zeXNmc19w
YXJzZXIucHkNCj4+IEBAIC00OTAsNyArNDkwLDcgQEAgZGVmIHBhcnNlX2l2cnMocGNpZGV2aWNl
cywgaW9hcGljcyk6DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWdpb25zLmFwcGVu
ZCgNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTWVtUmVnaW9uKG1lbV9h
ZGRyLCBtZW1fYWRkciArIG1lbV9sZW4gLSAxLCAnQUNQSSANCj4+IElWUlMnLA0KPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbW1lbnQpKQ0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbW1lbnQpKQ0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIGVsaWYgdHlwZSA9PSAweDQwOg0KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmFpc2UgUnVudGltZUVycm9yKA0KPj4gQEAgLTY2NSwxMyArNjY1LDEzIEBA
IGNsYXNzIFBDSUNhcGFiaWxpdHk6DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbGVuID0gNCArICh2c2VjX2xlbiA+PiAyMCkNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxpZiBpZCA9PSBQQ0lfRVhUX0NBUF9JRC5BQ1M6DQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGVuID0gOA0KPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZlY3Rvcl9zaXplID0gMA0KPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChhY3NfY2FwLCBhY3NfY3Ry
bCkgPSBzdHJ1Y3QudW5wYWNrKCc8SEgnLCANCj4+IGYucmVhZCg0KSkNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhY3NfY2FwLCBhY3NfY3RybCA9IHN0cnVjdC51
bnBhY2soJzxISCcsIGYucmVhZCg0KSkNCj4gDQo+IFdhcyB0aGF0IGEgd2FybmluZyBhcyB3ZWxs
LCBvciBqdXN0IHN0eWxlIHByZWZlcmVuY2U/IFdlIGhhdmUgcGxlbnR5IG9mIA0KPiB0aG9zZSBj
YXNlcywgdGhvdWdoLg0KDQpUaGlzIGRpZG4ndCByYWlzZSBhIHdhcm5pbmcsIGJ1dCBJIHJlbW92
ZWQgdGhlIGJyYWNlcyBhcyBhIGNvc21ldGljIA0KZHJpdmUtYnkgZml4LiBCZXNpZGVzIHRoYXQg
d2UgaGF2ZSBtb3JlIGNvc21ldGljIGNoYW5nZXMgbGlrZSB0aGF0LCANCndoaWNoIHdlIHdpbGwg
c2VuZCBzb29uLg0KDQpUaGFua3MsDQpBbmRyZWogVXR6DQoNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBhY3NfY2FwICYgKDEgPDwgNSkgYW5kIGFjc19j
dHJsICYgKDEgPDwgNSk6DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB2ZWN0b3JfYml0cyA9IGFjc19jYXAgPj4gOA0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgdmVjdG9yX2JpdHMgPT0g
MDoNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdmVjdG9yX2JpdHMgPSAyNTYNCj4+ICsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZlY3Rvcl9ieXRlcyA9IGludCgodmVjdG9y
X2JpdHMgKyAzMSkgLyAoOCAqIA0KPj4gNCkpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZW4gKz0gdmVjdG9yX2J5dGVzDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsaWYgaWQgaW4gW1BDSV9FWFRfQ0FQX0lELlZD
LCBQQ0lfRVhUX0NBUF9JRC5WQzldOg0KPj4gQEAgLTY3OSw3ICs2NzksOCBAQCBjbGFzcyBQQ0lD
YXBhYmlsaXR5Og0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGxlbiA9IDQgKiA0DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsaWYg
aWQgPT0gUENJX0VYVF9DQVBfSUQuTUZWQzoNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBsZW4gPSA0DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGVsaWYgaWQgaW4gW1BDSV9FWFRfQ0FQX0lELkxUUiwgUENJX0VYVF9DQVBfSUQuQVJJLCAN
Cj4+IFBDSV9FWFRfQ0FQX0lELlBBU0lEXToNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZWxpZiBpZCBpbiBbUENJX0VYVF9DQVBfSUQuTFRSLCBQQ0lfRVhUX0NBUF9JRC5BUkks
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFBDSV9FWFRfQ0FQX0lELlBBU0lEXToNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBsZW4gPSA4DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVsaWYgaWQgaW4gW1BDSV9FWFRfQ0FQX0lELkRTTiwgUENJX0VYVF9DQVBfSUQuUFRN
XToNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZW4gPSAx
Mg0KPj4NCj4gDQo+IFJlc3QgbG9va3MgZ29vZC4NCj4gDQo+IEphbg0KPiANCg0KLS0gCllvdSBy
ZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlIEdv
b2dsZSBHcm91cHMgIkphaWxob3VzZSIgZ3JvdXAuClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBn
cm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8g
amFpbGhvdXNlLWRldit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tLgpUbyB2aWV3IHRoaXMg
ZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9t
c2dpZC9qYWlsaG91c2UtZGV2LzQ5Yzg3ZTRkLTc2MDAtNDE4MC01ZjJmLWI3NTI1Mzg1MjM3YyU0
MHN0Lm90aC1yZWdlbnNidXJnLmRlLgo=
