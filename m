Return-Path: <jailhouse-dev+bncBCC7DQPESQPRBKF7VHUAKGQEUMQ4OYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x539.google.com (mail-pg1-x539.google.com [IPv6:2607:f8b0:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C774BDDB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 18:15:38 +0200 (CEST)
Received: by mail-pg1-x539.google.com with SMTP id 14sf12552105pgo.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 09:15:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560960936; cv=pass;
        d=google.com; s=arc-20160816;
        b=ojD3V8zaXrHHkb4QcfMqZv+uBoFcA6RyjciPR5ZyTi+xYNalxPVAUPLAcIA81fEQve
         JoauCHWesGugK/h3rM+2zz5dWKT9PsiROWIe0Vedx8fv8qKfASNzZ2uzaNBFcBTttbtA
         oXDIBbWWG6XRsyfepdt7EWKKvQSvL3Auezc0nyL1hDz+zx2YHwntFWcgh/kceskmGqkp
         96QfwuKxGOGNRxUQKMs5uxFL6lsVBfjcXyTDEvrJS0dcVrJIxFRcHfbWBBMGqXAawtLg
         Hxen7vhFoH+rFKB7/xA8OynY6k4lbzXzPUB5HCanvEMUjRt2pYrfjQrioCyBdR5blmjG
         oJ3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=K/KKVEfLCKkhw9bKTwgUToPTz+hbqHYuhex5ydqUl/Y=;
        b=WDXapenS1DStsg6aD96i+ZCr3a62Dr/dCyCi48IAvhCoZb6oRK26nmAZFUU8GVLOuJ
         k96h6EkLOZvFjxGdA8wHu1mdxkG4Y2HRVyVEwiD/dB9/HVNYy+6oWvt1mBuGpxVICgc5
         fFYxL5tyMgynmOni6xaS/LwWpAZHR2/ok8TCTictNNgcNax1Hr/dWY9GOsNY+YCSDVNO
         o4CQzA5AjzATTYItwQdml0+128xvkodXnYP82Vsjvr9NF+72168hQVdwqNC4BGAU2WPq
         UJtOkczQk5PnoS1Lgot0usctwrXHUAMWUg0rcCeNUxp8VsARLWdKBwndkOSXEH21J5Ec
         aHCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=t6z2XajS;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::742 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=K/KKVEfLCKkhw9bKTwgUToPTz+hbqHYuhex5ydqUl/Y=;
        b=MqElZeFPu5d+8JloIBzrhBUsOm6aT/pdigCO8LKcL/I+ihy2v6PW/cTTmsg7z0QwBI
         /UmF1oadS5fxE9NpIrxezd1pORg3cnXcw4jwPQc1At6/btXzdBMjlluOlU4049YGhMgY
         RTFlIhFFFRYnwdh6hDrP4KUP1kl6fEy3v035xSOzSBgxQV6Ln5Izge8RB31/bjtA+caZ
         PNygDzLpte4kXd0EqDaDQEaav4IF2k4kAIh/cOwyENoTWuePN4gIYdYZezGOo8Zpz0h6
         8UaLqzt8wkTNUZVroiJqzY9lzkil37Gi3LEFSUz3uevLO4ReTg6EbFtnk+Qlj9feF35y
         ov4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=K/KKVEfLCKkhw9bKTwgUToPTz+hbqHYuhex5ydqUl/Y=;
        b=VN2YuoUwW06zVaooFEtPKpAbccEYNw3aQJ5eozAcKva4Ir0e65pUWSmUijm3BSnqsb
         OOYW+k+SF00y036ev9P6Lr89sBBIcOxi98jy173h1xhVJC7PWozaSuncfal4j4HrN85s
         AellCPPyGUwEgB+38muLJudxvPPxuGKwCQXGuxvM29MBNKFAGYtQ74u//2PY4U9cCZBq
         nsIyO476fPQME/vwHBKiMfGiymCdRKBzkQwddT8MsQxTYtAphflk4C3KwI/MKnnnc0lt
         fCjQ/pCtvbytLoTLBCaU1sasETL1x80R0o/8+Q9Q7x74JfUXAzVi28xD8USt+KXHBRKp
         IBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=K/KKVEfLCKkhw9bKTwgUToPTz+hbqHYuhex5ydqUl/Y=;
        b=ripInyWuvep2Ol8tkicya6JLpiS5srP0ns5OpuqmFWBSWVKqk8G8ucHfQDML67oBL8
         TvFN2ZkH5veuf4oyudlId+ZIArs/dET6sc/2PECVmSbZbogTmTdMM1w0ovZVLtvY/HDq
         49vDaSO93jCNDbqbD+7HvDzY38B02eDK7v7Tp+XalJl+kyzEIQO1ffSUeP/nAtwx08uv
         e3nfI5rVIL6GHL8n9jhCxItXFTQ1GxeEm/eq8bPWrFoaXwRBmiURNOEpJC2Q7GfyfoNR
         KYYzBOjd5qXKafDoVitMMk6R8t6coF0seA18YylyIvpzWDVkRL1AQvrSWNAbXt9l3j5M
         0lcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUKIeuOI7+wBbYBZeOxri2Nt7g/dAo5rQ0IpVvCDJWJauD0qzyU
	nMxej9pp+6C44OnK6bQVsH8=
X-Google-Smtp-Source: APXvYqwGiBUIIrKJotOZfUVlIQFmfD2kCITCbvIbF8IrpjFSLAvVVPpVrlSHDRyGrMMB9vnv1736SA==
X-Received: by 2002:a63:214f:: with SMTP id s15mr8358304pgm.71.1560960936441;
        Wed, 19 Jun 2019 09:15:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:fe03:: with SMTP id p3ls601732pgh.8.gmail; Wed, 19 Jun
 2019 09:15:35 -0700 (PDT)
X-Received: by 2002:a63:6c87:: with SMTP id h129mr8635095pgc.427.1560960935659;
        Wed, 19 Jun 2019 09:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560960935; cv=none;
        d=google.com; s=arc-20160816;
        b=r6O/XtE2ftfrDF3ldg/T8UEnJ4wYnd7Z5gWGO29bpx5Z22XhDM1K8FnkkEvpfZSEME
         ZGyrDLIoVJRbnqT13AkSkQeietaAEHU+wNG1J/NghYZpjcR6NN/0RDvPTyPX2VgOecOj
         4JqlsQDFimAiixLUJ34uO1ubcRONnfm4re54J4LrMEBJ61eaumerd/i4UchncEKgIFuj
         BIWluCCyL9H0LVNIS/tEU0eb5L88N8AD6dINTGoE2WmNJTXuHXeEy7go3jVt+bXA9G5N
         5sRrCqVWO0IvgJtwFlyf6GCTrLGJ1Pb8MUdRkCaIfqjS+5WZ4J7iRf0QW90O4nyXuwcc
         S/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EKD42m42/1NSYn2vENx6t6TqLESH1lFNT9hmOdJnYdw=;
        b=u/rr5c6BnCMxbAIuqhRNzFbU0rgUeC2FlmwiCsET1aEmRojH9e74ofkVt+NF0QqxHU
         gs5w9x5/DQzuSar5EvCqTJnnFOcmcr44/I/MQhgpywZiiUOIjeMlpRXT/2bzrgvXULFY
         E3d2fFRsvfH2h2ROWT9/z+C2c7oEAO8np4oIS0x4bpCKzA5r7xJA7sK70ITpIYzPpg2X
         RBxNTy+UPmuBLnkFFezNPWyYRAcUkz0FoE3ecseTA5LZQ8w5B1CRkH9VEOk899GEESkx
         GcQNC54sR/AcNUDsTuKuwSNH1UjJCRwenwn9FwCi7LOYX54LwWMYT2MaI6lPqOS1dBnh
         Q33w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=t6z2XajS;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::742 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com. [2607:f8b0:4864:20::742])
        by gmr-mx.google.com with ESMTPS id t35si34339pjb.3.2019.06.19.09.15.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 09:15:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::742 as permitted sender) client-ip=2607:f8b0:4864:20::742;
