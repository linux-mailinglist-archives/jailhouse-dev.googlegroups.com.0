Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBB5OC275AKGQEZTBRLMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A43E25F3FE
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 09:29:58 +0200 (CEST)
Received: by mail-qk1-x740.google.com with SMTP id j5sf7228753qka.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 00:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TKCWgBUMq5DB1edAEacoK0FbDjcul7K7KtIEDYW98DQ=;
        b=N2c64HbKEmrygze4FVAaebOQ18CfZu3PpELiZo/UT3AnhEFCKlEZiEwIyY9oByFGMt
         c+NGQJmOtgat1rM4Xlu15R9eSvdN/HoUU72LhCdCQ1/ihTjYImkGuzrj4usPisdrLAzr
         74fOBZ9GAfcOMkufYpayNrlJwLA3mPWU0K+EfviZATcTZHjJWBxYD3zwdpW1R6NGXofJ
         5fNH9SvG4eExY2jInOVCRnB8l9Cb0tMF9tC8UQdi26XrWmh+AADN9HYllIrDsIa4Z/Kw
         H0cMSWVyxqXakLN5/k4d4YG38daCR1sy0+sb9mv9E1/5GvERuMioF6qelkXIKWCcmtHo
         1Stg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TKCWgBUMq5DB1edAEacoK0FbDjcul7K7KtIEDYW98DQ=;
        b=Qm6dyFhOsiMvgsTNQVvPk/sz6zTuoKFpVIBgzl0At/VwpNH3Mw2s5XmYx2B26ywkHy
         W6a8Zci4aVnDJjLWVzpxnGJKpWtn5Jw28UtgGvl2w7oxpvUkFTatrthEwvE4NMm1wOnm
         1E5eyi969PpuBCvm9MTAhwRBowAF1lxZz/BWH+LN9FnY28O+qHptI5An+iJj7YxL6z54
         hDpWKPOvGvqYnFrH4w7mHOsshfoS/vKOvzL8LMiG1AABN/5w9DcKjZsaEgDto4EPboZj
         vFCR3Ee86sDVIJh46aM9TsV+nhhxAGYsga6WJE3dxHhkvHsXvAPqI2VP5Fu+x2uEEFla
         ZLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TKCWgBUMq5DB1edAEacoK0FbDjcul7K7KtIEDYW98DQ=;
        b=YoWTofWHqlanVKUWW9hPNXOexIoP/MH/UMXWK2akU9McZdtreBSCmAUs1SErxtfesN
         0mu9NwT21gPrFhl8GGQLReBvC7ovXKmHHQntXljSlEVae3G9TPlsIynx7kQplFbJ9XCJ
         8ZJenlAAm1gpkoKX9qIutWV20H0X16R38R2Vj24GVEXv6nZS1SSmj4kVLIHRIve4jOI2
         8RTl7bffD9SUkCV1GD51X3lsWJcDn71fSN+h1GXVay23teKxfgWBBLDPWrz4/uelMnSn
         yBHTy1Ka39uqL/NdAE/Gxx54fk1NWlOAaAS0ZF1YDNcCcS+OStEfHby0IIbqeza2GZKV
         qZXw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5316FjnXYrmqypuRryFrCihnZ57fP/W9ALpa4TREhUkA9vKFbZFq
	WdZoOZDdF8raNw5sKtl0NwA=
X-Google-Smtp-Source: ABdhPJx8GM3+Oxs4aee70zpXc+057sUf72RLGG6YZIWj0dzQM7HuBm1vOfc9vDYOgGpkRhuRR7oGAw==
X-Received: by 2002:aed:36aa:: with SMTP id f39mr6555249qtb.297.1599463797260;
        Mon, 07 Sep 2020 00:29:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:f50b:: with SMTP id l11ls7753671qkk.6.gmail; Mon, 07 Sep
 2020 00:29:56 -0700 (PDT)
X-Received: by 2002:a37:897:: with SMTP id 145mr7484629qki.82.1599463796675;
        Mon, 07 Sep 2020 00:29:56 -0700 (PDT)
Date: Mon, 7 Sep 2020 00:29:55 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
In-Reply-To: <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1590_1924795540.1599463795867"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_1590_1924795540.1599463795867
Content-Type: multipart/alternative; 
	boundary="----=_Part_1591_107726599.1599463795867"

------=_Part_1591_107726599.1599463795867
Content-Type: text/plain; charset="UTF-8"

Hi Jan!

Thanks for the kernel configuration!

Now I try to build a Linux kernel with CONFIG_STRICT_DEVMEM and 
CONFIG_IO_STRICT_DEVMEM deactivated.
Maybe the hardware check will work then.

Regarding the configuration for the root cell:
I do not build the hypervisor "jailhouse" on the target, but under Yocto on 
a development PC.
But then I'll create the configuration for the root cell on the target with 
"jailhouse config create sysconfig.c".
Do I now have to copy this configuration and run the build process again 
under Yocto so that I get the binary form of the configuration?
What is the best workflow for developing with Yocto?

Best regards
Jan.


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6765e219-706a-4124-9ac2-d40109d69f7cn%40googlegroups.com.

------=_Part_1591_107726599.1599463795867
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Jan!</div><div><br></div><div>Thanks for the kernel configuration!<=
/div><div><br></div><div>Now I try to build a Linux kernel with CONFIG_STRI=
CT_DEVMEM and CONFIG_IO_STRICT_DEVMEM deactivated.</div><div>Maybe the hard=
ware check will work then.</div><div><br></div><div>Regarding the configura=
tion for the root cell:</div><div>I do not build the hypervisor "jailhouse"=
 on the target,=20
<span><span>but under Yocto on a development PC.</span></span></div><div><s=
pan><span>But then I'll create the configuration for the root cell on the t=
arget with "jailhouse config create sysconfig.c".<br></span></span>

</div><div>Do I now have to copy this configuration and run the build proce=
ss again under Yocto so that I get the binary form of the configuration?</d=
iv><div>What is the best workflow for developing with Yocto?</div><div><br>=
</div><div>Best regards</div><div>Jan.<br></div><div><br></div><div><br></d=
iv>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6765e219-706a-4124-9ac2-d40109d69f7cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6765e219-706a-4124-9ac2-d40109d69f7cn%40googlegroups.co=
m</a>.<br />

------=_Part_1591_107726599.1599463795867--

------=_Part_1590_1924795540.1599463795867--
