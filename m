Return-Path: <jailhouse-dev+bncBCFLNWPPWELBB2GXSX5AKGQEMMNKK6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A29A252144
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 21:52:09 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id x81sf23746wmg.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 12:52:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598385129; cv=pass;
        d=google.com; s=arc-20160816;
        b=Uo48ts6mgoIou7ysTp0TYw1YldPAfChLbJr73mvTWDkHftXGKQ2f2bOXyOAEYqrmQD
         LgeFEL5Lr6W4jVF9dnC4oquzMxCK9UQVE2a9rE3pZWErHkRlKDhte++jeXpjGjr+uzaf
         t+XvTt/GYopNRF0m5f2uj3jCDMl8ton921l/NeLo3A+bw8YTC9xnBiRCCcz46Feoyfxe
         YdfLQjnt7P5UQjTFG+Hqjic9reFIVuBj+6/Zeb0y+p+y6/skDUNL0xDTQXBGFDbgbEs+
         iDy+f5Jw8xRZ7pdTbz+9QyhvrNvWtBTu4zmcWetqG6XIRvGuVNWWqO6rFaVc9+/KkXsv
         KV3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=ug1EAf4tgh5nFa9XC9E12f1fNHIes9Vn6b+zeF5xCj0=;
        b=jxA7IFjCx2dQvlB+8veDN2dotqMVKbwFSwRSwka8eHdZMnjmz06sMRIP8HgEZJoqG2
         wgkhFgWnY8q5TlGEFenNGvjBSzn/gnrLO+LYWZNTKa28ikxaXDT+IlJbDiiqenV0reC5
         WSE9ltTqQ6bInwAAwKWuzN00OYp6f6sPrcUy5pdGVwlw4fgKfWdj7Y4D5SH++iIFWrI8
         M0duIgBayL/dTw5VJRxxnG5SRe5LYbaiLkliSM5+7okrD7gFpxegLfd1+m8fwZ0k0KON
         3SNSwbBl4btiYUHNmKvrweZfQzz5nNiy8zNWW+5fXkDKdMFCwF4MA/n+GLuPq9MNytUE
         uwtw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=goEqME59;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::632 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ug1EAf4tgh5nFa9XC9E12f1fNHIes9Vn6b+zeF5xCj0=;
        b=LVS37tU6ZJ3NDBTtXVKsPgDLLWzvHAfzmW9Xsen+7JU+7J/hNaegahKU4WWzrk7RhN
         pzHBv6SwkDmW5OMpZ5136fcn4YkM5H5TvnXzESy1j6AukxDsVcXQzocSQf8fGc+jNOVQ
         woZm6+VznTW5b28Eqw0xFYhUkpikTCqjY4L8dUICQA/cRSmo0CsETGaf2X6iid80/SZx
         RU7bkeSprX4AdMqHZrXgWkNxN8Gzo9o+GZ1ojREtra+IFOpFAghx/smwmtbebeKCWdJ0
         eOURwEk71NX2amnFfI0NMSsCuwqnctLZEkFt+WqJWIi1xhp39bO4QykIUAh1Ewthflvv
         oCVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ug1EAf4tgh5nFa9XC9E12f1fNHIes9Vn6b+zeF5xCj0=;
        b=Y4mXi857lUqJG8sITTkeQuQg018GUS8slvhZm96EWlWXg9NySZs8bW+CjhskaxF+ze
         BVIy29zCUDBngr/HNgPDAKjN0l2OFW+XMcmPsxunAVX+fKZXI8b2CXB5ZBGsBtfB3mWF
         h7y6rM3ImI1yKvN8O1f6pKSoLWcTHpQH0rUIakx8VvN5NxbTyDjiAmM9bALkFFQlpQtN
         BWqPqQWD/BKzJTyGnIenoq4E9PSY9wHtHDUTUD0BAAXkJhQBLSHWuVuCzWvT9Ls7pvTU
         cohmyDKnRc2bX8+UC/OYIOMNxmbg+2+GDUJC3zZuby1Xfpn/B2ACibK9xu9MM2C5QR4O
         Go6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ug1EAf4tgh5nFa9XC9E12f1fNHIes9Vn6b+zeF5xCj0=;
        b=VLCBbjagPIFQ2ZJCGPPHS6v41cZvPtdNvVi/ASqrrTFfboDDn8F61BXmcRo0bDNF3+
         8PEEFx/olsyUFi/if8E2RzgoSZ6zTjhH8bkzyMFi0bo05NLoi5gRXrU05cyo+GTWJqMz
         PSkn0bQdgJskH6iKlHId9FI+Czrnwnkv0cCQZpxmRG+g6PgC1e3neS80+AeFxkoDv5/N
         8d/nmv4O5MQxZt3hNrWdWJQAvSyGq0WLBAQjz0/YpJIeiHSie8f6w8veEKetWeLjUbVR
         UeuAhqXLLOShtjeLLz36y0wsT5xQiUc7qaM+S66+IMWBUCDk3Lk2GwcR6FvqvttO/ha9
         twKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530SflGdxD5HTXxiFxQdqXSp1A/yxtvpT9Vf0UlfSjIYTFD0EmsC
	0FmNatHTfVvYSLGh6tq3Ag4=