Received: by mail-qk1-x742.google.com with SMTP id g18so11288982qkl.3
        for <jailhouse-dev@googlegroups.com>; Wed, 19 Jun 2019 09:15:35 -0700 (PDT)
X-Received: by 2002:a37:4b56:: with SMTP id y83mr57430422qka.338.1560960934863;
 Wed, 19 Jun 2019 09:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <CA++Khc13nuahbog_WVD-BJi0asHEa8TxMAvB5M5damJGJ_5inA@mail.gmail.com>
 <d2e2b271-4e43-4126-5433-8304d4984e7a@oth-regensburg.de> <CA++Khc2LGq3gGydG2Ojxn2xcbPoc6VzvhoO4_ikFMFMdQ_aYOg@mail.gmail.com>
 <bd92264a-60c1-6f76-07f0-93cb9bd08a01@siemens.com> <CA++Khc0seBDnN2hD7EJh3g25unUEFqBuiRSm5HwOE+1JEX0D2Q@mail.gmail.com>
 <63552042-48d0-cb32-e893-28ae4ab29ccd@siemens.com> <CA++Khc3Mj=SFen+_f7RE5g1Paq1AhHQOrBX3HqNoJvvbymQh0w@mail.gmail.com>
 <5b90a899-c42a-a360-8398-c3af35920765@siemens.com> <CA++Khc0whU3=U86WGNEtLUZoOkKuYLiEA+nqOjW1UFcRDeGTRQ@mail.gmail.com>
 <0da95034-9bd0-4415-4d3b-5f6687a84563@siemens.com> <CA++Khc1Xjt8yMT39shFraJnzSWp8Ctc9-Cv-mNxOqf+UkxhyxA@mail.gmail.com>
 <36306f60-8b63-f32d-2559-3a1ca6f53e87@siemens.com> <CA++Khc3hURr3dFrw2ga=uf9A02KZ1OEEtMAPOVJyCAP3Fs+fmw@mail.gmail.com>
 <889c96a9-a7dc-4385-28e5-437fbc4d5008@siemens.com> <CA++Khc2-Cv==+eJCS8cN-ShK7q==Qs7UpW-ZfoUcEZ2Tam5c7Q@mail.gmail.com>
 <3bb0abe5-55ca-b9b5-edff-6bc8d0ef85af@siemens.com> <CA++Khc2YjAfFL1x-uU_N9FoUhZUMSsKQ2bKHAbd17U=HA_90Nw@mail.gmail.com>
