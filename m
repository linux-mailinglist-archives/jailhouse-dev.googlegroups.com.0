Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBGEBUDZAKGQEMR7F77Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF5E15FEDC
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 15:30:48 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id m21sf9760588edp.14
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 06:30:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581777048; cv=pass;
        d=google.com; s=arc-20160816;
        b=IDZWf1J0jIUK0XV+xEzMU91i8m0McPHXMB3uNmGarjITIVGcRa/bX/47FWH3HsjR/R
         RHehQqeY2apfkYO899mwmKA9obNML92V2sWRx4cDzr1CMw08gHP6VDnl5rTAMJGzx+jd
         HcGTEFtyZ5F2XuMXWWFgdtzQIPgFvMgQzHZit23F9YN8xVqso0dilrqR+SAay3Lf1urf
         cX8LGrOyQIBJpT3DFF9dr7JMRnMnalxcl1/d3pvuXNo9dUPqe9oXONdHSooG0ypw8MZi
         cr76lHWVzR9MbqKus4g18Oi1iGDZcyNla+02cb4lDyDEhc5siolTEtFLy0MrsYc7L+mV
         Oe1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=S6qOk/WtHROYrhi+5BnDhuoIcP1M2kxvHV58nDx2KR8=;
        b=U/KmVKXbEV3TEhakWHZIr1aZ8D7MSXz4EgLrI107pkETHvszd5u3zEWCfbSNRZ+Aem
         ZemyAl0QXCJT9yI2a3xKy5CQq7ADbJgeC4vU//FFwF8hcHtSYpUWJxvh3x0MYm481Kem
         lx2jjW3vWRiH6maIOBxKZMbsvyRkrj0RTfeyJD6nvXZguq4cohPccdCGhvp3v2jlTLRw
         1aJsYTDUtVNXqWcjm+1HOhlj0ZXk26XFjNvNjX2XXxcJlkJuimMU3atvo4W8xEI00GrR
         NCNdT5Op+dHmk3o4vDNvsL9OC6CyZlra+VfySOP+IlbPr1A5FHff0VhLhU4j7iWAFpnE
         Z4oA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="r/Fo6jK3";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S6qOk/WtHROYrhi+5BnDhuoIcP1M2kxvHV58nDx2KR8=;
        b=Iw8XRI/6xxcZvmVVU6UPAc10TGHoekQzMr1sr83dnB/ovF74jUfvDpFugVdmsfOwKM
         tRx+Pyqx73XvHiyp3bQygUYr2XnZXkaFJKIx7W5IuDxhlMYjtosGgDSwBmgk6aj6pkRY
         6sgWsJdnoYDQLdhsfAdBCl8UI1C7h05I2gdD5dzSQ85XQQvc+FtNRfwwLMpRzg7jUPeP
         mlO3DWahZlVgbkHe+TnIEML1gqfaUr50LjFg6UI+Ze46og/3R7cREUj8vdewgLwDpG41
         qNs/veObia1xE8+8qvj0sRjbtqXdv8TFmJyOvSWAK28N1JIG/36LqH7A4ky5c733o1Y8
         fBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S6qOk/WtHROYrhi+5BnDhuoIcP1M2kxvHV58nDx2KR8=;
        b=Wf2TxpdrNecMLS0QJqYJxdEeqNFdti2Tqokh+xgLKpMT5vYcbEKXxgNsS1EuENB++5
         RyOhf11kMSexqDAy5ZjEo976shvHZXAm5WA5AzShbQzO0ANtzKHeidaxXwYAUdLi3Aos
         TE5UID6NvJVnPG5GWM1IJN2Jeex3X+IPDe8P4Oda4gFK+kSnoZWtDMc9xRuggPNhq9Bp
         wKn6y9aU6ATDDQdEgBV+KWXvfphX2uQtn5GZ99c3fmPuy3XtHsmoMtu3s9vthb6oWzGM
         TUXzh8upn7hxfN/wBYjitt3Pp2mn4YuU7fMDm4p5UTj1v2EfmXpFUAofwCkkiMzdKyQh
         r2jg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWuZfC7xZGHL8GoRoYu44Jju2KtuQ7pB2u6AGR9UcD7nyI3Cb5x
	L4fopNh5Nh6ErSt1nTPFBx8=
