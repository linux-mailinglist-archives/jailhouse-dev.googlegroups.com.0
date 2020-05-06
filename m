Return-Path: <jailhouse-dev+bncBCD5HYFFQEERBQOSZP2QKGQEEHRCGCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFE91C76C9
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 18:43:46 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id l21sf1555199wmh.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 09:43:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588783426; cv=pass;
        d=google.com; s=arc-20160816;
        b=AEM6I6NS6XMLe0UduWvZM06w7bI0TjCG/yb6osSgHKsmMcAZ19Nk4qk/L69qnGPT/f
         CYWK1aMs5BSzCC3FPPDouk10BRKzqXouLqibMrmhRbnEgHtQRU60VespsHaiozp/aMST
         qFE+U0yRM5a3dQtD949bRL9KEHnMVR3oeufI9vISLsGO/PbDg+WtVqxPp0BvFKr0XbrD
         pquyfOpF8VzeK+XYBr6btfvd4e2ZmoYbUP2sk+7eZSJw+D584o8nbTkTFGF8wDe1dS/x
         zyTPoTyhbkIl6Kq0xvJCQnKZ1zjBvRW8qy8ntrC7ewAaFOivjvKweDPhpArf8AL2VRH6
         F0/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:mime-version:user-agent
         :date:message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature:dkim-signature;
        bh=wIC0upFbW29j6WuE034k/BDmeR6jBxxfe+QMc+2JciM=;
        b=BWJKWTH73n139VWHfwC1xCav+TsSAFcQcsY5L6e8ejF3jTCQRKtoX9PRS1gaJ4iuVr
         9msXhojT0cxIkJnNKKLiy0uGVHWEkad+skljIgFmG1JbZj4E5w+GQWTfE8xjsi2IU3sA
         y+HWmt28EwmFtRdTNG9bJUZV0Je7yvAcMG5Qo7l5EC8jq3lBYq0VyOVPZDpYDNTDslrU
         fPDxhIDSSjDmQAOA5bS6UU4B3U6MTJkMx/UHtvfJqH88Hc77v+VsKAOFaop1/Pnva5wP
         Lm1Jk65Otd68ji6OLR0D2gHvUGo8Wc3xp+b3GwL3qZMHxYUTyrTWje4arbkO8neGzstY
         juSg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZWFiZ7pU;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wIC0upFbW29j6WuE034k/BDmeR6jBxxfe+QMc+2JciM=;
        b=Ysic4t7h+LccmX/Z84r9n8mdtkp7Mnk5O/vTzglfrb3ngDUWOsMDvHoIHrQxrnKlE0
         MlC2cxlWCTg/hQ4oAeMY4fE2Tb0XLd+L7T9geHj0QrsVHlrZTnoI20xuRGtBMBJZVHs3
         1C2jbmGSj4LZ9Spoi7U/Et8YbfdwKegoxR7eUJwl1XJaAXSyINvHJc5UGEgoJaCO5AWl
         op0nMd23r5jMH6apgsNDgOjHiIt/JrrCbyUdC07HS2NxGr5QRlAzAdcyuOprj+8qxwyh
         ZFa/FVMxOvUPxKYZCoiJqCz5xYvmFqeJjC2LsQjaoSe0kHteAksLNqApGF9BgYu7oWKY
         Ex3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wIC0upFbW29j6WuE034k/BDmeR6jBxxfe+QMc+2JciM=;
        b=OcuQhUDXCWLUYVMiuhl3Cbb9Sn0a6KawKWsdnZJE6EF4manHf+RmVVWmdah8gEepkn
         ynhv4gzoHe0seZCFlSRpJiS7N1FGI4m7xMTaX6EpK+a+jdvgoLSglfBT7pGz9iuhMntU
         lJg264kzQkIQJNn6iyurGxmleEY7qJJlUBSwnovUylXernuIRL2nuc6/gRWcqIeLaMVk
         LS6YeavxQcHgo1sPNy2FisKWnP7je/mUabKcZ0StzpHqjsbcHHapJFQBLCEs/57wFrIj
         DnsU1Y/iHZgOZh1wO6GrepoHLYKgqDD59gMgm3lg3yK3uv5PKcrDUeaEMEte/fv9R7gT
         LkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wIC0upFbW29j6WuE034k/BDmeR6jBxxfe+QMc+2JciM=;
        b=JksvpTlwFn+Y7Z9BQX9tROF4s/ruBvu26Jw3vKfrdCyQ1hELV9l/lXo1lfqtAO5Mar
         w+bE4GYuPks+azpX2304WKhnsXV8nsaMZwo9XT7kdtl/nmsTpnpgFixfGBXmjghWz7qo
         ntDn3JvYjohzAafvXPkszcLJykeevA+Ruv0m2SFSe12FB6OJpynXQBEMiQjBxbp93QAN
         pAbNKQ0vEVctIIce60KH66YkpROe6geQWWEgdTAgkSS1wi7tbVlEx+B+Xkq0g2o+TcQH
         Ffq3Ia/cAB94eRpee806LTohWfyjbd8AgN5DTPC1KUeYe5c0HHjcYIe7j/VTgRyS2+zV
         2c2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYRi2QMoB9guyvDnLNWrgZuJMARb5RAub3DiSmyQdE5VXDtUZak
	MWJomTr/rRrjCaV75ZRo9+Y=