In-Reply-To: <CA++Khc2YjAfFL1x-uU_N9FoUhZUMSsKQ2bKHAbd17U=HA_90Nw@mail.gmail.com>
From: Wayne <racedrive1503@gmail.com>
Date: Wed, 19 Jun 2019 12:15:23 -0400
Message-ID: <CA++Khc0Kev1DGnKeKr2Dd3B4qHWZxZFrgDsMFQ1PX+OHYxDNsA@mail.gmail.com>
Subject: Re: Linux non-root node question
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000007e82b058baf8a05"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=t6z2XajS;       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::742
 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;       dmarc=pass
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

--00000000000007e82b058baf8a05
Content-Type: text/plain; charset="UTF-8"

Hi Jan:

I figured out my problem with Jailhouse throwing the "Cannot allocate
memory" error when trying to create a guest cell with more than 200MB RAM.
I had to increase my hypervisor memory size from 6MB to 64MB.  Now I can
unpack my larger root initramfs (~70MB) successfully, but now that falls
into the dracut emergency shell too.  This appears to be occurring when the
kernel tries to pivot/switch to the "real" root filesystem.

I can boot into a real kernel prompt with your rootfs.cpio, but I really
would like to be running a copy of the full root linux....just with the
filesystem being entirely in the ramdisk.  Any thoughts on how to
accomplish this?  It seems like buildroot can generate images based on
busybox, with the ash shell.  I really would like bash support.

Thanks for all of your help getting to this point,
Wayne

On Tue, Jun 18, 2019 at 1:09 PM Wayne <racedrive1503@gmail.com> wrote:

> Jan:
>
> To summarize:
> 1. My smaller guest initramfs (~30MB) unpacks properly, but then falls
> into the dracut emergency shell.  Now that i'm using minicom it no longer
> scrolls repeatedly.  I still can't get to a proper kernel login prompt.
> 2. My larger root initramfs (~70MB) fails to unpack, and also jailhouse
> fails to create the guest if I attempt to allocate more memory.
> 3. I can get to the kernel login prompt (and login successfully) if I use
> your rootfs.cpio binary.  This option so far is the most promising.
>
> Thanks for your assistance,
> Wayne
>
> On Tue, Jun 18, 2019 at 12:01 PM Jan Kiszka <jan.kiszka@siemens.com>
> wrote:
>
>> On 18.06.19 17:48, Wayne wrote:
>> > Jan/Ralf:
>> >
>> > Ok, with the rootfs.cpio you just provided I can see the following on
>> my serial
>> > port:
>> >
>> > Welcome to Buildroot
>> > jailhouse login:
>> >
>> > So that's progress.  Is there a default user name and password to use
>> to
>> > complete the login?  That would point to the problem being booting
>> against my
>> > initramfs files.
>>
>> "root" without password is the login.
>>
>> >
>> > Also, the issue where my serial output scrolled continuously was due to
>> the
>> > capture method.  I switched to minicom and no longer see that occur.
>>
>> OK, consistent sign. Then we are back to a size issue, not a format
>> problem: You
>> larger image is too large, but enlarging the inmate does not work. If it
>> would,
>> your larger image will likely boot as well.
>>
>> >
>> > Any further thoughts on why jailhouse fails to load the guest when I
>> set the
>> > memory region greater than 200MB?
>>
>> I need to analyze your config, maybe try it out.
>>
>> Jan
>>
>> --
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>> Corporate Competence Center Embedded Linux
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0Kev1DGnKeKr2Dd3B4qHWZxZFrgDsMFQ1PX%2BOHYxDNsA%40mail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--00000000000007e82b058baf8a05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jan:<div><br></div><div>I figured out my problem with J=
ailhouse throwing the &quot;Cannot allocate memory&quot; error when trying =
to create a guest cell with more than 200MB RAM.=C2=A0 I had to increase my=
 hypervisor memory size from 6MB to 64MB.=C2=A0 Now I can unpack my larger =