X-Google-Smtp-Source: APXvYqywjMHyJdBXS9CDo4LlQec81GJ90W25eSkwIrR+rBOQ8gfN22W7B2LOhQb0F6XjvGIAmfrmzQ==
X-Received: by 2002:a05:6402:6c7:: with SMTP id n7mr7056742edy.177.1581777048750;
        Sat, 15 Feb 2020 06:30:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ed84:: with SMTP id h4ls3074227edr.7.gmail; Sat, 15 Feb
 2020 06:30:48 -0800 (PST)
X-Received: by 2002:a50:ee12:: with SMTP id g18mr7261211eds.334.1581777048041;
        Sat, 15 Feb 2020 06:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581777048; cv=none;
        d=google.com; s=arc-20160816;
        b=VAbCSUoAAoCUwLNiRXcT+z7hiXkrLOLqMPTFYFAuQDgJ+54WAwFXpY2arm9EdOtV7P
         LoOBgI5mhAx803JDDPEw0FJ6eromuBjK7VooFBX9bgSFWUpj52uZniPC1BW5X5qsHFJw
         K+1ixLBZ/Nl6GqzZfdr6QPRGOqrsdAuIJsTVcAT2gBcgaw7A0243VopdRRG8vj98Obse
         ksaZLq1gmz151v16ugQn+8RBFEBAxcbAo/dNXBMfr+zwXe7u/hLR9t1aid83QwLTKMVN
         2rPskIktwJmjUE2gqu/4k3FY5hJJU4WAv6mtJK5YGCb6npqFJy9Iglfs+Ih7tNwVfrJA
         MrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=JXjz/r2nndoT+IgnYHcAMB2ShCv7QUpBSLaoalDgmEU=;
        b=THu5/F2bOqY+f2uJ/8kzTWgxnG4tb0rBPsCGS2vw0SnEP0qKhGDnWbXTwjeC5/qIOe
         VZM394M4uT1nt7fjug/8OQPFVPI4R3cru+Pgc9CWKdKC6Lw69uYIEUa2H9lzQe9MeND4
         SzbZGb7eqeESUkWhQYLbNgfSM//F39sqh4f7MV8wznt+y2upwZy6O5B+CXDSJUiJrDti
         en20kUJt8RtXHVFCw2PF2doWh/XjQe60YrAbrl3rQC2hJdWNg1n6rZb5y8g+FSR/fhBx
         bxhQtW2eO4OzUMpC2lxzxUvc+RdV/YLQkyCLJhmVTn1tvCKn7n/ZS+hKF7EIlwElEKoA
         t3Xw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="r/Fo6jK3";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id n1si526310edw.4.2020.02.15.06.30.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 06:30:48 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MCeX4-1jCMOy3mUs-009S5k; Sat, 15
 Feb 2020 15:30:46 +0100
Subject: Re: Strange newlines for console output
To: Michael Hinton <michael.g.hinton@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <0d86ac87-9d3c-42c4-b499-af40aa76d302@googlegroups.com>
 <eae57764-d282-e692-f113-b3360c6a06ad@web.de>
 <7562e73e-cfc3-4df8-8ce2-8986f903d44b@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <05da8dd6-13c2-ea3a-b91b-3fb4e5114238@web.de>
