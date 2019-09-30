Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK7DZDWAKGQE24FKMMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CEEC2567
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 18:47:40 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id 5sf3233150lje.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 09:47:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569862060; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ym4I4k5FkFnP3vZQv68f1oU0tSICymibCwWBlDJT+ZAB5yU5EJbAYf7br799RHqXfK
         SQcRSOJGVoymyeNZXHAqMOJXMLI1pcqBETZ8Hz3SKr2RviZSlcnmJ2EZjWzLS/57otQx
         qjbJvgLDcHENm+zBNhcPzlixqFV/qHwapYtwUdYJEu6rc6ao2X2AHgrRefyW9A3sL/or
         d6ODij9c5lbpF5IgB8HXM5GSojPuqxPP/bGFbmbF5shsGm9THU2WD5weVBGIE4KWXVpD
         RLvCZ1LKys8UiVQWcNwVleVVBXSddxykux5LDhjsXgSsPPF2PVEcqmus4tUoL+Ht5+g7
         Lhpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=sBfyPYP7uK0SPv6joFSunZqqH/0XcS7ESrwF9M5m4B0=;
        b=FRQ4S7p+mMUo+GAr58x+0RY6imEDKIFbTnhwtmuS//GcUdZKq38aF9AiwsPFKQQ7q1
         2YdnlwrxsWQN8hU3IgH3bO8FJ6XKJn0ALomHnDgPZCC/2/aQgstHT5lzlzyWBa3VfOdm
         +5za/tWF+2ihpLu27DWua1pGP+Nws61KIbncAoVOQnoiePT+joMGRuRfn3W0nXm96Tdc
         dbs0QEahh8cLm0guvI/IGGzAUNDcWDNIksJSXqbGFt2PmaFpa9cK7ybLVTHzpqJz7H60
         C30pQjTYMrBMgI6BWZjaMQ0FhD91FX7vyi7T1dow/bJedqC1HowWuWTQHM+n96jiKiiC
         Vfog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sBfyPYP7uK0SPv6joFSunZqqH/0XcS7ESrwF9M5m4B0=;
        b=YawbcLgOLna7JMH4vVpKzFS+KVGRX2xGYV59tJ+6WPs4VIcJLp/obrEciUYMDcw+DI
         wWXdXOoUnGXRXOV8cDT84BuBA4lB74HefZpTt5+d0SAUin295PPtNFLJXG6j06CEu/FP
         qr0L6aaLSsMXwzg0ilNKTLZ78+IdPN0hrLlyLlXnz9ILtJepIOKaBw8phipeS2uuK6/n
         I7liJLrVCWE/gew1mkloGoXoazJoxqc54bBERBsz5uTlKA3B31Bk+i3QeDFoWWB+nSdK
         K2vEIbzhzzul4ePTj7Ig9uoli1UF0ZL7wlRyRl9XfrIRN5CI654BamOMvxzwuc0t1RbM
         pXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sBfyPYP7uK0SPv6joFSunZqqH/0XcS7ESrwF9M5m4B0=;
        b=CKFVffeHXEB0EhgBXGGdzTNG9aet5tbLzoHvKI+/qWoW1Unf4txJETHl0tenb1NIP6
         l879gy8sIg8cMNkW+oTEr3WOm1dMwZdfeJp7ceJd+XKxK8FLqNJSHznvDL5fwe46Fm07
         RThxiJexMedvWvA+N8cho6McsDQ3pk2zVxsybpV8UcDFLkrOanH0j8lmsfcZHKObIUGa
         l3UnfVzhCkrc4kPwnD2B9R+eRrLhAUfZx1+hN4DXH1u70VrfyIMZYWP+HzMICE8Xtfjk
         PVQ8Y2PrYxj4fV/7r0BkHL96yC02wqlQ+RrHTu5UkxII/NQpFtH1kdAftR5o040GNhE0
         4j/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWy2H3LhkxETrVdR+BgA3KCrlWq9UHQEfY2t8XUuxI0cj7Ra33j
	Mlef7qz05GHnPfA4JoUGRGs=
X-Google-Smtp-Source: APXvYqz8IqyRxH5NqsFy6Y6xR5O2/mHEb5k6/4byVVDcNY9YluFMIU9LSJ7BTghZRX84P+wpzv+aVA==
X-Received: by 2002:a2e:810e:: with SMTP id d14mr11206971ljg.160.1569862059894;
        Mon, 30 Sep 2019 09:47:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:1285:: with SMTP id 5ls1596849ljs.11.gmail; Mon, 30 Sep
 2019 09:47:39 -0700 (PDT)
