Return-Path: <jailhouse-dev+bncBDW4XN5C2MCRBWN7SKJAMGQEU4LUTNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3b.google.com (mail-io1-xd3b.google.com [IPv6:2607:f8b0:4864:20::d3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D66A4ECBC9
	for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Mar 2022 20:22:19 +0200 (CEST)
Received: by mail-io1-xd3b.google.com with SMTP id g16-20020a05660226d000b00638d8e1828bsf14963803ioo.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Mar 2022 11:22:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1648664538; cv=pass;
        d=google.com; s=arc-20160816;
        b=hknET+gTzdu2/F/Vl0gt2NrH6GD5m/XmUPT2yfWvD7D0ahUNDFokq8hJj2nsVA/pAf
         zzlDmMOb9CcMj9lvC4Dqv7EF945XidVMKiYwW5eecB4xBKKDfnzHo9HIHbr1Fq+mYeGB
         NlFuaP2XvCkbEep5ECTYID1OgLWPy+aq2c7f5K8y4uMPx9WUl+jryJnhcAiJqgb7A5b6
         WeqnQPHrOhOwNLb2j4hCZQUvwEylJJBMVtviKXBN38YQPOl+gFQscayMwyEtjiajxpY/
         xBGtOze7Wl4A+RGOiOCAplzD9Iv0cpmfnuLtxXTFw6u0Gqj/E1gzH1TMuacbm+zcoThK
         nDeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:sender:reply-to:mime-version
         :dkim-signature;
        bh=LYnL6EdUgOLnfLz25+7FjD0V+BPNPRSjJTirtxq0btU=;
        b=MDRMtB5J2jA4R9aFVjTuF8GDZhSh5cMvfdNpRz0agBztpFZeVpQ81biSbxOKGvF1YR
         JYUP/AeUwrKxrpn50z54W3VKUTLQCS41lOQ7zwteNhBQM/9fkeMGOPJNGz+FbZ+CIGhW
         UzCJp9fW1BCdlNQmt/9qMSamAOLEeD6EMr7I2DjdrUNTYw7dTz1guC3KPOjz3DMmx+5k
         lToe9cXSxGTNrqY+FY1t2GvTV8kpDj94yVkv98Ubq28rFR7EWdx3CoiGPGu4MSfjiXqs
         /xU4Zu2rKJnPeO2d1VK05beFH65DPfA5oVdecQzu7ka2EQRRJBszUnsWOeoNiHOIkUIT
         aMeg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ewmOIihs;
       spf=pass (google.com: domain of 040stherchurch@gmail.com designates 2607:f8b0:4864:20::52e as permitted sender) smtp.mailfrom=040stherchurch@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LYnL6EdUgOLnfLz25+7FjD0V+BPNPRSjJTirtxq0btU=;
        b=NqhoINa/WwuO1zCkjiUnrlvh4FTQ2wQAf1w96xmC9KZ7W3RLlfJxxXbjOCmPK0gst3
         ygyLxF6xlc2/6FNAAwUYhlLngj6fio/2P6VF2oGD2/tYJFvcIu0/GAEkZkMShGFKk/m/
         0Athpj8ENgOxB6XAAmJM5UmxI75PG47Rd6mBpsX3TOax3K7L2GuLmPnXkGQctGhWww+b
         dabHZQUKwvOXLA5kxESIG+OBXUZjmmkEfYotu8Y4ZfLV2bcRLBaxze01U0lSTWO+DDDQ
         VpQ8W0otjXBQu1rgQbTFoua/nk+XJz6mNJqgI9iVv3V54d6bW6UxmoF720roDbYTGk14
         bmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LYnL6EdUgOLnfLz25+7FjD0V+BPNPRSjJTirtxq0btU=;
        b=4uHQGviGX6LicAj9dJX39EGgAKzxTLuZ7oOB2g+o7P8Bfq7iIvkB/zNbcGX/QW6s1L
         e2x733FF3DYIVuQ4Vz6V1wtDvN5wnpurUjCCkR+Ae4hF+yx/6Yutrln3cO+IublvFL1Q
         xFZH7yJ45gf3tfxkvHTvDoJkxaOQfihu8kKIYIUNEu4sUlrPc4cq+H4C165uL2VyoiVT
         klGwg57IGNDacEaIFxLbz+nriOFs51+uhUQRzaJDDCoOtQNeYfqdcvo2W3aj4C03UX3V
         RqFd2T+RsxmXEXQoMi3w/aGHHDcZQxPVKOZ0EX3uGjF8D5R3A1CYqUlG+/MUT4CL6Ghk
         EBPQ==
X-Gm-Message-State: AOAM530/V5UP/1laIjXXtqDecOQsNeaeN/XOBow8GAvWfJXb2BS4Y/BO
	YC1i+IIqfHZ36ZUFx13MBIA=
X-Google-Smtp-Source: ABdhPJw7txP5BP+i1rPQHg+3jUlB2rBW58nDzhrfiaZm8z9pvF//UBdVyUS4L6VzMZe+h2yPbKNLJw==
X-Received: by 2002:a05:6638:2391:b0:323:5c00:5424 with SMTP id q17-20020a056638239100b003235c005424mr645406jat.125.1648664538195;
        Wed, 30 Mar 2022 11:22:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6602:2983:b0:649:4233:768d with SMTP id
 o3-20020a056602298300b006494233768dls365169ior.2.gmail; Wed, 30 Mar 2022
 11:22:17 -0700 (PDT)
X-Received: by 2002:a5d:9a0a:0:b0:648:c8a4:c86 with SMTP id s10-20020a5d9a0a000000b00648c8a40c86mr12272081iol.168.1648664537587;
        Wed, 30 Mar 2022 11:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648664537; cv=none;
        d=google.com; s=arc-20160816;
        b=hCZtlUP1FCxZj51GVKmXtYXFoBv7EM/QMQWRbk97ZntpnNCMK2cdra6c5d2ZWr8X5v
         NXdErkoQYOGbg9IdFFZzb1bes/kLNmSoVr3B3nh7OgZceJzORS+ETUOTZM1qQrkOvLxI
         WWizS+jPN5tWXlKmls7BG6O7KGzyZJIWojeo9nJEoUfUXeFFiGPws9lrnH1j1vpxsoD3
         3D9OMR/w6vTx0+0QkFoc8W0S4GduxVztjp0H6gbZNLKPwVA7h7dBPW+H/IIS5baGwLVz
         T8nBMqCgYbZvdAuxMMg8Cf9QUMOxN3yuokblP51AEpz7dnMLCP1a6B289c3UFKhaXMzM
         lR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:dkim-signature;
        bh=6PnxJaVdYHTfEoSreao3ANO+XeqxY/p/4dxKSObIH1I=;
        b=gP89/XCTszpNxcBkIxBK5Snk9+dAr3qzZ2v+E7g2hVM+j5RJ+j7RSmyn9xgclMvrRN
         PVGj1WAB9aJdPurBtSYxVNGdX1t2ez1u7KAvMwFpJA3mBSZEL+MA2i72UyiprQvtllFl
         +SB16NsuquiYr8QuRy38TpkY2kWkI/zHioahLgc3va8ni55L30jXoCUQkfAUHNe+KJr8
         ZTP6MIWvdFKN/pUA6vE9JxtvmIsILDOHTbYciax7S3n1OE3SHsjxERdednHOR7D0eJLL
         wQpqXe2pdv516Ik5YvJmIQcKrX+NqBcyfYGN02TiFU40tlnfkwLZB7xEQCXJGtoUX7gI
         Tr2A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ewmOIihs;
       spf=pass (google.com: domain of 040stherchurch@gmail.com designates 2607:f8b0:4864:20::52e as permitted sender) smtp.mailfrom=040stherchurch@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com. [2607:f8b0:4864:20::52e])
        by gmr-mx.google.com with ESMTPS id y11-20020a05663824cb00b00319f24825f4si1454615jat.0.2022.03.30.11.22.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 11:22:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of 040stherchurch@gmail.com designates 2607:f8b0:4864:20::52e as permitted sender) client-ip=2607:f8b0:4864:20::52e;