Date: Sat, 15 Feb 2020 15:30:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7562e73e-cfc3-4df8-8ce2-8986f903d44b@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:pI8oHvMP5cnMdtuqfPOMFXR06xH2sTyzpsWuZ41XRQJZNUggf+j
 xS9U74csTHiUtOcSvX0YzR0glIjD619umnBXI2rznBhdn3gxnHwFrAKXDNo3FSkBlkJNkf+
 gvqsEWHSEo0kMXzDsvAP+H0rGFq5duQT2jHZgrEeqTfHgfvkFo8Ko97hh6DSBCyK7q+oj+l
 LFf9yNfJNQd/qcrbf8l5g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VAD11l3g6uM=:hshNMC4ge9rfN/LVsMqzLG
 zrv+8sVTJWblSkD1NZO8hKNnFksitYXhWjgiw52bx/yy1unXma+u73jLCHXTlOmrMqr/8sq2+
 EEexPor8+5CiXdNiHbxcgmwMq4c+Gzhsfzx52ltjoM1fmrUsC9obat1zPZZrcXzF7126I8SM7
 hkVfZ+Az5+VsPMB8HI4Um/0Zqe+YQQb1zekgzJyDMri7MfZuK2ECMKOAInPa885UDuC3PUAqa
 DYriJxnmKRxSa/mye/3l5BquPcFP/kQuj3KwE7OIYntYHYw90Sg4pYeDppzhI/DOB91TzPCW4
 FJwkG+c7dCvNynhGcWoRRFwhqXLrAJ+VXutsGu+FFpprYCqBlwI3EUh/jQRadBBVfZYrmL7Dv
 kM+JAvz/i7uAHyxnwSoI6wMcvcYLfLYFTWjS6SM7+1V1e9pHlIqIyJvPKkv7MqWvTh4yYM1Tl
 TD8uubl6ckBk4td67P0DehBUGonSNninPkm7T74BIJd1HlMiUXxU7q662jMlx8CxtjKqr2VvU
 zXhpNKcwPTq2mOyUe0sfrt3bSoxAYaoYpIKKDhtdHAeV7u4Y0jZUdIepZHhpZAqDLYS0GU2Ld
 F8Dcma86TRwrFcrpmwvPhtQrcxV0zg4Qz00+fBBfpBDls1jn4wm1GsMVyLRlC8PuM/VvsRxn1
 HZZDFa2v28QRYit9iYRBOb2UAdzPhA3Q7+EG5uzzb0AOE+guUorpN3nIcNTllMx3Kgupk/w4M
 hUc8F2snYM3BSP/ot9C2VVSk9zi5JiLBt+V+LzgCNohLw8rH4gSn6xyhi8Cq/cLSFphn2cxiM
 w9Fi3bZEjqvtU58p1jL27rIFMVC9g8Pns8yY0eNyAEShnZEQ0xhrRpVgxQ+b5id2O257/vaBX
 HgqfHseaiSX9I9PW4BeCSwGAFpjao57VBQaAbsLjhQqxElq7E8z1mWezfFBQuhd82dQbgdWKB
 frUgi+IUqLo6TdLUswYaPI7RDygZa6QAOEKAYempzxoC3i3EesdrLvmEsL4WGo1ZhgJjGtKHB
 9NMD42KHKJimMTo9XJe8K6aVHrsTulDZxbQ+MvtlYMlvPj6+hPZKNChVcU//mfdfND7Qt71e6
 nZNNjVmRKjxU4oUTfpskpNmiMD+yVoyti+Y72T/o4kaMUjT33wRmGBP9QyWKGP18xtrUgTflR
 aM2RR60tm6WNHqFPY58NztA1csN/WTuNxjgtTFIG2rf8tHGVegiIolh+e1llGfGqsXgqk8Vpr
 aAnuo39ClkcoIKH5f
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="r/Fo6jK3";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