X-Google-Smtp-Source: APiQypLJkY52abyLMjOXzqpv5W19Y7go4o9hKgUxvxYvaSZ2MjeqDe8e7zNvSRgsP4LBJWv4+0GiTg==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr5244215wmh.120.1588783426101;
        Wed, 06 May 2020 09:43:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:db47:: with SMTP id f7ls4613716wrj.8.gmail; Wed, 06 May
 2020 09:43:45 -0700 (PDT)
X-Received: by 2002:adf:c38c:: with SMTP id p12mr11176411wrf.357.1588783425371;
        Wed, 06 May 2020 09:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588783425; cv=none;
        d=google.com; s=arc-20160816;
        b=MzeWebB+TelQjW7I/TG4/qrFA90vbME9QNM1rZzd5cNj3vBIt+oe665mcP1O3D3RG9
         UANjrq6OcWQpqntgpkgl7gw6+u+FJUABlP75ex8WksE7EFbBNM7b/mxMmM0KKDjEQcux
         53+m2dkGTgA433aD2r0qTluq9FmScUH7OqGODJxPqiFbkDGQ4JPelSna9Nw0Or+ZxWhr
         sjMktXkrXzANwdnEXiFOUw0iTiGyhvgjg5vaYR79ijXUPUTSIBVIVne/pT4zQhEmBvqY
         4UkyiTCz5RcSdIO5io7ITSao4f8RpewxdjgXrhH12lrC3FFyW2gwnp64xk0zawLwOiHo
         gwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:autocrypt:from
         :references:to:subject:dkim-signature;
        bh=VXj2LoEaEi0Wpk+FVCbeaFl1o4FyBzybSIf7S5DwSpI=;
        b=BnBfz6yoCqd9+3MeMuWoZ825sbCGhJL28AWP9hPEaakdgIF2IF8aL5cr6crblkCp9C
         GK4CRg9Vt9ArMaU632H6yKM6s+PqqN0H3XjcB8+LcmtzalyiMVjdRDqPQ+wBIqjiUep1
         xeLeCDvZjagY+gAPiVg8sK43tWhM9iDDF7Pw2hqfgjg/jW0EqxhCZE8JcS5WbE6CrK/w
         w5kHA+g5ozDX4tU/wgwD7oUWyLL/eR+omf7lOdSQyn4g2RC2ya8kDM4DA0GtEB7+1uJZ
         7+PoHdPfkbyVk/5p3zPMSLGNk/yX4jkc+Ee+gllFsAX8Amqn616sKC6nApPfE05qoSm/
         n9UA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZWFiZ7pU;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com. [2a00:1450:4864:20::443])
        by gmr-mx.google.com with ESMTPS id x11si121122wmi.1.2020.05.06.09.43.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:43:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) client-ip=2a00:1450:4864:20::443;
Received: by mail-wr1-x443.google.com with SMTP id k1so3010662wrx.4
        for <jailhouse-dev@googlegroups.com>; Wed, 06 May 2020 09:43:45 -0700 (PDT)
X-Received: by 2002:a5d:4005:: with SMTP id n5mr10313997wrp.242.1588783424566;
        Wed, 06 May 2020 09:43:44 -0700 (PDT)
Received: from [192.168.1.109] ([2.234.171.104])
        by smtp.gmail.com with ESMTPSA id c25sm3765239wmb.44.2020.05.06.09.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:43:43 -0700 (PDT)
Subject: Re: [PATCH v2 8/9] configs: add colored cell configuations for ZCU102
To: Jan Kiszka <jan.kiszka@siemens.com>, Marco Solieri <ms@xt3.it>,
 jailhouse-dev@googlegroups.com
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-9-ms@xt3.it>
 <2ef61ea7-5617-dcd8-24fe-1c80bca7615e@siemens.com>