X-Received: by 2002:a2e:5415:: with SMTP id i21mr12627338ljb.71.1569862059194;
        Mon, 30 Sep 2019 09:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569862059; cv=none;
        d=google.com; s=arc-20160816;
        b=fPoFYK9vvOUXmINYmcde7rh6lmuCeOOkcWIkzLXsky8k1YNHHn03/E9iSZLwB29kRh
         hEVdW+3MfeFWn7dYpR4EA4ot13gBbFxaGChPad/4pnvFDnkLhk5BqLPghRHYiTaaOtXw
         a75pIC5b8Cuw/YKq3Vxjt1KlxyhP6JtVrx5iPXStKFsVyRuRvIn74tFJLKOLKd6CXo/g
         xNPwhWqnYSyOYZfReKwU31ReBZVrJ8xQXvnPaZkWwsaL/Dyfz5+yhuk6fAQU2NVDdNhM
         A8CfyrfRaqGQ+V86XP8tQZThdkuhETUlut5F4PJosXt1LN05agIga9SipojuaFosI1yO
         gDNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=hztEzMZlcIOIOmw+w/1tF7Hm05sX/07W1aDF603MpP4=;
        b=fnMEFTh5klNs24E9MDaCSRSmX6CMgzhbknlGRVX4zwq1knTgFnBr1AeP3DhWkAR1pV
         X8Ewpscc7BJNsDKNsi/b+hsokbxoLX+7/1fYbfNi/GbcAdK/6flVxifOo5rQiB6CsJ1f
         n+HP8AM7Eo+u+9NK/icNIMOOC+OM5pEWfW4A8IhZe7ALrrs3MfHDpm0Hlb5ByniVEp5v
         hQY1s33CL0RNDB7oZNp2KORRpzB7MxSM7vL6LLhs6werTbvfTj/eDbHopClc03SMlPcR
         vO1U7kdw+b3+Abb5IpSLiiJIxq4tRZdl++AsrbFW1fgbel0xaP4AP/I7QJP/dAsOigLU
         OF9w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id d3si634644lfq.1.2019.09.30.09.47.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 09:47:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x8UGlcp2031027
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2019 18:47:38 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x8UGlcGq013126;
	Mon, 30 Sep 2019 18:47:38 +0200
Subject: Re: [PATCH] pyjailhouse: Remove superfluous definition and fix linter
 warnings
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930145239.16506-1-andrej.utz@st.oth-regensburg.de>
 <d644b734-1892-14c6-8af3-86f506cd019a@siemens.com>
 <49c87e4d-7600-4180-5f2f-b7525385237c@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <94d44a08-b825-2fd9-14f8-a0b88905085c@siemens.com>
Date: Mon, 30 Sep 2019 18:47:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <49c87e4d-7600-4180-5f2f-b7525385237c@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