X-Google-Smtp-Source: ABdhPJxH/h13SNlQ0aim/A5HzNGIneQY/diz/Tcx31c2RfubREHgH1NqQNJ8IdMgvUYoNhtdA1Y8fg==
X-Received: by 2002:a1c:80ce:: with SMTP id b197mr3659228wmd.118.1598385129054;
        Tue, 25 Aug 2020 12:52:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:63c3:: with SMTP id c3ls28367wrw.1.gmail; Tue, 25 Aug
 2020 12:52:08 -0700 (PDT)
X-Received: by 2002:adf:fdcf:: with SMTP id i15mr3426372wrs.410.1598385128351;
        Tue, 25 Aug 2020 12:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598385128; cv=none;
        d=google.com; s=arc-20160816;
        b=siJA4j54zyHGlhnVzOIaWPAbiY/XfMn1gBKh9mct+lFuR/ObzAzhEsrsmNetwFN2g7
         dh5ZM0aHNqojtnjZk+h63d7BmA++YjJlPRX2iH3/uxv6vlqhk5FvoNcc9gw/qUEqRko4
         z3bojE9sZl1ywyXga9fh2Ks7H0j8pAQRx+4JGf00G6mSBxcoPHURCMnRA7XMskgXP4Om
         Y/lXMVJbKJvnZhH7jN57IsWiUrMpYjSr7o8e+S+WcsvHa6R5gizme3IbUkKpfY0G+VGX
         g2ExyoKrR8+ffh/BZNRlSi/SObAuN3bslL1yEBcZE70o23ydqMU4Gj65eJM0UzsHtj9u
         81xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ScY5fw1arycEZXtokGEnqe3uHSHUMMTvLjWXXUtf2D8=;
        b=FDkhW7yEAGSIjh2K7IqtGHZeuKBaI1+rVC3T36teyv1KLMDCg0r2iAE0FZFspYrA1p
         AIg7F0vF7Tk05oEpPam7JkyzPL744lyWxCghBgqK3Tvv5+uJgS1KLLoGkif8KGhwqTLy
         hp7oPeqDqkFKfbVdEQXSdRsiyb4/yKCf2ysrEWAcxvBNdM2o9XVluzY2QjAHlI4awBc2
         NQTz0TMS7wbmyDqHY/YFOw5c+u8/k9KrJ6XhClRImvJ0h5AmFWcXbAqAnGMHRmVZ+X98
         BHFOcM6spFdlAmLAsln4gYhAL0HALIkpfvWdNTHTNKVHDNKhgwqNrCEuBTte3st1WpV5
         ixsg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=goEqME59;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::632 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com. [2a00:1450:4864:20::632])
        by gmr-mx.google.com with ESMTPS id w6si1460wmk.2.2020.08.25.12.52.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 12:52:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::632 as permitted sender) client-ip=2a00:1450:4864:20::632;
Received: by mail-ej1-x632.google.com with SMTP id oz20so13187552ejb.5
        for <jailhouse-dev@googlegroups.com>; Tue, 25 Aug 2020 12:52:08 -0700 (PDT)
X-Received: by 2002:a17:906:fb89:: with SMTP id lr9mr8383501ejb.345.1598385128106;
 Tue, 25 Aug 2020 12:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAD6ScS_uBX7NCU+VinzamffEFH_kfh4B-MfR8nxt7+5VuNpRUA@mail.gmail.com>
 <0d84ce9a-60dd-c81e-d879-a278c8602054@web.de> <CAD6ScS-U0Rh_yWeH-DhRXT587ndXpJZ1m9=9-_uDOGPehzHWhw@mail.gmail.com>
