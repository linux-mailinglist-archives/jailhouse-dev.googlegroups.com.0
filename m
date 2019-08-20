Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBNGK53VAKGQEENHK57A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F39958BC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 09:45:56 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id q45sf3611607eda.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 00:45:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566287156; cv=pass;
        d=google.com; s=arc-20160816;
        b=KShbD5ADF26GLiAOpvL+Fj33ckJQFG7ISsJwVvNajxGuxBm68J0uV6Ua2DqU/4fOxm
         JkUCbX6KgGyGPc+g1PGUbZ6ZV182jGMjMinE4Qgry5/HIIAce4AAgBEG/Uwa4pG2KmJI
         Ci60H2j6Bz01mS/6HZH9GcJr/ZV6y9jpfK1kfGnc4alcHwWU41j+Xpuwo8zhyYufVmsd
         xxG1n5BYdTjr+DJGmkxiSex0kKoECnlrZx4Ni1MxsHYQBD0tGSymEl1DBn4xJobdodVh
         IyuJDrQVECfypIR+9dI9A0fyIrh4lCDL/ysF0uG3KkFqU8/zcVSONLKnXcXJgjHYPeEF
         xl0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=1RKxI9iX/VpzYBiGwlkMxqVusMU/fNtFC3jyEfw7L6I=;
        b=eBUsm3PtvhtfazC1H2NCeRqkN5vyd68YIEeZ9m0O1a0jnxvdkoMNCkrLbQpdRTTrMp
         IdYr7j7z8xW76oI82YLf3iaSu7hIgDooDT1JX48FDclVrkcpiy9IdhJYCephq1IruA0A
         LYDwy7lNKcGG1iiCdMerlUgKGOmtSNc868nHip1ZXlUdjw1sG6yUExdBOYonpw2mfNPg
         g+WEe5JwkIYHvSvDQJsxhpUzla3Z8jC9MuKEBS5APv7spjaU3kLolO/DM075+QjkwB8p
         ac26G8CAcCz7VblSpCM6zdVW3QovBFR7ofxSgBxse5ymHF3SmJp9FTNl5m227U9SxbMx
         zRFA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=DDgNOGcR;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1RKxI9iX/VpzYBiGwlkMxqVusMU/fNtFC3jyEfw7L6I=;
        b=lp7yTvHzsqRbpCHYnP0ZEWDZUDewmYiPQchcSVklo3d0FJgpt2x0sIFFeQ1qtnI3lH
         tlECaYQYdN7zfw5UKa7OudkZ4aFgm2Dr04ezSBkeRUsLYjXyIgmf0UXiSJ326E/iF0hq
         /JG2R7c9qvOJFTswuztgfSXDqgOGLzowHiUifCAtmWPVVZ4Kco4nuJoGPjOC2jXrShC+
         unZGXA8YzF/Jdo46dpv/rcrOtkzodjEL8X96UJTbMjkzT62HOL7YaA4XQcL4D7UsgEh7
         SVeARdeM1q3BkujrUlSw4GFrGlBhM8/1exeQJT3TzJkCJoZA+KczWKOK6ddQzhmpPlFY
         3rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1RKxI9iX/VpzYBiGwlkMxqVusMU/fNtFC3jyEfw7L6I=;
        b=GPoJ3+M/c9egC+kLVhBMHBTLv62pz6dY24nXXQ/1UuIibqd4mVYliWxoYQmDZI7kVJ
         eM8xKGccF7ObeGM+9uvLBvp5oH5Py+5Bryxl3UCdQhM+PMm5cLbp7aj0J7TUdQJjcXef
         ehUYXyVIg9fe6KbcFIBxrJEIQxU/4N4JvKEirIt2+QhP8MXVvS2zk/rAqdo/Kkp6UpOc
         Ktz8tofgXKllozM/lFGuA6s1Bwinzlu49r4wZZzATupAbnZzJcvbFYo+gYh9iZWtAvRT
         KMWVIlq/I7PtmffFM1sxDBkIsN0SpaRHoKZeBrzPxSvMcWU5G8vDABiUv/VM8NC1wCnY
         54lw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU5B8Y4sCZiVJP2STicl0AiCFgxYw5WBK8Q2kURcvIAXZt2WOFH
	dBFJvZwsZKtcTj23vzriU3k=