root initramfs (~70MB) successfully, but now that falls into the dracut eme=
rgency shell too.=C2=A0 This appears to be occurring when the kernel tries =
to pivot/switch to the &quot;real&quot; root filesystem.</div><div><br></di=
v><div>I can boot into a real kernel prompt with your rootfs.cpio, but I re=
ally would like to be running a copy of the full root linux....just with th=
e filesystem being entirely in the ramdisk.=C2=A0 Any thoughts on how to ac=
complish this?=C2=A0 It seems like buildroot can generate images based on b=
usybox, with the ash shell.=C2=A0 I really would like bash support.</div><d=
iv><br></div><div>Thanks for all of your help getting to this point,</div><=
div>Wayne<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Jun 18, 2019 at 1:09 PM Wayne &lt;<a href=3D"mai=
lto:racedrive1503@gmail.com">racedrive1503@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Jan:<d=
iv><br></div><div>To summarize:</div><div>1. My smaller guest initramfs (~3=
0MB) unpacks properly, but then falls into the dracut emergency shell.=C2=
=A0 Now that i&#39;m using minicom it no longer scrolls repeatedly.=C2=A0 I=
 still can&#39;t get to a proper kernel login prompt.</div><div>2. My large=
r root initramfs (~70MB) fails to unpack, and also jailhouse fails to creat=
e the guest if I attempt to allocate more memory.</div><div>3. I can get to=
 the kernel login prompt (and login successfully) if I use your rootfs.cpio=
 binary.=C2=A0 This option so far is the most promising.</div><div><br></di=
v><div>Thanks for your assistance,</div><div>Wayne</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 18, 201=
9 at 12:01 PM Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com" targ=
et=3D"_blank">jan.kiszka@siemens.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On 18.06.19 17:48, Wayne wrote:<br>
&gt; Jan/Ralf:<br>
&gt; <br>
&gt; Ok, with the rootfs.cpio you just provided I can see the following on =
my serial <br>
&gt; port:<br>
&gt; <br>
&gt; Welcome to Buildroot<br>
&gt; jailhouse login:<br>
&gt; <br>
&gt; So that&#39;s progress.=C2=A0 Is there a default user name and passwor=
d to use to <br>
&gt; complete the login?=C2=A0 That would point to the problem being bootin=
g against my <br>
&gt; initramfs files.<br>
<br>
&quot;root&quot; without password is the login.<br>
<br>
&gt; <br>
&gt; Also, the issue where my serial output scrolled continuously was due t=
o the <br>
&gt; capture method.=C2=A0 I switched to minicom and no longer see that occ=
ur.<br>
<br>
OK, consistent sign. Then we are back to a size issue, not a format problem=
: You <br>
larger image is too large, but enlarging the inmate does not work. If it wo=
uld, <br>
your larger image will likely boot as well.<br>
<br>
&gt; <br>
&gt; Any further thoughts on why jailhouse fails to load the guest when I s=
et the <br>
&gt; memory region greater than 200MB?<br>
<br>
I need to analyze your config, maybe try it out.<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
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
om/d/msgid/jailhouse-dev/CA%2B%2BKhc0Kev1DGnKeKr2Dd3B4qHWZxZFrgDsMFQ1PX%2BO=
HYxDNsA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0Kev1DGnKeKr2Dd3B4qHWZxZFr=
gDsMFQ1PX%2BOHYxDNsA%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--00000000000007e82b058baf8a05--