Received: by mail-pg1-x52e.google.com with SMTP id z128so18194340pgz.2
        for <jailhouse-dev@googlegroups.com>; Wed, 30 Mar 2022 11:22:17 -0700 (PDT)
X-Received: by 2002:a63:a66:0:b0:373:c36b:e500 with SMTP id
 z38-20020a630a66000000b00373c36be500mr7108706pgk.419.1648664536518; Wed, 30
 Mar 2022 11:22:16 -0700 (PDT)
MIME-Version: 1.0
Reply-To: isabellasayouba0@gmail.com
Sender: 040stherchurch@gmail.com
Received: by 2002:a05:6a20:691d:b0:76:6cf5:d552 with HTTP; Wed, 30 Mar 2022
 11:22:15 -0700 (PDT)
From: Mrs Isabella Sayouba <isabellasayouba0@gmail.com>
Date: Wed, 30 Mar 2022 18:22:15 +0000
Message-ID: <CAAzQq77EN5Y-a311tCNfRr0BAoJG-9et1VgzeGKpN1h_ThbOAw@mail.gmail.com>
Subject: =?UTF-8?B?44GC44GE44GV44Gk44CC?=
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Original-Sender: isabellasayouba0@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=ewmOIihs;       spf=pass
 (google.com: domain of 040stherchurch@gmail.com designates
 2607:f8b0:4864:20::52e as permitted sender) smtp.mailfrom=040stherchurch@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