X-Google-Smtp-Source: APXvYqwwk/+5lhD6DWtIwhS0m2GpMApK2qXAHktz9Sbc1lkLK9st9T8kK6l86M7FABALtmrR/10ArA==
X-Received: by 2002:a17:906:1845:: with SMTP id w5mr6357171eje.53.1566287156151;
        Tue, 20 Aug 2019 00:45:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:27d4:: with SMTP id k20ls2382644ejc.15.gmail; Tue,
 20 Aug 2019 00:45:55 -0700 (PDT)
X-Received: by 2002:a17:906:718:: with SMTP id y24mr24703968ejb.71.1566287155604;
        Tue, 20 Aug 2019 00:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566287155; cv=none;
        d=google.com; s=arc-20160816;
        b=eyjlsm7fPg9CBVKGMjnHWK6tXc7CqTLe5t6HKbthjHh/rgbbJh6mcpQ/YElkCP9eIy
         NI+9K1z+EhGzz8zH/CdcOCJZUAWDQ/fyh6gydyKBXyzm9DwVaFxhrxNtsuAaXs7dfyR8
         FoJDEZaL9jrFoqOoqj+fBdR0HzQeBpJlPmUVPIHWuBtIsB9j5Es8lubL5KM2OmotYudl
         Dft9/0eLGdJKHgRhk6ytv6eY5diZRxgBG63eVnUOJahajFgI8hGZSGCcZUzYdKpadbT1
         9f2BrvM1u2A6iJKwXGlByfWLEdlUOVsFuKlB1HKxp8JTjIPtuuUA8EFtQWEe2OXLXv7Q
         JtmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=198DBGJ11Mp4Cs3sLCEnd3tdaC68A3GAWWBlPwv0N6w=;
        b=IqnCxcLzuZTXa6Ju1E5Z4W+Et6JciGzO2btqoD3daZ8P/rQdVN3a8G2ju87ht93zap
         6DSB1P0UWDdUS737iTIbVHf/c7zYA2vgieWUDy7L5I1PBWOAmjKXhCEkSPJ/7y7UVKaa
         S7PfM4jnkxn48tEKCSOsbvCjnzB4tBBcCRxfA1X+1FLGwYlRtfT8LHLWw920F0niURvi
         dNtPDpnsoG/YVDhFz0kTe+KM7jzkxd9H+lW7CZR9pD6YjooHJ4/PqZ176cG+NgBLdri3
         gNGKJVFNNFnNvoneff4t3+BsUVc2h3KbbJgkF0oCMTBJdSdti8384hBGMTYDiYnlu9LA
         TxCg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=DDgNOGcR;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.20])
        by gmr-mx.google.com with ESMTPS id c11si432293ejr.0.2019.08.20.00.45.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 00:45:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.20 as permitted sender) client-ip=212.227.17.20;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.213] ([212.126.163.234]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6KUT-1iJQUM0281-016fWo; Tue, 20
 Aug 2019 09:45:55 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: iommu translation table length for arm64
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <0d55b247-d84c-fc56-3eff-835388e6b9a0@siemens.com>
Date: Tue, 20 Aug 2019 09:45:54 +0200
Cc: jailhouse-dev@googlegroups.com,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1ABA3D9-DAD1-4412-8D04-BC885C3C6EB9@gmx.de>
References: <56296140-3149-4CD5-BF93-0E27EDE38819@gmx.de>
 <0d55b247-d84c-fc56-3eff-835388e6b9a0@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:AIOWGw5BQ0yB6M8gkUgcqI7G77esT4/26Vjf/cL+p1WuyHmClCs
 4M9jOnWreGG7JyI7LGOHchEQ3shD1HTrMo5lgGgtIeOStfLTpJB6og3ZGY3YsqxJu9h0hY6
 NXjmJiHTdr914A1uR8hy/htpum1H4OUMHlNizROjdzKttGEd9ppBepBze/GZiv0sN1ITC6L
 dmmXzs3lKwdDenNNbM3Lw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d9Rabv+/sHk=:uhiplGj56N58IS5OTVIpC5
 TWlvJhUTd7GgBhiZId9vtgyGqtjgPOl9FPhYnXk/owlMe7hpFRcSkbMsRfNO/C9XF4ufoaJTB
 fkWzQKogTXpdfJ1QMjXhqnwOC4DNdCgrSbHehTgNBN7oeeRkUj0QETmWOMIyFx2q6F5anExM9
 9pkNFnpuOUr/OTwGR39h5MDMRTUADxgybkyTaaLzdXnta+bS4lEPmzKye3CFokVwiJ6TD6qW6
 D4unUF1H8GmdRA/jQ62oALE1aPWB0H26dx0voQ19lTwjFmDc7mguaJkmQBVjKiIzyd3yx0xvC
 WdaJ33AP3gKYaa5jjyQdkBGN+/lhm3LL8lvPIAY/zHjN8jlhWwW9hBM7KKOiUMngvccBIVD3c
 nLLMt6EbaySBQizQPMrgPZ6W61p+QLjucZluUAsbWHOm471klwqIl8zZ4NY2FfEJTMRKEnmhd
 a6wy20oG+YkrXPOILDB2v5AKtUtmF9O5TAHCU8XIlBz7Het2FX9VLmzUXjdiRoXSYnbtHzJvD
 m8hmeqeLOKreNl+pE61C7CY/O/JGAoQR8HFZVOwCffn0mtrYmAQzG5WdrAHm0pKfws1IwoEDq
 snmQ9ctzDKzr+QBwsLgnL1QNniSzPqlg8SpWR40DF50Riy8yJW5NzVqGR7/uxde+dX6DRc/+B
 Lb8+SkaK5yDa8Ymag70qByO5Xn/2TDAIzvAEoAuMVnYlnXcVGctsHPwGDyKPqzoERkIhKkjkV
 JNs0FB/IOgy5TIzayq3jnykAnc7Wu2VCcmmtZHAQfPKIP73nH5/1mvesWEWwR0J45kqyli5qR
 JNUGR1EkSRdT+KXvMRS3S0Pd3fD7KQ4TlHHaWClse5lIJ3fw8pIAdNv3Sr2cspIefy9lLOHsr
 rjDzWGPsbb2Mp9If7J5n1AR1enH+JSeIgjPpp4HFLM+gOp3m5aQWijzXzRy28+vC7oC27y71a
 vKJGgNZm+rj69TqaQxDvrbbWLrw1PwUQCziCZi65JSFKk57BEpflkg9Bag1TpauIaKGxQGvAV
 bOswCOsoy9XIzN+sT2XAlDYhpmqZ3cFCu6MAguC89HKCSgd0cytpnqVAJzH5vrClMA/84Sm2m
 1sSMsFAHO9H+h+njgFuBeGKBmxTPRhulKVWwqPPE0LZUJWz47V5xZDEabLerHIdtitrvPiD23
 Cqo7Mn1AOrVWWU0oyn9Ne9w+i4QfcMqwavK36fALEicDG2wA==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=DDgNOGcR;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.20 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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


> On 20 Aug 2019, at 09:04, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> Feel free to send some patch, addressing the differences between ARMv7 an=
d ARMv8 properly.

I=E2=80=99m afraid I=E2=80=99m lacking the necessary understanding of the A=
RM processor architecture to write a proper patch (plus I don=E2=80=99t hav=
e an ARMv7 system ready for testing). My rather hackish approach for now is=
 to extend the table and ignore any mapping request if the index exceeds th=
e table size.

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/E1ABA3D9-DAD1-4412-8D04-BC885C3C6EB9%40gmx.de.
