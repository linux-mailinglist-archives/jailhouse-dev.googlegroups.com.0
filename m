Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAVYW35QKGQETFGB7SY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id E151E278188
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 09:28:02 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id m19sf754610wmg.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 00:28:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601018882; cv=pass;
        d=google.com; s=arc-20160816;
        b=OOjVXtLwnJNvf4II3MwhVWQRU0oClGKxR69N+uHPOntdfoPa2F0xpF2T4+8dM9nmqw
         xENd1niXGOkjMsLdORrW+A1xJ2bFz82Ol2mJEYrWzE45opOceQk1BYNfyHXMJDMZZnRU
         U5F8XTh+O4X9iNlPdnuqCSayILIjwxcyK1nG7SuhyGXum1JYmCuFPxNJ4g2hsQ4ADgks
         p5gtouDGVV9E0EofRChJpz4yRxa3MASpjAhz83XFDcw81ySuU6pI/IYS7BEqAeeYIng8
         INNJGQCkGwCl6lr38tK1MNEUqWn+MX2hD5OChk1o0u/uHjw7z/IFA2e1SWfHlj1GhYRR
         DwWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:sender:dkim-signature;
        bh=S6dvyZzNA5GUJhIYLRgGXdKFtt5Z4RxRrlNHe3nqk3I=;
        b=O2IaIcei7yRZHGXKICY03poj8yoMmhS8KqOumlhXv3rttEI5i7ncAGeGdawjqubxPj
         eribV1RuR1mL0ZLZSk0eKl7H7rWASvPszSScSZzcrcdLjbeQ1t2dfreKyo8jbGwlzOMy
         QpOmtCcLkoWxYNGlbshoIqLQ4hGv8VSSzBYrxNCfi0zMqYacbe1SbCPkuYwr2WhwtU/G
         VNPBimEFXyrXT3x2rlbRSfVZGoKXusBjnzxK+uagFjNmF07cobTwkZHuZrqod9FERvBt
         98IAyDGf+USN9rLpQVmi+d47gzQdJZqyNJGXkPDy3+s7DcFrpmyas7lCJxs1tcnivJp/
         uRKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S6dvyZzNA5GUJhIYLRgGXdKFtt5Z4RxRrlNHe3nqk3I=;
        b=rS/ToZGKNRBjC7ARL8ZwVYTQAKcP4oV907c0Bh9uQdPa70B1iGPD4OU8zGgq+fFDyt
         w+wj5Gy/FYnav9VrWpxUVBwuwGnj4VrWvA3tQSgs+aEdfaRBuEFiPZ+UsIBo27RTISj0
         Z0MyFEmXBaHf0oQbEBU8Dq50NAMvA94YMgvDaBpPHGrQZ2Wtkz+WF955Fzjl2Fk11s4/
         bK6NX52orptrrbb2+/rVNj48kQkGYOYd8lEHa53ljM/MEixuOdBAR+81sBTOTO2WH1ZM
         WN8et9u8PvOeuh3eQGXD1OFpOQKZXTYxVhilCQrdmoiktGF4ZVpAln9HZv/aqzLaVZNq
         jICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S6dvyZzNA5GUJhIYLRgGXdKFtt5Z4RxRrlNHe3nqk3I=;
        b=GE7toR2M3jFptS6DHbpHtdMja923dfpX5Bo+z73799+xTuGeXG5otQNLyJPyVfJzIq
         pNnqF+u0+6bYZx1RrhiFaWQ49XefdjYwR2+XGHe+/JVOSN8tqCNIKTas9xRCpggH2uQY
         ZTraoz+bva0/zH2bg+GXF3lOPSs0TfiXlOyFTMqtuWvPnR7sVkhE7ZxvVi2+TaonblE+
         ldbclaLZ7wTiQOgZTeQZDhlCU5Q6aG7yKazK39ZvBGzFLfKAgFOgXuhdTn1j6t/930Yo
         L58UG0+7alh/3BqvZmWWxttQSw0BswD7Hcyl9R5CFHVb2c1eStJ+bvn71JlYrpYb8Ej4
         ooOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533KXtOuM2zM4F2SJmu84p2VJ78N35J7zOMqGxIjnEOK9fT5pKLt
	CVALNGScCptY7WPQS0XJ0Pc=