From: Luca Miccio <lucmiccio@gmail.com>
Autocrypt: addr=lucmiccio@gmail.com; keydata=
 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
Message-ID: <82b4bddc-5d76-2404-2bdc-4896b4b84012@gmail.com>
Date: Wed, 6 May 2020 18:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2ef61ea7-5617-dcd8-24fe-1c80bca7615e@siemens.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DUWoCugBpv33ObO6Uk2JAO20EkrLPIPPo"
X-Original-Sender: LucMiccio@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=ZWFiZ7pU;       spf=pass
 (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::443
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
--DUWoCugBpv33ObO6Uk2JAO20EkrLPIPPo
Content-Type: multipart/mixed; boundary="dSY5R15i8384KMAdTgY1JGU2ANBRB7PCH"

--dSY5R15i8384KMAdTgY1JGU2ANBRB7PCH
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: base64

DQoNCk9uIDUvNC8yMCA4OjM1IFBNLCBKYW4gS2lzemthIHdyb3RlOg0KPiBPbiAyMS4wNC4yMCAx
MjowMywgJ01hcmNvIFNvbGllcmknIHZpYSBKYWlsaG91c2Ugd3JvdGU6DQo+PiBGcm9tOiBMdWNh
IE1pY2NpbyA8bHVjbWljY2lvQGdtYWlsLmNvbT4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNh
IE1pY2NpbyA8bHVjbWljY2lvQGdtYWlsLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IE1hcmNvIFNv
bGllcmkgPG1zQHh0My5pdD4NCj4+IC0tLQ0KPj4gwqAgY29uZmlncy9hcm02NC96eW5xbXAtemN1
MTAyLWlubWF0ZS1kZW1vLWNvbC5jIHzCoCA3OSArKysrKysrKysrKw0KPj4gwqAgY29uZmlncy9h
cm02NC96eW5xbXAtemN1MTAyLWxpbnV4LWRlbW8tY29sLmPCoCB8IDEyOCArKysrKysrKysrKysr
KysrKysNCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjA3IGluc2VydGlvbnMoKykNCj4+IMKgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2FybTY0L3p5bnFtcC16Y3UxMDItaW5tYXRlLWRlbW8t
Y29sLmMNCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2FybTY0L3p5bnFtcC16Y3Ux
MDItbGludXgtZGVtby1jb2wuYw0KPj4NCj4+IGRpZmYgLS1naXQgYS9jb25maWdzL2FybTY0L3p5
bnFtcC16Y3UxMDItaW5tYXRlLWRlbW8tY29sLmMNCj4+IGIvY29uZmlncy9hcm02NC96eW5xbXAt
emN1MTAyLWlubWF0ZS1kZW1vLWNvbC5jDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5k
ZXggMDAwMDAwMDAuLjgzMTg4YjI3DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9jb25maWdz
L2FybTY0L3p5bnFtcC16Y3UxMDItaW5tYXRlLWRlbW8tY29sLmMNCj4+IEBAIC0wLDAgKzEsNzkg
QEANCj4+ICsvKg0KPj4gKyAqIEphaWxob3VzZSwgYSBMaW51eC1iYXNlZCBwYXJ0aXRpb25pbmcg
aHlwZXJ2aXNvcg0KPj4gKyAqDQo+PiArICogQ29uZmlndXJhdGlvbiBmb3IgZGVtbyBpbm1hdGUg
b24gWGlsaW54IFp5bnFNUCBaQ1UxMDIgZXZhbCBib2FyZDoNCj4+ICsgKiAxIENQVSwgNjRLIFJB
TSwgMSBzZXJpYWwgcG9ydCwgY29sb3IgcmFuZ2UgWzAtN10NCj4+ICsgKg0KPj4gKyAqIENvcHly
aWdodCAoYykgVW5pdmVyc2l0YScgZGVnbGkgU3R1ZGkgZGkgTW9kZW5hIGUgUmVnZ2lvIEVtaWxp
YSAyMDIwDQo+PiArICoNCj4+ICsgKiBBdXRob3JzOg0KPj4gKyAqwqAgTHVjYSBNaWNjaW8gPGx1
Y21pY2Npb0BnbWFpbC5jb20+DQo+PiArICoNCj4+ICsgKiBUaGlzIHdvcmsgaXMgbGljZW5zZWQg
dW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR1BMLCB2ZXJzaW9uIDIuwqAgU2VlDQo+PiArICog
dGhlIENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4NCj4+ICsgKi8NCj4+
ICsNCj4+ICsjaW5jbHVkZSA8amFpbGhvdXNlL3R5cGVzLmg+DQo+PiArI2luY2x1ZGUgPGphaWxo
b3VzZS9jZWxsLWNvbmZpZy5oPg0KPj4gKw0KPj4gK3N0cnVjdCB7DQo+PiArwqDCoMKgIHN0cnVj
dCBqYWlsaG91c2VfY2VsbF9kZXNjIGNlbGw7DQo+PiArwqDCoMKgIF9fdTY0IGNwdXNbMV07DQo+
PiArwqDCoMKgIHN0cnVjdCBqYWlsaG91c2VfbWVtb3J5IG1lbV9yZWdpb25zWzNdOw0KPj4gK8Kg
wqDCoCBzdHJ1Y3QgamFpbGhvdXNlX2NhY2hlIGNhY2hlX3JlZ2lvbnNbMV07DQo+PiArfSBfX2F0
dHJpYnV0ZV9fKChwYWNrZWQpKSBjb25maWcgPSB7DQo+PiArwqDCoMKgIC5jZWxsID0gew0KPj4g
K8KgwqDCoMKgwqDCoMKgIC5zaWduYXR1cmUgPSBKQUlMSE9VU0VfQ0VMTF9ERVNDX1NJR05BVFVS
RSwNCj4+ICvCoMKgwqDCoMKgwqDCoCAucmV2aXNpb24gPSBKQUlMSE9VU0VfQ09ORklHX1JFVklT
SU9OLA0KPj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1lID0gImlubWF0ZS1kZW1vLWNvbCIsDQo+PiAr
wqDCoMKgwqDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNFX0NFTExfUEFTU0lWRV9DT01NUkVHLA0K
Pj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgIC5jcHVfc2V0X3NpemUgPSBzaXplb2YoY29uZmlnLmNw
dXMpLA0KPj4gK8KgwqDCoMKgwqDCoMKgIC5udW1fbWVtb3J5X3JlZ2lvbnMgPSBBUlJBWV9TSVpF
KGNvbmZpZy5tZW1fcmVnaW9ucyksDQo+PiArwqDCoMKgwqDCoMKgwqAgLm51bV9pcnFjaGlwcyA9
IDAsDQo+PiArwqDCoMKgwqDCoMKgwqAgLm51bV9wY2lfZGV2aWNlcyA9IDAsDQo+PiArwqDCoMKg
wqDCoMKgwqAgLm51bV9jYWNoZV9yZWdpb25zID0gQVJSQVlfU0laRShjb25maWcuY2FjaGVfcmVn
aW9ucyksDQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgLmNvbnNvbGUgPSB7DQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAuYWRkcmVzcyA9IDB4ZmYwMTAwMDAsDQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAudHlwZSA9IEpBSUxIT1VTRV9DT05fVFlQRV9YVUFSVFBTLA0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNFX0NPTl9BQ0NFU1NfTU1JTyB8DQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSkFJTEhPVVNFX0NPTl9SRUdESVNU
XzQsDQo+PiArwqDCoMKgwqDCoMKgwqAgfSwNCj4+ICvCoMKgwqAgfSwNCj4+ICsNCj4+ICvCoMKg
wqAgLmNwdXMgPSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgMHgyLA0KPj4gK8KgwqDCoCB9LA0KPj4g
Kw0KPj4gK8KgwqDCoCAubWVtX3JlZ2lvbnMgPSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgLyogVUFS
VCAqLyB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucGh5c19zdGFydCA9IDB4ZmYwMTAw
MDAsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAudmlydF9zdGFydCA9IDB4ZmYwMTAwMDAs
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2l6ZSA9IDB4MTAwMCwNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9N
RU1fV1JJVEUgfA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBKQUlMSE9VU0Vf
TUVNX0lPIHwgSkFJTEhPVVNFX01FTV9ST09UU0hBUkVELA0KPj4gK8KgwqDCoMKgwqDCoMKgIH0s
DQo+PiArwqDCoMKgwqDCoMKgwqAgLyogUkFNICovIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC5waHlzX3N0YXJ0ID0gMHg4MDA2MDAwMDAsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAudmlydF9zdGFydCA9IDAsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2l6ZSA9wqAg
MHgwMDAxMDAwMCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5mbGFncyA9IEpBSUxIT1VT
RV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBKQUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVNX0xPQURB
QkxFIHwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSkFJTEhPVVNFX01FTV9D
T0xPUkVELA0KPj4gK8KgwqDCoMKgwqDCoMKgIH0sDQo+PiArwqDCoMKgwqDCoMKgwqAgLyogY29t
bXVuaWNhdGlvbiByZWdpb24gKi8gew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnZpcnRf
c3RhcnQgPSAweDgwMDAwMDAwLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNpemUgPSAw
eDAwMDAxMDAwLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNF
X01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEpBSUxIT1VTRV9NRU1fQ09NTV9SRUdJT04sDQo+PiArwqDCoMKgwqDCoMKg
wqAgfSwNCj4+ICvCoMKgwqAgfSwNCj4+ICsNCj4+ICvCoMKgwqAgLmNhY2hlX3JlZ2lvbnMgPSB7
DQo+PiArwqDCoMKgwqDCoMKgwqAgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnN0YXJ0
ID0gMCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaXplID0gOCwNCj4+ICvCoMKgwqDC
oMKgwqDCoCB9LA0KPj4gK8KgwqDCoCB9LA0KPj4gK307DQo+PiBkaWZmIC0tZ2l0IGEvY29uZmln
cy9hcm02NC96eW5xbXAtemN1MTAyLWxpbnV4LWRlbW8tY29sLmMNCj4+IGIvY29uZmlncy9hcm02
NC96eW5xbXAtemN1MTAyLWxpbnV4LWRlbW8tY29sLmMNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+PiBpbmRleCAwMDAwMDAwMC4uNjZmMTJhNjYNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBi
L2NvbmZpZ3MvYXJtNjQvenlucW1wLXpjdTEwMi1saW51eC1kZW1vLWNvbC5jDQo+PiBAQCAtMCww
ICsxLDEyOCBAQA0KPj4gKy8qDQo+PiArICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRp
dGlvbmluZyBoeXBlcnZpc29yDQo+PiArICoNCj4+ICsgKiBDb25maWd1cmF0aW9uIGZvciBsaW51
eC1kZW1vIGlubWF0ZSBvbiBaeW5xTVAgWkNVMTAyOg0KPj4gKyAqIDIgQ1BVcywgMTI4TSBSQU0s
IHNlcmlhbCBwb3J0IDIsIGNvbG9yIHJhbmdlIFswLTddDQo+PiArICoNCj4+ICsgKiBDb3B5cmln
aHQgKGMpIFVuaXZlcnNpdGEnIGRlZ2xpIFN0dWRpIGRpIE1vZGVuYSBlIFJlZ2dpbyBFbWlsaWEg
MjAyMA0KPj4gKyAqDQo+PiArICogQXV0aG9yczoNCj4+ICsgKsKgIEx1Y2EgTWljY2lvIDxsdWNt
aWNjaW9AZ21haWwuY29tPg0KPj4gKyAqDQo+PiArICogVGhpcyB3b3JrIGlzIGxpY2Vuc2VkIHVu
ZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgdmVyc2lvbiAyLsKgIFNlZQ0KPj4gKyAqIHRo
ZSBDT1BZSU5HIGZpbGUgaW4gdGhlIHRvcC1sZXZlbCBkaXJlY3RvcnkuDQo+PiArICovDQo+PiAr
DQo+PiArI2luY2x1ZGUgPGphaWxob3VzZS90eXBlcy5oPg0KPj4gKyNpbmNsdWRlIDxqYWlsaG91
c2UvY2VsbC1jb25maWcuaD4NCj4+ICsNCj4+ICtzdHJ1Y3Qgew0KPj4gK8KgwqDCoCBzdHJ1Y3Qg
amFpbGhvdXNlX2NlbGxfZGVzYyBjZWxsOw0KPj4gK8KgwqDCoCBfX3U2NCBjcHVzWzFdOw0KPj4g
K8KgwqDCoCBzdHJ1Y3QgamFpbGhvdXNlX21lbW9yeSBtZW1fcmVnaW9uc1sxMl07DQo+PiArwqDC
oMKgIHN0cnVjdCBqYWlsaG91c2VfY2FjaGUgY2FjaGVfcmVnaW9uc1sxXTsNCj4+ICvCoMKgwqAg
c3RydWN0IGphaWxob3VzZV9pcnFjaGlwIGlycWNoaXBzWzFdOw0KPj4gK8KgwqDCoCBzdHJ1Y3Qg
amFpbGhvdXNlX3BjaV9kZXZpY2UgcGNpX2RldmljZXNbMl07DQo+PiArfSBfX2F0dHJpYnV0ZV9f
KChwYWNrZWQpKSBjb25maWcgPSB7DQo+PiArwqDCoMKgIC5jZWxsID0gew0KPj4gK8KgwqDCoMKg
wqDCoMKgIC5zaWduYXR1cmUgPSBKQUlMSE9VU0VfQ0VMTF9ERVNDX1NJR05BVFVSRSwNCj4+ICvC
oMKgwqDCoMKgwqDCoCAucmV2aXNpb24gPSBKQUlMSE9VU0VfQ09ORklHX1JFVklTSU9OLA0KPj4g
K8KgwqDCoMKgwqDCoMKgIC5uYW1lID0gIlp5bnFNUC1saW51eC1kZW1vLWNvbCIsDQo+PiArwqDC
oMKgwqDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNFX0NFTExfUEFTU0lWRV9DT01NUkVHLA0KPj4g
Kw0KPj4gK8KgwqDCoMKgwqDCoMKgIC5jcHVfc2V0X3NpemUgPSBzaXplb2YoY29uZmlnLmNwdXMp
LA0KPj4gK8KgwqDCoMKgwqDCoMKgIC5udW1fbWVtb3J5X3JlZ2lvbnMgPSBBUlJBWV9TSVpFKGNv
bmZpZy5tZW1fcmVnaW9ucyksDQo+PiArwqDCoMKgwqDCoMKgwqAgLm51bV9pcnFjaGlwcyA9IEFS
UkFZX1NJWkUoY29uZmlnLmlycWNoaXBzKSwNCj4+ICvCoMKgwqDCoMKgwqDCoCAubnVtX3BjaV9k
ZXZpY2VzID0gQVJSQVlfU0laRShjb25maWcucGNpX2RldmljZXMpLA0KPj4gK8KgwqDCoMKgwqDC
oMKgIC5udW1fY2FjaGVfcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLmNhY2hlX3JlZ2lvbnMp
LA0KPj4gK8KgwqDCoMKgwqDCoMKgIC52cGNpX2lycV9iYXNlID0gMTQwLTMyLA0KPj4gKw0KPj4g
K8KgwqDCoMKgwqDCoMKgIC5jb25zb2xlID0gew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LmFkZHJlc3MgPSAweGZmMDEwMDAwLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnR5cGUg
PSBKQUlMSE9VU0VfQ09OX1RZUEVfWFVBUlRQUywNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5mbGFncyA9IEpBSUxIT1VTRV9DT05fQUNDRVNTX01NSU8gfA0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEpBSUxIT1VTRV9DT05fUkVHRElTVF80LA0KPj4gK8KgwqDCoMKg
wqDCoMKgIH0sDQo+PiArwqDCoMKgIH0sDQo+PiArDQo+PiArwqDCoMKgIC5jcHVzID0gew0KPj4g
K8KgwqDCoMKgwqDCoMKgIDB4YywNCj4+ICvCoMKgwqAgfSwNCj4+ICsNCj4+ICvCoMKgwqAgLm1l
bV9yZWdpb25zID0gew0KPj4gK8KgwqDCoMKgwqDCoMKgIC8qIElWU0hNRU0gc2hhcmVkIG1lbW9y
eSByZWdpb24gZm9yIDAwOjAxLjAgKi8NCj4+ICvCoMKgwqDCoMKgwqDCoCBKQUlMSE9VU0VfU0hN
RU1fTkVUX1JFR0lPTlMoMHg4MDA0MDAwMDAsIDEpLA0KPj4gK8KgwqDCoMKgwqDCoMKgIC8qIElW
U0hNRU0gc2hhcmVkIG1lbW9yeSByZWdpb24gZm9yIDAwOjAzLjAgKi8NCj4+ICvCoMKgwqDCoMKg
wqDCoCBKQUlMSE9VU0VfU0hNRU1fTkVUX1JFR0lPTlMoMHg4MDA3MDAwMDAsIDApLA0KPj4gK8Kg
wqDCoMKgwqDCoMKgIC8qIFVBUlQgKi8gew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnBo
eXNfc3RhcnQgPSAweGZmMDEwMDAwLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnZpcnRf
c3RhcnQgPSAweGZmMDEwMDAwLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNpemUgPSAw
eDEwMDAsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVN
X1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgSkFJTEhPVVNFX01FTV9JTyB8IEpBSUxIT1VTRV9NRU1fUk9PVFNIQVJFRCwNCj4+
ICvCoMKgwqDCoMKgwqDCoCB9LA0KPj4gK8KgwqDCoMKgwqDCoMKgIC8qIFJBTSAqLyB7DQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucGh5c19zdGFydCA9IDB4ODAwNjAwMDAwLA0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnZpcnRfc3RhcnQgPSAwLA0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLnNpemUgPSAweDEwMDAwLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZs
YWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8DQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEpBSUxIT1VTRV9NRU1fRVhFQ1VURSB8IEpBSUxI
T1VTRV9NRU1fTE9BREFCTEUsDQo+PiArwqDCoMKgwqDCoMKgwqAgfSwNCj4+ICvCoMKgwqDCoMKg
wqDCoCAvKiBSQU0gKi8gew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnBoeXNfc3RhcnQg
PSAweDgxMDAwMDAwMCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC52aXJ0X3N0YXJ0ID0g
MHg4MTAwMDAwMCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaXplID0gMHg4MDAwMDAw
LA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFE
IHwgSkFJTEhPVVNFX01FTV9XUklURSB8DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIEpBSUxIT1VTRV9NRU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fRE1BIHwNCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSkFJTEhPVVNFX01FTV9MT0FEQUJMRSB8IEpBSUxI
T1VTRV9NRU1fQ09MT1JFRCwNCj4+ICvCoMKgwqDCoMKgwqDCoCB9LA0KPj4gK8KgwqDCoMKgwqDC
oMKgIC8qIGNvbW11bmljYXRpb24gcmVnaW9uICovIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC52aXJ0X3N0YXJ0ID0gMHg4MDAwMDAwMCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5zaXplID0gMHgwMDAwMTAwMCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5mbGFncyA9
IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfA0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBKQUlMSE9VU0VfTUVNX0NPTU1fUkVHSU9OLA0KPj4gK8Kg
wqDCoMKgwqDCoMKgIH0sDQo+PiArwqDCoMKgIH0sDQo+PiArDQo+PiArwqDCoMKgIC5jYWNoZV9y
ZWdpb25zID0gew0KPj4gK8KgwqDCoMKgwqDCoMKgIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC5zdGFydCA9IDAsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2l6ZSA9IDgsDQo+
PiArwqDCoMKgwqDCoMKgwqAgfSwNCj4+ICvCoMKgwqAgfSwNCj4+ICsNCj4+ICvCoMKgwqAgLmly
cWNoaXBzID0gew0KPj4gK8KgwqDCoMKgwqDCoMKgIC8qIEdJQyAqLyB7DQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAuYWRkcmVzcyA9IDB4ZjkwMTAwMDAsDQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAucGluX2Jhc2UgPSAzMiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5waW5f
Yml0bWFwID0gew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxIDw8ICg1NCAt
IDMyKSwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCwNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKDEgPDwgKDE0MSAtIDEyOCkpIHwgKDEgPDwgKDE0MyAtIDEyOCkpDQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9LA0KPj4gK8KgwqDCoMKgwqDCoMKgIH0sDQo+PiArwqDCoMKgIH0s
DQo+PiArDQo+PiArwqDCoMKgIC5wY2lfZGV2aWNlcyA9IHsNCj4+ICvCoMKgwqDCoMKgwqDCoCAv
KiAwMDowMS4wICovIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC50eXBlID0gSkFJTEhP
VVNFX1BDSV9UWVBFX0lWU0hNRU0sDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuYmRmID0g
MSA8PCAzLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmJhcl9tYXNrID0gSkFJTEhPVVNF
X0lWU0hNRU1fQkFSX01BU0tfSU5UWCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaG1l
bV9yZWdpb25zX3N0YXJ0ID0gMCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaG1lbV9k
ZXZfaWQgPSAxLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNobWVtX3BlZXJzID0gMiwN
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaG1lbV9wcm90b2NvbCA9IEpBSUxIT1VTRV9T
SE1FTV9QUk9UT19WRVRILA0KPj4gK8KgwqDCoMKgwqDCoMKgIH0sDQo+PiArwqDCoMKgwqDCoMKg
wqAgLyogMDA6MDMuMCAqLyB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAudHlwZSA9IEpB
SUxIT1VTRV9QQ0lfVFlQRV9JVlNITUVNLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmJk
ZiA9IDMgPDwgMywNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5iYXJfbWFzayA9IEpBSUxI
T1VTRV9JVlNITUVNX0JBUl9NQVNLX0lOVFgsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
c2htZW1fcmVnaW9uc19zdGFydCA9IDQsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2ht
ZW1fZGV2X2lkID0gMCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaG1lbV9wZWVycyA9
IDIsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2htZW1fcHJvdG9jb2wgPSBKQUlMSE9V
U0VfU0hNRU1fUFJPVE9fVkVUSCwNCj4+ICvCoMKgwqDCoMKgwqDCoCB9LA0KPj4gK8KgwqDCoCB9
LA0KPj4gKw0KPj4gK307DQo+Pg0KPiANCj4gWW91IGFyZW4ndCBzZXR0aW5nIHlvdXIgLmNvbF9s
b2FkX2FkZHJlc3MgLSBJIHN1c3BlY3QgdGhpcyB3aWxsIGV4cGxvZGUNCj4gdGhlbiwgbm8/DQo+
IA0KDQpOby4gV2UgYXJlIG5vdCBzZXR0aW5nIGNvbF9sb2FkX2FkZHJlc3MgYmVjYXVzZSB0aGUg
ZGVmYXVsdCB2YWx1ZSBkb2VzDQpub3QgaW50ZXJmZXJlIHdpdGggWkNVMTAyIG1lbW9yeSBsYXlv
dXQuDQoNCj4gQmVzaWRlcyB0aGF0LCB1c2luZyB0aGlzIG9uIHRoZSB1bHRyYTk2IHNob3VsZCBi
ZSBzdHJhaWdodGZvcndhcmQsDQo+IHJpZ2h0PyBXb3VsZCBtYWtlIGEgZGVtbyBjYXNlIGZvciBq
YWlsaG91c2UtaW1hZ2VzLiBPciB3ZSBldmVuIGNvbmZpZ3VyZQ0KPiBzb21lIG1vcmUgZGlmZmVy
ZW50IHRhcmdldC4NCj4gDQoNClllcy4gWW91IGNhbiB1c2UgaXQgZm9yIHVsdHJhOTYgYnV0IEkg
ZG9uJ3Qga25vdyBpZiB0aGUgZGVmYXVsdCB2YWx1ZSBvZg0KY29sX2xvYWRfYWRkcmVzcyBpcyBj
b3JyZWN0IGZvciB0aGUgYm9hcmQuIEkga25vdyB0aGF0IHRoZSBTT0MgaXMgdGhlDQpzYW1lIGJ1
dCBtYXliZSBJIHdvdWxkIGNoZWNrIHRoZSBtZW1vcnkgbGF5b3V0IGZpcnN0Lg0KDQpUaGFua3Ms
DQpMdWNhDQoNCj4gSmFuDQo+IA0KDQotLSAKWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNh
dXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAiSmFpbGhvdXNlIiBn
cm91cC4KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBl
bWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBqYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb20uClRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlz
aXQgaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvODJiNGJk
ZGMtNWQ3Ni0yNDA0LTJiZGMtNDg5NmI0Yjg0MDEyJTQwZ21haWwuY29tLgo=
--dSY5R15i8384KMAdTgY1JGU2ANBRB7PCH--

--DUWoCugBpv33ObO6Uk2JAO20EkrLPIPPo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+VQtGnhP9TTQ2NnBI/rjb1Ch6KsFAl6y6T4ACgkQI/rjb1Ch
6KtxTxAArqtDjOSN2FpOMFlrix08+U2RbT9MFLoR9F6IOtWrzFDh9Bw9GR7HMdC+
RizILnNpRQugq8JUylgdG9LH1syvk1uQp7SgXDZmGaTszRHML9LDpl487H2IyqqV
L+TSCmpCQubuDA/wG/Vqj3J+jP8r/7Tk93MDQgH2MCLOZIOcuWDK4XtsCWFA/XJL
ApU2z4ktyskaBYy/m4TR+Ud9VnJHfddFBpRd71A67aT0DT5Wh9UutN60USOQNk5G
1YN6XMVjxM2wzctlxwJPia+lpx3hbrsY5plNmheCp/WQEBoYV911P8uvNYdhUELy
zTKnntENXDnrOWYS5dM8Ntkyj7lzABRBzMOlbJYE3T8nmxIL4MoEb7wQADtF1loa
5U89c7U7xXUTNn5o+QAb3n7DgcKZqqpafWhCFqMFzwzfAvXLcq/05VU8rj8NEaVF
uUnwb8ZimiU2Hgz3Gz6UkjYR/MzfkxNTa/56pnpQUhECkfREalcYkBknr1zzBNnN
rnVlfrI1ezoJCsp/BW416tBItGg5kPlQzZ8OLl+Q8fjCKmEVBNlcKJ4BvLVoVtJb
qLsIH/S5WiD5Wm0z1GFayFoUreNqCelxXcVnFyVTtubrxbbLElPHJPipxZmUz3DL
lLycsvuLi+M8wFL+6dTlT1x9S7rtoBNlMDilXfEeBmx99FcEdA0=
=qrJw
-----END PGP SIGNATURE-----

--DUWoCugBpv33ObO6Uk2JAO20EkrLPIPPo--