In-Reply-To: <CAD6ScS-U0Rh_yWeH-DhRXT587ndXpJZ1m9=9-_uDOGPehzHWhw@mail.gmail.com>
From: Prakhar Bansal <prakharbansal0910@gmail.com>
Date: Tue, 25 Aug 2020 12:51:32 -0700
Message-ID: <CAD6ScS-LvNcQ0b6f-NxYuVQqYD8c-zL416WoGhB9igcMAbDRsw@mail.gmail.com>
Subject: Re: Libvirt driver for Jailhouse- Test set up in jailhouse demo-image
To: Jan Kiszka <jan.kiszka@web.de>
Cc: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000c6711a05adb90930"
X-Original-Sender: prakharbansal0910@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=goEqME59;       spf=pass
 (google.com: domain of prakharbansal0910@gmail.com designates
 2a00:1450:4864:20::632 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
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

--000000000000c6711a05adb90930
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

Could you please suggest how can I increase the RAM for jailhouse-image?
As it is 1GB by default, I need to increase it to build libvirt using new
meson build system in libvirt.

Thanks,
Prakhar

On Tue, Jul 21, 2020 at 11:32 PM Prakhar Bansal <prakharbansal0910@gmail.com>
wrote:

> Thank you, Jan.
> It works.
>
> Thanks,
> Prakhar
>
> On Tue, Jul 21, 2020 at 2:12 AM Jan Kiszka <jan.kiszka@web.de> wrote:
>
>> On 21.07.20 10:14, Prakhar Bansal wrote:
>> > Hi Jan,
>> >
>> > I am not able to set up the test environment by mounting host folders
>> > into the jailhouse demo image- QEMU/KVM Intel-x86 virtual target, as you
>> > suggested last week. Since this demo-image is created directly from
>> > QEMU-system and not by using Libvirt, I can't manage it through
>> > virsh/virt-manager.
>> > Also, the space in demo-image is not enough to build Libvirt inside it.
>> > Please help with the setting up the test environment for testing the
>> > driver in the demo-image.
>>
>> Try
>>
>> start-qemu.sh x86 \
>>    -fsdev local,path=/some/host/path/,security_model=none,id=vfs \
>>    -device virtio-9p-pci,addr=1f.7,mount_tag=host,fsdev=vfs
>>
>> and mount the host inside the guest like this
>>
>> mount -t 9p -o trans=virtio host /mnt
>>
>> Jan
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAD6ScS-LvNcQ0b6f-NxYuVQqYD8c-zL416WoGhB9igcMAbDRsw%40mail.gmail.com.

--000000000000c6711a05adb90930
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jan,<div><br></div><div>Could you please suggest how ca=
n I increase the RAM for jailhouse-image?</div><div>As it is 1GB by default=
, I need to increase it to build libvirt using new meson build system in li=
bvirt.</div><div><br></div><div>Thanks,</div><div>Prakhar</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul =
21, 2020 at 11:32 PM Prakhar Bansal &lt;<a href=3D"mailto:prakharbansal0910=
@gmail.com">prakharbansal0910@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr">Thank you, Jan.<div>It works.</div><div><br></div><d=
iv>Thanks,</div><div>Prakhar</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 21, 2020 at 2:12 AM Jan Kiszk=
a &lt;<a href=3D"mailto:jan.kiszka@web.de" target=3D"_blank">jan.kiszka@web=
.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-l=
eft-color:rgb(204,204,204);padding-left:1ex">On 21.07.20 10:14, Prakhar Ban=
sal wrote:<br>
&gt; Hi Jan,<br>
&gt;<br>
&gt; I am not able to set up the test environment by mounting host folders<=
br>
&gt; into the jailhouse demo image- QEMU/KVM Intel-x86 virtual target, as y=
ou<br>
&gt; suggested last week. Since this demo-image is created directly from<br=
>
&gt; QEMU-system and not by using Libvirt, I can&#39;t manage it through<br=
>
&gt; virsh/virt-manager.<br>
&gt; Also, the space in demo-image is not enough to build Libvirt inside it=
.<br>
&gt; Please help with the setting up the test environment=C2=A0for testing =
the<br>
&gt; driver in the demo-image.<br>
<br>
Try<br>
<br>
start-qemu.sh x86 \<br>
=C2=A0 =C2=A0-fsdev local,path=3D/some/host/path/,security_model=3Dnone,id=
=3Dvfs \<br>
=C2=A0 =C2=A0-device virtio-9p-pci,addr=3D1f.7,mount_tag=3Dhost,fsdev=3Dvfs=
<br>
<br>
and mount the host inside the guest like this<br>
<br>
mount -t 9p -o trans=3Dvirtio host /mnt<br>
<br>
Jan<br>
</blockquote></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAD6ScS-LvNcQ0b6f-NxYuVQqYD8c-zL416WoGhB9igcMAbDRs=
w%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAD6ScS-LvNcQ0b6f-NxYuVQqYD8c-zL416WoGhB9ig=
cMAbDRsw%40mail.gmail.com</a>.<br />

--000000000000c6711a05adb90930--