X-Google-Smtp-Source: ABdhPJwKr/3uyBA7bwR8wMGw9YAKtZ0z0BSHHlQuzYIl4+4g3/5fqZ+J3Ex9LeiuyTBPeTZ+rWWq3A==
X-Received: by 2002:adf:91a4:: with SMTP id 33mr3139416wri.170.1601018882622;
        Fri, 25 Sep 2020 00:28:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls2203894wrm.1.gmail; Fri, 25 Sep
 2020 00:28:01 -0700 (PDT)
X-Received: by 2002:adf:a18c:: with SMTP id u12mr3095659wru.90.1601018881351;
        Fri, 25 Sep 2020 00:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601018881; cv=none;
        d=google.com; s=arc-20160816;
        b=sTbz3lRpd0COvn0gVWNSg3fFr6KlWPnDDnzmHih4/sxM6h3tR4ixy/VHldTNLC0zrH
         YjTXhWJvI2v/TJgCr8vCtllPTyJmbPxfarvuezlgioq+h4tXcCfudQFEQ65c1zKTueyV
         orERSYQ9LvpQdGNuhK1r0x3Z88foR7D/6ph74GAqXo3AdrjQ8XzGRIPLgSK1t/FiroOa
         9ZIHliZkwJUUDbBQ3stNIFEV+MJDgiUSzDNcSJF/FsXx2O9SSVHtkBA3eQ7JcJpshSP+
         wRiQMdryr96RU0Uf0wFoJco7JLbNJfN1DBo9jVGXI0tjyTZ1qMvqAIs4R3/H17hZFQMB
         y2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=Acv1n8xvF6ohJBgZvSFfA6UkTGwmB/oWBPM0lL9pt00=;
        b=qYCi2lXZCEyQtDO621yGGDIdDx8UcEhk/qdLYLoD+jLyjfnm1u4YhsVUAYjP92oAMX
         37tvMmQ/TZyPCIv7C/hm+DYOxz1RTXb0X/CrOMA99JDIztLiyfKhgG5IzDFz5jt/6s/k
         Yj2XtIkfVDc3EpXlcA9zCln+ctZRuTi1VBO5y18UNamaP47L5hS+S7lBzQDpn2ziMOBN
         yRTGVP1XHDBOErYiq2zg6k4mNgMRgDu0sG4/ZwA8xqcSzQgbnFYNivgeSz/rUI3uGkxF
         XSdBNm+AjcUTeBL8yBUcid4KKLjT8cO77YeOUjma7tnSkunux/Hgd4f90QLR7F6bo90i
         WgRQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k14si51071wrx.1.2020.09.25.00.28.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 00:28:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 08P7S1Q7004671
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 09:28:01 +0200
Received: from [139.22.133.254] ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P7S0td031618;
	Fri, 25 Sep 2020 09:28:00 +0200
Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
 <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
Message-ID: <e566d2fb-c942-ec6a-829f-0ac22b3c5ca1@siemens.com>
Date: Fri, 25 Sep 2020 09:28:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
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