44GC44GE44GV44Gk44CCDQoNCua2meOCkua1geOBl+OBquOBjOOCieOBk+OBruODoeODvOODq+OC
kuabuOOBhOOBpuOBhOOBvuOBmeOAguengeOBruebruOBq+OBr+Wkp+OBjeOBquaCsuOBl+OBv+OB
jOOBguOCiuOBvuOBmeOAguengeOBruWQjeWJjeOBr+OCpOOCtuODmeODqeODu+OCteODqOOCpuOD
kOOBleOCk+OBp+OBmeOAguODgeODpeODi+OCuOOCouWHuui6q+OBp+OAgeODluODq+OCreODiuOD
leOCoeOCveOBrueXhemZouOBi+OCiemAo+e1oeOCkuWPluOCiuOBvuOBmeOAguengeOBr+OBguOB
quOBn+OBq+W/g+OCkumWi+OBhOOBpuaEn+WLleOBl+OBn+OBruOBp+OAgeOBguOBquOBn+OBq+ip
seOBmeS7peWkluOBq+mBuOaKnuiCouOBr+OBguOCiuOBvuOBm+OCk+OAguengeOBr+OAgTIwMTHl
ubTjgavkuqHjgY/jgarjgovliY3jgavjg5bjg6vjgq3jg4rjg5XjgqHjgr3jga7jg4Hjg6Xjg4vj
grjjgqLlpKfkvb/jgag55bm06ZaT5YON44GE44Gm44GE44GfU2F5b3ViYQ0KQnJvd27msI/jgajn
tZDlqZrjgZfjgb7jgZfjgZ/jgILlrZDkvpvjgarjgZfjgacxMeW5tOmWk+e1kOWpmuOBl+OBn+OA
gg0KDQrlvbzjga/jgZ/jgaPjgZ815pel6ZaT57aa44GE44Gf55+t44GE55eF5rCX44Gu5b6M44Gn
5q2744Gr44G+44GX44Gf44CC5b2844Gu5q275b6M44CB56eB44Gv5YaN5ama44GX44Gq44GE44GT
44Go44Gr5rG644KB44G+44GX44Gf44CC5Lqh44GP44Gq44Gj44Gf5aSr44GM55Sf44GN44Gm44GE
44Gf44Go44GN44CB5b2844Gv57eP6aGNODUw5LiH44OJ44Or44KS6aCQ44GR44G+44GX44Gf44CC
DQrvvIg4MDDkuIc1MDAw44OJ44Or77yJ6KW/44Ki44OV44Oq44Kr44Gu44OW44Or44Kt44OK44OV
44Kh44K944Gu6aaW6YO944Ov44Ks44OJ44Kl44Kw44O844Gu6YqA6KGM44Gn44CC54++5Zyo44CB
44GT44Gu44GK6YeR44Gv44G+44Gg6YqA6KGM44Gr44GC44KK44G+44GZ44CC5b2844Gv44GT44Gu
44GK6YeR44KS44OW44Or44Kt44OK44OV44Kh44K944Gu6Ymx5qWt44GL44KJ44Gu6YeR44Gu6Ly4
5Ye644Gr5Yip55So44Gn44GN44KL44KI44GG44Gr44GX44G+44GX44Gf44CCDQoNCuacgOi/keOA
geengeOBruWMu+iAheOBr+engeOBjOeZjOOBqOiEs+WNkuS4reOBruWVj+mhjOOBruOBn+OCgeOB
qzfjg7bmnIjplpPjga/ntprjgYvjgarjgYTjgaDjgo3jgYbjgajnp4HjgavoqIDjgYTjgb7jgZfj
gZ/jgILnp4HjgpLmnIDjgoLmgqnjgb7jgZvjgabjgYTjgovjga7jga/ohLPljZLkuK3jga7nl4Xm
sJfjgafjgZnjgILnp4Hjga7nirbmhYvjgpLnn6XjgaPjgZ/jga7jgafjgIHnp4Hjga/jgZPjga7j
gYrph5HjgpLjgYLjgarjgZ/jgavmuKHjgZfjgabjgIHmgbXjgb7jgozjgarjgYTkurrjgIXjga7k
uJboqbHjgpLjgZnjgovjgZPjgajjgavjgZfjgb7jgZfjgZ/jgILjgYLjgarjgZ/jga/jgZPjga7j
gYrph5HjgpLnp4HjgYzjgZPjgZPjgafmjIfnpLrjgZnjgovmlrnms5XjgafliKnnlKjjgZnjgovj
gafjgZfjgofjgYbjgILnp4Hjga/jgYLjgarjgZ/jgavjgYLjgarjgZ/jga7lgIvkurrnmoTjgark
vb/nlKjjga7jgZ/jgoHjgavnt4/jgYrph5Hjga4zMOODkeODvOOCu+ODs+ODiOOCkuWPluOBo+OB
puassuOBl+OBhOOBp+OBmeOAguOBiumHkeOBrjcw77yF44Gv56eB44Gu5ZCN5YmN44Gn5a2k5YWQ
6Zmi44KS5bu644Gm44CB6YCa44KK44Gu6LKn44GX44GE5Lq644CF44KS5Yqp44GR44KL44Gf44KB
44Gr5L2/44GG44Gn44GX44KH44GG44CC56eB44Gv5a2k5YWQ44Go44GX44Gm6IKy44Gh44G+44GX
44Gf44GM44CB56We44Gu5a6244KS57at5oyB44GZ44KL44Gf44KB44Gg44GR44Gr44CB5a625peP
44Gr44Gv6Kqw44KC44GE44G+44Gb44KT44CC44GT44Gu55eF5rCX44GM56eB44KS44Go44Gm44KC
6Ium44GX44KB44Gf44Gu44Gn44CB56We44GM56eB44Gu572q44KS6LWm44GX44CB5qW95ZyS44Gn
56eB44Gu6a2C44KS5Y+X44GR5YWl44KM44KL44KI44GG44Gr44GT44KM44KS44GX44Gm44GE44KL
44Gu44Gn44GZ44CCDQoNCui/lOS/oeOCkuWPl+OBkeWPluOCiuasoeesrOOAgeODluODq+OCreOD
iuODleOCoeOCveOBrumKgOihjOOBrumAo+e1oeWFiOOCkuOBiuefpeOCieOBm+OBl+OBvuOBmeOA
guOBvuOBn+OAgemKgOihjOOBruePvuWcqOOBruWPl+WPluS6uuOBp+OBguOCi+OBk+OBqOOCkuio
vOaYjuOBmeOCi+aoqemZkOabuOOCkueZuuihjOOBmeOCi+OCiOOBhumKgOihjOmVt+OBq+aMh+ek
uuOBl+OBvuOBmeOAguengeOBjOOBk+OBk+OBp+i/sOOBueOBn+OCiOOBhuOBq+OBguOBquOBn+OB
jOOBneOCjOOBq+W/nOOBmOOBpuihjOWLleOBmeOCi+OBk+OBqOOCkuengeOBq+S/neiovOOBl+OB
puOBj+OBoOOBleOBhOOAgg0KDQrjgqTjgrbjg5njg6njg7vjgrXjg6jjgqbjg5DlpKvkurrjgYvj
gonjgIINCg0KLS0gCllvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1
YnNjcmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMgIkphaWxob3VzZSIgZ3JvdXAuClRvIHVuc3Vi
c2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQs
IHNlbmQgYW4gZW1haWwgdG8gamFpbGhvdXNlLWRldit1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tLgpUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3Jv
dXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBQXpRcTc3RU41WS1hMzExdENO
ZlJyMEJBb0pHLTlldDFWZ3plR0twTjFoX1RoYk9BdyU0MG1haWwuZ21haWwuY29tLgo=