T24gMTUuMDIuMjAgMDA6NTEsIE1pY2hhZWwgSGludG9uIHdyb3RlOg0KPiBPbiBGcmlkYXksIEZl
YnJ1YXJ5IDE0LCAyMDIwIGF0IDQ6MDA6NDkgUE0gVVRDLTcsIEphbiBLaXN6a2Egd3JvdGU6DQo+
IA0KPiAgICAgV2VsbCwgd2UgbmVlZCB0aGUgQ1IgYmVjYXVzZSB3ZSBhcmUgYWxzbyB3cml0aW5n
IHRvIHJlYWwgVUFSVHMuDQo+IA0KPiBPaCwgcmlnaHQsIEkgZ3Vlc3MgSSBkaWRuJ3QgcmVhbGl6
ZSB0aGF0IGhhcmR3YXJlIFVBUlRzIHdvdWxkIG5lZWQgdG8gDQo+IGV4cGxpY2l0bHkgYmUgdG9s
ZCB0byBkbyBib3RoIGEgQ1IgYW5kIGEgTEYuDQo+IA0KPiAgICAgSWYgdGhlcmUNCj4gICAgIGFy
ZSB0b29saW5nIGlzc3VlcyB3aXRoIHRoZSBjdXJyZW50IHJldmVyc2Ugb3JkZXIgKHdoaWNoIHdh
cyBzaW1wbGVyIHRvDQo+ICAgICBpbXBsZW1lbnQgSUlSQyksIHdlIGNhbiBmbGlwIHRoYXQNCj4g
DQo+IFdlbGwsIEknbSBndWVzc2luZyBoYXJkd2FyZSBVQVJUcyBkb24ndCByZWFsbHkgY2FyZSB3
aGF0IG9yZGVyIHRoZSBDUiANCj4gYW5kIExGIGNvbWUgaW4uIFNvIGlmIHRoYXTigJlzIHRydWUs
IHRoZW4gSSB0aGluayBpdCB3b3VsZCBiZSBhIGdvb2QgaWRlYSANCj4gdG8gcHJpbnQgQ1IgZmly
c3QsIHNpbmNlIHRoYXQncyB3aGF0IHNvZnR3YXJlIGV4cGVjdHMuDQo+IA0KPiANCj4gICAgICwg
ZS5nLiBsaWtlIMKgdGhpczoNCj4gDQo+ICAgICBkaWZmIC0tZ2l0IGEvaHlwZXJ2aXNvci91YXJ0
LmMgYi9oeXBlcnZpc29yL3VhcnQuYw0KPiAgICAgaW5kZXggYTQzNzczYzIuLjRmNGViYTRlIDEw
MDY0NA0KPiAgICAgLS0tIGEvaHlwZXJ2aXNvci91YXJ0LmMNCj4gICAgICsrKyBiL2h5cGVydmlz
b3IvdWFydC5jDQo+ICAgICBAQCAtMTksMTYgKzE5LDE5IEBAIHN0cnVjdCB1YXJ0X2NoaXAgKnVh
cnQgPSBOVUxMOw0KPiANCj4gICAgICDCoHZvaWQgdWFydF93cml0ZShjb25zdCBjaGFyICptc2cp
DQo+ICAgICAgwqB7DQo+ICAgICAtwqDCoMKgwqDCoMKgwqDCoGNoYXIgYyA9IDA7DQo+ICAgICAr
wqDCoMKgwqDCoMKgwqDCoGNoYXIgYywgY2FjaGVkX2MgPSAwOw0KPiANCj4gICAgICDCoMKgwqDC
oMKgwqDCoMKgwqB3aGlsZSAoMSkgew0KPiAgICAgLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKGMgPT0gJ1xuJykNCj4gICAgIC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjID0gJ1xyJzsNCj4gICAgIC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGVsc2UNCj4gICAgIC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBjID0gKm1zZysrOw0KPiAgICAgK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgYyA9IGNhY2hlZF9jID8gOiAqbXNnKys7DQo+ICAgICAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghYykNCj4gICAgIGJyZWFrOw0KPiANCj4gICAgICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhY2hlZF9jID0gMDsNCj4gICAgICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChjID09ICdcbicpIHsNCj4gICAgICsgY2Fj
aGVkX2MgPSBjOw0KPiAgICAgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGMgPSAnXHInOw0KPiAgICAgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgfQ0KPiAgICAgKw0KPiAgICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3
aGlsZSAodWFydC0+aXNfYnVzeSh1YXJ0KSkNCj4gICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNwdV9yZWxheCgpOw0KPiAgICAgIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocGFuaWNfaW5fcHJvZ3Jlc3MgJiYgcGFuaWNf
Y3B1ICE9DQo+ICAgICBwaHlzX3Byb2Nlc3Nvcl9pZCgpKQ0KPiANCj4gICAgIEphbg0KPiANCj4g
SSB0aGluayBzb21ldGhpbmcgbGlrZSB0aGlzIHdvdWxkIGJlIGdvb2QuDQo+IA0KPiBJIHRyaWVk
IHRoaXMgc3BlY2lmaWMgZXhhbXBsZSBvdXQsIGFuZCBpdCBjb21wbGV0ZWx5IGZyZWV6ZXMgZXZl
cnl0aGluZy4gDQo+IExvb2tpbmcgYXQgdGhlIGNvZGUgY2xvc2VyLCBvbmNlIGNhY2hlZF9jIGlz
IHNldCB0byAnXG4nLCBJIHRoaW5rIGl0IA0KPiBiZWNvbWVzIGFuIGluZmluaXRlIGxvb3AuDQoN
ClllYWgsIHdhcyBub25zZW5zZS4gVGhlIHZlcnNpb24gaW4gbmV4dCBpcyBiZXR0ZXIuDQoNCkph
bg0KDQotLSAKWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2Ny
aWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAiSmFpbGhvdXNlIiBncm91cC4KVG8gdW5zdWJzY3Jp
YmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2Vu
ZCBhbiBlbWFpbCB0byBqYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20u
ClRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6Ly9ncm91cHMu
Z29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvMDVkYThkZDYtMTNjMi1lYTNhLWI5MWIt
M2ZiNGU1MTE0MjM4JTQwd2ViLmRlLgo=