T24gMjUuMDkuMjAgMDk6MTksIEphbiBLaXN6a2Egd3JvdGU6DQo+IE9uIDIyLjA5LjIwIDA4OjQ1
LCBBbGljZSBHdW8gd3JvdGU6DQo+PiArwqDCoMKgwqDCoMKgwqAgLnBsYXRmb3JtX2luZm8gPSB7
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIC5wY2lfbW1jb25maWdfYmFzZSBpcyBmaXhlZDsgaWYgeW91IGNoYW5nZSBpdCwNCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB1cGRhdGUgdGhlIHZhbHVlIGluIG1hY2guaA0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIChQQ0lfQ0ZHX0JBU0UpIGFuZCByZWdlbmVy
YXRlIHRoZSBpbm1hdGUgbGlicmFyeQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnBjaV9tbWNvbmZpZ19iYXNlID0gMHhmZDcwMDAw
MCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5wY2lfbW1jb25maWdfZW5kX2J1cyA9IDB4
MCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5wY2lfaXNfdmlydHVhbCA9IDEsDQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucGNpX2RvbWFpbiA9IDAsDQo+PiArDQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAuaW9tbXVfdW5pdHMgPSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAudHlwZSA9IEpBSUxIT1VTRV9JT01NVV9BUk1fTU1VNTAwLA0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5iYXNlID0gMHg1MTQwMDAwMCwNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2l6ZSA9IDB4NDAwMDAsDQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmFybV9tbXU1MDAuc2lkX21hc2sg
PSAweDdmODAsDQo+IA0KPiBIb3cgaXMgdGhlIHNpZF9tYXNrIG9mIGEgcGxhdGZvcm0gcmV0cmll
dmVkPyBDYW4gdGhpcyBiZSBkZXJpdmVkIGZyb20gDQo+IGluZm9ybWF0aW9uIGluIGEgbm9ybWFs
IGRldmljZSB0cmVlPw0KPiANCj4gT3IgaXMgdGhpcyBjb21pbmcgZnJvbSBoZXJlOg0KPiANCj4g
LyogSUQwICovDQo+IGlkID0gYXJtX3NtbXVfZ3IwX3JlYWQoc21tdSwgQVJNX1NNTVVfR1IwX0lE
MCk7DQo+IFsuLi5dDQo+IC8qIE1heC4gbnVtYmVyIG9mIGVudHJpZXMgd2UgaGF2ZSBmb3Igc3Ry
ZWFtIG1hdGNoaW5nL2luZGV4aW5nICovDQo+IGlmIChzbW11LT52ZXJzaW9uID09IEFSTV9TTU1V
X1YyICYmIGlkICYgQVJNX1NNTVVfSUQwX0VYSURTKSB7DQo+ICDCoMKgwqDCoMKgwqDCoCBzbW11
LT5mZWF0dXJlcyB8PSBBUk1fU01NVV9GRUFUX0VYSURTOw0KPiAgwqDCoMKgwqDCoMKgwqAgc2l6
ZSA9IDEgPDwgMTY7DQo+IH0gZWxzZSB7DQo+ICDCoMKgwqDCoMKgwqDCoCBzaXplID0gMSA8PCBG
SUVMRF9HRVQoQVJNX1NNTVVfSUQwX05VTVNJREIsIGlkKTsNCj4gfQ0KPiBzbW11LT5zdHJlYW1p
ZF9tYXNrID0gc2l6ZSAtIDE7DQo+IA0KPiBJZiBpdCB3ZXJlIHNvIHNpbXBsZSwgSSB3b3VsZCBh
Y3R1YWxseSBzYXkgZG8gdGhlIHNhbWUgaW4gSmFpbGhvdXNlIGFuZCANCj4gZHJvcCB0aGUgY29u
ZmlndXJhYmxlLiBXZSBtYXkgZXZlbiBkZW1hbmQgQVJNX1NNTVVfSUQwX0VYSURTIGlmIHRoYXQg
aXMgDQo+IHByYWN0aWNhbGx5IHRoZSBvbmx5IGNhc2UgaW4gdGhlIGZpZWxkIGJ5IG5vdy4NCg0K
VGhpcyB3YXMgbm9uLXNlbnNlLg0KDQo+IA0KPiBCdXQgSSdtIGxhY2tpbmcgYSBmdWxsIHBpY3R1
cmUgeWV0Lg0KPiANCg0KU2VlbXMgdG8gYmUgdGhlIERUIHByb3BlcnR5IHN0cmVhbS1tYXRjaC1t
YXNrLiBBbmQgdGhhdCdzIHVuc2V0IGZvciB0aGUgDQp6eW5xbXAsIHNvIGxldCdzIHNlZSBob3cg
ZmFyIEknbGwgZ2V0IHdpdGggdGhhdC4NCg0KSmFuDQoNCi0tIA0KU2llbWVucyBBRywgQ29ycG9y
YXRlIFRlY2hub2xvZ3ksIENUIFJEQSBJT1QgU0VTLURFDQpDb3Jwb3JhdGUgQ29tcGV0ZW5jZSBD
ZW50ZXIgRW1iZWRkZWQgTGludXgNCg0KLS0gCllvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVj
YXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMgIkphaWxob3VzZSIg
Z3JvdXAuClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcg
ZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8gamFpbGhvdXNlLWRldit1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tLgpUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZp
c2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L2U1NjZk
MmZiLWM5NDItZWM2YS04MjlmLTBhYzIyYjNjNWNhMSU0MHNpZW1lbnMuY29tLgo=