T24gMzAuMDkuMTkgMTg6NDMsIEFuZHJlaiBVdHogd3JvdGU6DQo+IEhpIEphbiwNCj4gDQo+IE9u
IDMwLjA5LjE5IDE4OjM3LCBKYW4gS2lzemthIHdyb3RlOg0KPj4gT24gMzAuMDkuMTkgMTY6NTIs
IEFuZHJlaiBVdHogd3JvdGU6DQo+Pj4gJ3ZlY3Rvcl9zaXplJyB3YXMgc2V0LCBidXQgbm90IHVz
ZWQuDQo+Pj4NCj4+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4+Pg0KPj4+IEZpeGVzOiBmNmZl
ZjkyZmZhYmEgKCJweWphaWxob3VzZTogc3lzZnNfcGFyc2VyOiBBZGQgbW9yZSBwcmVjaXNlIGxl
bmd0aCBvZiANCj4+PiBzb21lIGV4dGVuZGVkIGNhcHMiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJlaiBVdHogPGFuZHJlai51dHpAc3Qub3RoLXJlZ2Vuc2J1cmcuZGU+DQo+Pj4gLS0tDQo+Pj4g
wqAgcHlqYWlsaG91c2Uvc3lzZnNfcGFyc2VyLnB5IHwgOSArKysrKy0tLS0NCj4+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlm
ZiAtLWdpdCBhL3B5amFpbGhvdXNlL3N5c2ZzX3BhcnNlci5weSBiL3B5amFpbGhvdXNlL3N5c2Zz
X3BhcnNlci5weQ0KPj4+IGluZGV4IDY3ZGM4NWQwLi5lNmIwNzcxNiAxMDA2NDQNCj4+PiAtLS0g
YS9weWphaWxob3VzZS9zeXNmc19wYXJzZXIucHkNCj4+PiArKysgYi9weWphaWxob3VzZS9zeXNm
c19wYXJzZXIucHkNCj4+PiBAQCAtNDkwLDcgKzQ5MCw3IEBAIGRlZiBwYXJzZV9pdnJzKHBjaWRl
dmljZXMsIGlvYXBpY3MpOg0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZ2lvbnMu
YXBwZW5kKA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTWVtUmVnaW9u
KG1lbV9hZGRyLCBtZW1fYWRkciArIG1lbV9sZW4gLSAxLCAnQUNQSSBJVlJTJywNCj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tbWVudCkpDQo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbW1lbnQpKQ0K
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBlbGlmIHR5cGUgPT0gMHg0MDoNCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByYWlzZSBSdW50aW1lRXJyb3IoDQo+Pj4gQEAgLTY2NSwxMyArNjY1
LDEzIEBAIGNsYXNzIFBDSUNhcGFiaWxpdHk6DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGxlbiA9IDQgKyAodnNlY19sZW4gPj4gMjApDQo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbGlmIGlkID09IFBDSV9FWFRfQ0FQX0lELkFD
UzoNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGVuID0g
OA0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2ZWN0b3Jfc2l6
ZSA9IDANCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGFjc19j
YXAsIGFjc19jdHJsKSA9IHN0cnVjdC51bnBhY2soJzxISCcsIGYucmVhZCg0KSkNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWNzX2NhcCwgYWNzX2N0cmwgPSBz
dHJ1Y3QudW5wYWNrKCc8SEgnLCBmLnJlYWQoNCkpDQo+Pg0KPj4gV2FzIHRoYXQgYSB3YXJuaW5n
IGFzIHdlbGwsIG9yIGp1c3Qgc3R5bGUgcHJlZmVyZW5jZT8gV2UgaGF2ZSBwbGVudHkgb2YgdGhv
c2UgDQo+PiBjYXNlcywgdGhvdWdoLg0KPiANCj4gVGhpcyBkaWRuJ3QgcmFpc2UgYSB3YXJuaW5n
LCBidXQgSSByZW1vdmVkIHRoZSBicmFjZXMgYXMgYSBjb3NtZXRpYyBkcml2ZS1ieSANCj4gZml4
LiBCZXNpZGVzIHRoYXQgd2UgaGF2ZSBtb3JlIGNvc21ldGljIGNoYW5nZXMgbGlrZSB0aGF0LCB3
aGljaCB3ZSB3aWxsIHNlbmQgc29vbi4NCg0KVGhlbiBJIHdvdWxkIHZvdGUgZm9yIGNvbnNpc3Rl
bmN5IGFuZCBkbyBhIG1hc3MgY29udmVyc2lvbiB3aXRoIHJlYXNvbmluZy4NCg0KSSdtIGRyb3Bw
aW5nIHRoaXMgaHVuaywgYXBwbHlpbmcgdGhlIHJlc3QuDQoNClRoYW5rcywNCkphbg0KDQo+IA0K
PiBUaGFua3MsDQo+IEFuZHJlaiBVdHoNCj4gDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIGFjc19jYXAgJiAoMSA8PCA1KSBhbmQgYWNzX2N0cmwgJiAo
MSA8PCA1KToNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB2ZWN0b3JfYml0cyA9IGFjc19jYXAgPj4gOA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIHZlY3Rvcl9iaXRzID09IDA6DQo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB2ZWN0b3JfYml0cyA9IDI1Ng0KPj4+ICsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2ZWN0b3JfYnl0ZXMgPSBpbnQoKHZlY3Rvcl9i
aXRzICsgMzEpIC8gKDggKiA0KSkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBsZW4gKz0gdmVjdG9yX2J5dGVzDQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbGlmIGlkIGluIFtQQ0lfRVhUX0NBUF9JRC5WQywgUENJ
X0VYVF9DQVBfSUQuVkM5XToNCj4+PiBAQCAtNjc5LDcgKzY3OSw4IEBAIGNsYXNzIFBDSUNhcGFi
aWxpdHk6DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxl
biA9IDQgKiA0DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbGlmIGlk
ID09IFBDSV9FWFRfQ0FQX0lELk1GVkM6DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGxlbiA9IDQNCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGVsaWYgaWQgaW4gW1BDSV9FWFRfQ0FQX0lELkxUUiwgUENJX0VYVF9DQVBfSUQuQVJJLCAN
Cj4+PiBQQ0lfRVhUX0NBUF9JRC5QQVNJRF06DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBlbGlmIGlkIGluIFtQQ0lfRVhUX0NBUF9JRC5MVFIsIFBDSV9FWFRfQ0FQX0lELkFS
SSwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFBDSV9FWFRfQ0FQX0lELlBBU0lEXToNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbGVuID0gOA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZWxpZiBpZCBpbiBbUENJX0VYVF9DQVBfSUQuRFNOLCBQQ0lfRVhUX0NBUF9J
RC5QVE1dOg0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBs
ZW4gPSAxMg0KPj4+DQo+Pg0KPj4gUmVzdCBsb29rcyBnb29kLg0KPj4NCj4+IEphbg0KPj4NCg0K
LS0gDQpTaWVtZW5zIEFHLCBDb3Jwb3JhdGUgVGVjaG5vbG9neSwgQ1QgUkRBIElPVCBTRVMtREUN
CkNvcnBvcmF0ZSBDb21wZXRlbmNlIENlbnRlciBFbWJlZGRlZCBMaW51eA0KDQotLSAKWW91IHJl
Y2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29v
Z2xlIEdyb3VwcyAiSmFpbGhvdXNlIiBncm91cC4KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdy
b3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBq
YWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20uClRvIHZpZXcgdGhpcyBk
aXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21z
Z2lkL2phaWxob3VzZS1kZXYvOTRkNDRhMDgtYjgyNS0yZmQ5LTE0ZjgtYTBiODg5MDUwODVjJTQw
c2llbWVucy5jb20uCg==
